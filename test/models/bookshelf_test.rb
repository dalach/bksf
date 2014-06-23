require 'test_helper'

class BookshelfTest < ActiveSupport::TestCase

  test "should be valid" do
    assert bookshelves(:one).valid?
  end

  test "shoukd have name" do
    bookshelves(:one).name = nil
    assert_not bookshelves(:one).valid?
  end
end
