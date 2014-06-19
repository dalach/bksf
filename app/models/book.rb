class Book < ActiveRecord::Base
  validates :title, :author, presence: true
  validates_format_of :cover, with: %r{\.gif|jpg|png}i, :message => "Upload a cover photo jpg/jpeg/png"  
end
