class Chunk < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 40

  belongs_to :work

  def display_title
    "#{work.title}/#{title}"
  end

  define_index do
    indexes work.author(:slug), :as => :slug
    indexes body
  end
end
