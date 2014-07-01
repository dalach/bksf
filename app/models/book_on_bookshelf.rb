class BookOnBookshelf < ActiveRecord::Base
  belongs_to :book
  belongs_to :bookshelf

  def user_bookshelf
    BookOnBookshelf.all.select{ |bookOnBookshelf| bookOnBookshelf.bookshelf.id == current_user.bookshelf.id }
  end

  def user_books
    user_bookshelf.each do |bookOnBookshelf|
      Books.all.select {|book| book.id == bookOnBookshelf.book_id}
    end
  end
end
