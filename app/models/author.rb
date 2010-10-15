class Author < ActiveRecord::Base
  validates_presence_of :name, :display_name, :bio, :slug
  has_many :works, :order => "title"

  scope :actives, where(:active => true).order("display_name")

  def self.active_and_in_order
    actives.group_by { |a| a.slug == "everybody" }.values.flatten
  end
end
