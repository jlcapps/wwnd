require 'test_helper'

class ChunkInterrogatorTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = ChunkInterrogator.new("nietzsche", "what is up?")
  end

  test "should validate that question is a question" do
    assert @model.valid?

    @model.question = "let me tell you something"
    assert !@model.valid?
    assert_equal "That is not a question.", @model.errors[:question]
  end

  test "should respond to answers" do 
    assert_respond_to @model, :answers
  end
end
