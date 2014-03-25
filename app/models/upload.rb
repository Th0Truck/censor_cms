class Upload < ActiveRecord::Base

  has_many :sections, through: :upload_sections

  attr_accessible :title, :size, :filetype, :file, :section_id
  mount_uploader :file, UploadUploader
end
