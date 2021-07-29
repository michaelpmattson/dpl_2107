require './lib/book'

RSpec.describe Book do
  describe '#initialize' do
    it 'exists' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book).to be_an_instance_of(Book)
    end

    it 'has attributes' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book.title).to eq("To Kill a Mockingbird")
    end
  end

  describe "#author" do
    it "author full name" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book.author).to eq("Harper Lee")
    end
  end

  describe "#publication_year" do
    it 'year string' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book.publication_year).to eq("1960")
    end
  end

  describe '#checkout' do
    it 'adds 1 to checkout_times' do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book.checkout_times).to eq(0)

      book.checkout
      book.checkout

      expect(book.checkout_times).to eq(2)
    end
  end
end
