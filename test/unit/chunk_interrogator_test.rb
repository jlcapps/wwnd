require 'test_helper'

class ChunkInterrogatorTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = ChunkInterrogator.new
  end
end
