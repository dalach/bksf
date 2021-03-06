class Book < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  validates :title, :author, presence: true
  validates_format_of :cover, with: %r{\.gif|jpg|png}i, :message => "Upload a cover photo jpg/jpeg/png"  
  has_many :book_on_bookshelves
  has_many :booksheves, :through => :book_on_bookshelves
end
