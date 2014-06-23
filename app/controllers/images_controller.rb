class ImagesController < ApplicationController

  def index
    @images = Image.is_image
  end

  def create
    section_id = params[:places][:section_id]

    @upload = Image.new(params[:uploads])
    respond_to do |format|
      if @upload.save
        @upload_section = UploadSection.create!(section_id: section_id, image_id: @upload.id)
        format.html { redirect_to upload_path(@upload), notice: 'Upload Lykkedes.' }
        format.json { render action: 'show', status: :created, location: @upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
end
