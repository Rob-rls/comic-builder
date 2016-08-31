class Strip < ActiveRecord::Base
  belongs_to :comic
  has_attached_file :image, :styles => { :large => "900x900>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :image2, :styles => { :large => "900x900>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :image3, :styles => { :large => "900x900>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/
end
