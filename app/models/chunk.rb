class Chunk < ActiveRecord::Base
  belongs_to :work

  def display_title
    "#{work.title}/#{title}"
  end
end
