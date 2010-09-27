class Work < ActiveRecord::Base
  belongs_to :author
  has_many :chunks, :order => "title"
  validates_presence_of :title, :author_id, :source

  def select_name
    "#{author.display_name} - #{title}"
  end
end
