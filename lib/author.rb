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
    params = {
      title: title,
      author_first_name: @author_first_name,
      author_last_name: @author_last_name,
      publication_date: publication_date
    }
    book = Book.new(params)
    @books << book
    book
  end

  def first_book_year
    min = @books.min_by do |book|
      book.publication_year
    end
    min.publication_year
  end

  def last_book_year
    max = @books.max_by do |book|
      book.publication_year
    end
    max.publication_year
  end
end
