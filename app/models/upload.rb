class Upload < ActiveRecord::Base

  has_many :sections, through: :upload_sections

  attr_accessible :title, :size, :filetype, :file, :section_id
  mount_uploader :file, UploadUploader

  def self.is_image
    where("filetype LIKE 'image%'")
  end

  def self.is_doc
    where("filetype LIKE 'application%'")
  end

end
