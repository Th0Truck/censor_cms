class UploadSection < ActiveRecord::Base

  #alias_attribute :image_id, :upload_id

  belongs_to :upload
  belongs_to :image
  belongs_to :section

  attr_accessible :upload_id, :section_id, :image_id
end
