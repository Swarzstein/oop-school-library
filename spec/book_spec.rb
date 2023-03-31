require_relative '../classes/book'

describe Book do
  context 'When testing the Book class' do
    book = Book.new('La Esfera', 'Augusto')
    it "Should return 'Augusto' if we check the Author" do
      expect(book.author).to eq 'Augusto'
    end
    it "Should return 'La Esfera' if we check the Title" do
      expect(book.title).to eq 'La Esfera'
    end
    it "Should return '0' if we check the book's rentals without any rental" do
      expect(book.rentals.length).to eq 0
    end
    it "Should return '3' if we check the book's rentals after adding 3 rentals" do
      book.rentals.push('rent', 'rent', 'rent')
      expect(book.rentals.length).to eq 3
    end
    it 'Converts data into json format ' do
      json_sample_data = '{"title":"La Esfera","author":"Augusto"}'
      book_obj = book.to_json
      expect(book_obj).to eq(json_sample_data)
    end
  end
end
