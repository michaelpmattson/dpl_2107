class Book
  attr_reader :title,
              :checkout_times

  def initialize(params)
    @title             = params[:title]
    @author_first_name = params[:author_first_name]
    @author_last_name  = params[:author_last_name]
    @publication_date  = params[:publication_date]
    @checkout_times    = 0
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  def publication_year
    @publication_date.slice(-4, 4)
  end

  def checkout
    @checkout_times += 1
  end
end
