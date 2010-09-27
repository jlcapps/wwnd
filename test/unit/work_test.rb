require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  def setup
    @work = works(:one)
  end

  test "responds to select_name" do
    assert_respond_to @work, :select_name
  end

  test "select_name inclues author and title" do
    assert_equal "#{@work.author.display_name} - #{@work.title}",
      @work.select_name
  end

  test "responds_to works" do
    assert_respond_to @work, :chunks
  end

  test "should validate source" do
    assert @work.valid?
    @work.source = "alksdjflasdkjf;lkj"
    assert !@work.valid?, "source should be valid URL"
  end
end
