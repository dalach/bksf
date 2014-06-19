require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book should be valid" do
    assert books(:one).valid?
  end

  test "book should have title" do
    books(:one).title = nil
    assert_not books(:one).valid?
  end

  test "book should have author" do
    books(:one).author = nil
    assert_not books(:one).valid?
  end

  test "book should have cover" do
    books(:one).cover = nil
    assert_not books(:one).valid?
  end

  test "accept only png/jpg/jpeg file as cover" do
    books(:one).cover = 'text.txt'
    assert_not books(:one).valid?
  end
end
