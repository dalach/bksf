class Bookshelf < ActiveRecord::Base
  validates :name, presence: true
  has_many :book_on_bookshelves
  has_many :books, :through => :book_on_bookshelves
  belongs_to :user

  def to_param
    permalink
  end

  def permalink
    "#{user.id}-#{name.parameterize}"
  end

end
