class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def create
    @upload = Image.new(params[:uploads])

    respond_to do |format|
      if @upload.save
        format.html { redirect_to upload_path(@upload), notice: 'Upload Lykkedes.' }
        format.json { render action: 'show', status: :created, location: @upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end
end
