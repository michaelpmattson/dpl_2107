require './lib/book'
require './lib/author'

RSpec.describe Author do
  describe '#initialize' do
    it 'exists' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      expect(charlotte_bronte).to be_an_instance_of(Author)
    end
  end

  describe '#name' do
    it 'full name' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end
  end

  describe '#write' do
    it 'returns a new Book object' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre).to be_an_instance_of(Book)
    end

    it 'adds the book to books' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      expect(charlotte_bronte.books).to eq([])

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end

  describe '#first_book_year' do
    it 'first_book_year' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.first_book_year).to eq("1847")
    end
  end

  describe '#last_book_year' do
    it 'last_book_year' do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.last_book_year).to eq("1853")
    end
  end
end
