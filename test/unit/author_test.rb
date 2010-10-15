require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = authors(:nietzsche)
  end

  test "should respond to works" do
    assert_respond_to @author, :works
    assert_equal 1, @author.works.count
    assert_equal "MyString", @author.works.first.title
  end

  test "Author class should respond to active_and_in_order" do
    assert_respond_to Author, :active_and_in_order
  end
end
