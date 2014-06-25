require 'test_helper'

class BookshelfTest < ActiveSupport::TestCase

  test "should be valid" do
    assert bookshelves(:one).valid?
  end

  test "should have name" do
    bookshelves(:one).name = nil
    assert_not bookshelves(:one).valid?
  end

  test "should create permalink" do
    assert_equal("1-my-favourite-books", bookshelves(:one).permalink)
  end
end
