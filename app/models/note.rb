class Note < ActiveRecord::Base
  has_many :tag_associations, dependent: :destroy
  has_many :tags, through: :tag_associations
  has_many :votes, as: :voteable, dependent: :destroy
end
