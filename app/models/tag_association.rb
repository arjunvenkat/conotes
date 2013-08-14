class TagAssociation < ActiveRecord::Base
  belongs_to :note
  belongs_to :tag
end
