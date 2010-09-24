class Author < ActiveRecord::Base
  validates_presence_of :name, :display_name, :bio, :slug
end
