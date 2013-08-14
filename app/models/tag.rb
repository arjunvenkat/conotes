class Tag < ActiveRecord::Base
  has_many :tag_associations
  has_many :notes, through: :tag_associations
  has_many :votes, as: :voteable
end
