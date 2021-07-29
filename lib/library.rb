class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name    = name
    @books   = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten!
  end

  def publication_time_frame_for(author)
    {
      start: author.first_book_year,
      end:   author.last_book_year
    }
  end
end
