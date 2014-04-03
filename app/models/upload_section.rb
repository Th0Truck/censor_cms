class UploadSection < ActiveRecord::Base

  belongs_to :upload
  belongs_to :image
  belongs_to :section

  attr_accessible :upload_id, :section_id
end
