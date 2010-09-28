class ChunkInterrogator
  extend ActiveModel::Naming

  def to_model
    self
  end

  def valid?()      true  end
  def new_record?() true  end
  def destroyed?()  true  end
  def persisted?()  false end
  def to_key()      nil   end
  def to_param()    nil   end

  def errors
    obj = Object.new
    def obj.[](key)         [] end
    def obj.full_messages() [] end
    obj
  end

end
