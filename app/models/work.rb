class Work < ActiveRecord::Base
  belongs_to :author
  has_many :chunks, :order => "title"
  validates_presence_of :title, :author_id, :source
  validates_format_of :source, :with => URI::regexp(%w(http https)),
    :message => "%{value} is not a valid URL"

  def select_name
    "#{author.display_name} - #{title}"
  end
end
