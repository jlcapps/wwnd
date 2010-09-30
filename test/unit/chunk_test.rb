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

  test "should respond to per_page" do
    assert_respond_to @chunk, :per_page
    assert_equal 40, @chunk.per_page
  end

  test "Chunk should respond to answer" do 
    assert_respond_to Chunk, :answer
  end

  test "instance should respond to answer"do 
    assert_respond_to @chunk, :answer
  end
end
