require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = authors(:one)
  end

  test "should respond to works" do
    assert_respond_to @author, :works
    assert_equal 1, @author.works.count
    assert_equal "MyString", @author.works.first.title
  end
end
