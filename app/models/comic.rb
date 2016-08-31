class Comic < ActiveRecord::Base
  has_many :comments
end
