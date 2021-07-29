class Author
  attr_reader :books

  def initialize(params)
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, publication_date)
    book = Book.new({title: title, author_first_name: @author_first_name, author_last_name: @author_last_name, publication_date: publication_date})
    @books << book
    book
  end

  def first_book_year
    first = @books.first.publication_year
    @books.each do |book|
      first = book.publication_year if book.publication_year.to_i < first.to_i
    end
    first
  end

  def last_book_year
    last = @books.first.publication_year
    @books.each do |book|
      last = book.publication_year if book.publication_year.to_i > last.to_i
    end
    last
  end
end
