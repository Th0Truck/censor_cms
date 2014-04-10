class SectionsSidebarsController < ApplicationController
  before_action :set_sections_sidebar, only: [:show, :edit, :update, :destroy]

  # GET /sections_sidebars
  # GET /sections_sidebars.json
  def index
    @sections_sidebars = SectionsSidebar.all
  end

  # GET /sections_sidebars/1
  # GET /sections_sidebars/1.json
  def show
  end

  # GET /sections_sidebars/new
  def new
    @sections_sidebar = SectionsSidebar.new
  end

  # GET /sections_sidebars/1/edit
  def edit
  end

  # POST /sections_sidebars
  # POST /sections_sidebars.json
  def create
    @sections_sidebar = SectionsSidebar.new(sections_sidebar_params)

    respond_to do |format|
      if @sections_sidebar.save
        format.html { redirect_to @sections_sidebar, notice: 'Sections sidebar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sections_sidebar }
      else
        format.html { render action: 'new' }
        format.json { render json: @sections_sidebar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections_sidebars/1
  # PATCH/PUT /sections_sidebars/1.json
  def update
    respond_to do |format|
      if @sections_sidebar.update(sections_sidebar_params)
        format.html { redirect_to @sections_sidebar, notice: 'Sections sidebar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sections_sidebar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections_sidebars/1
  # DELETE /sections_sidebars/1.json
  def destroy
    @sections_sidebar.destroy
    respond_to do |format|
      format.html { redirect_to sections_sidebars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sections_sidebar
      @sections_sidebar = SectionsSidebar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sections_sidebar_params
      params.require(:sections_sidebar).permit(:section_id, :sidebar_id)
    end
end
