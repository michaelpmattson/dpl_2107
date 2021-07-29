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
    if !@books.include?(book)
      false
    elsif @books.include?(book)
      if @checked_out_books.include?(book)
        false
      else
        @checked_out_books << book
        book.checkout
        true
      end
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    most_popular_book = books.first
    @books.each do |book|
      # require "pry"; binding.pry
      if book.checkout_times > most_popular_book.checkout_times
        most_popular_book = book
      end
    end
    most_popular_book
  end
end
