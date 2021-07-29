class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name              = name
    @books             = []
    @authors           = []
    @checked_out_books = []
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

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      book.checkout
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.max_by do |book|
      book.checkout_times
    end
  end
end
