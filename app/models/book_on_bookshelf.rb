class BookOnBookshelf < ActiveRecord::Base
  belongs_to :book
  belongs_to :bookshelf
end
