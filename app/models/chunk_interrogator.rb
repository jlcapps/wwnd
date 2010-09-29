class InterrogativeValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    i_words = %w{ who what when where why how is isnt are should could whose
                   which whom whence whither wherefore do shouldnt arent dont
                   couldnt does doesnt will wont did didnt }
    words = value.downcase.sub(/[^\s\w\d]+/, '').split(' ')
    record.errors[attr] = "That is not a question." unless words.any? do |w|
      i_words.include? w
    end
  end
end

class ChunkInterrogator
  extend ActiveModel::Naming
  include ActiveModel::Validations

  validates :question, :interrogative => true

  attr_accessor :slug, :question
  def initialize(slug, question)
    @slug, @question = slug, question
  end

  def answers
    valid? ? Chunk.search(question) : []
  end

  def to_model
    self
  end

  def new_record?() true  end
  def destroyed?()  true  end
  def persisted?()  false end
  def to_key()      nil   end
  def to_param()    nil   end

  def errors
    @errors ||= Hash.new([])
    def @errors.full_messages() 
      self.nil? ? [] : self.values
    end
    @errors
  end
end
