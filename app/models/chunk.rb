class Chunk < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 40

  belongs_to :work

  def display_title
    "#{work.title}/#{title}"
  end

  def self.answer(slug, question)
    self.search(question, :match_mode => :any, 
                :conditions => { :slug => slug }, :per_page => 5)
  end

  def answer(snip=excerpts.body)
    Answer.new(body, snip).to_s
  end

  define_index do
    indexes work.author(:slug), :as => :slug
    indexes body
  end
end
