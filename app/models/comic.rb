class Comic < ActiveRecord::Base
  has_one :strip
  has_many :comments
end
