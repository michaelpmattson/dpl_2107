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
end
