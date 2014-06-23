class Bookshelf < ActiveRecord::Base
  validates :name, presence: true
end
