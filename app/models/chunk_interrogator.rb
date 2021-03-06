class InterrogativeValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    i_words = %w{ who what when where why how is isnt are should could whose
                   which whom whence whither wherefore do shouldnt arent dont
                   couldnt does doesnt will wont did didnt whats was whos may
                   can }
    words = value.downcase.sub(/[^\s\w\d]+/, '').split(' ')
    record.errors[attr] = "That is not a question." unless words.any? do |w|
      i_words.include? w
    end
  end
end

class ChunkInterrogator
  extend ActiveModel::Naming
  include ActiveModel::Validations

  validates_presence_of :question, :message => "What is your question?"

  attr_accessor :slug, :question, :chunk_id
  def initialize(slug, question, chunk_id=nil)
    @slug, @question, @chunk_id = slug, question.sub("'", ""), chunk_id
  end

  def chunks
    valid? ? Chunk.answer(@slug, @question, @chunk_id) : []
  end

  def to_model
    self
  end

  def new_record?() true  end
  def destroyed?()  true  end
  def persisted?()  false end
  def to_key()      nil   end
  def to_param()    nil   end
end
