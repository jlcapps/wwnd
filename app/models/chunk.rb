class Chunk < ActiveRecord::Base
  belongs_to :work

  def display_title
    "#{work.title}/#{title}"
  end

  define_index do
    indexes work.author(:slug), :as => :slug
    indexes body
  end
end
