require 'test_helper'

class ChunkTest < ActiveSupport::TestCase
  def setup
    @chunk = chunks(:one)
  end

  test "responds to display_title" do
    assert_respond_to @chunk, :display_title
  end

  test "display_title is properly formatted" do
    assert_equal "#{@chunk.work.title}/#{@chunk.title}",
      @chunk.display_title
  end
end
