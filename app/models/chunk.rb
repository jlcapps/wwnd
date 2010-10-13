class Chunk < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 40

  belongs_to :work

  def display_title
    "#{work.title}/#{title}"
  end

  def self.answer(slug, question, chunk_id=nil)
    question = question.split.join(" | ") # using :match_mode => :extended
    if slug == "everybody"
      query = { :match_mode => :extended, :per_page => 10 }
    else
      # :conditions force mm :extended
      query = { :conditions => { :slug => slug }, :per_page => 5 }
    end
    if chunk_id
      query[:with] = { :id => chunk_id }
    end
    self.search(question, query)
  end

  def answer(snip=excerpts.body)
    Answer.new(body, snip).to_s
  end

  define_index do
    indexes work.author(:slug), :as => :slug
    indexes body

    has id
  end
end
