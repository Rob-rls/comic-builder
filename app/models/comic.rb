class Comic < ActiveRecord::Base

  has_one :strip, dependent: :destroy
  has_many :comments, dependent: :destroy

end
