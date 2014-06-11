class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if params[:user][:uid].present? && params[:user][:provider].present?
      isuser = User.where(:uid => params[:user][:uid], :provider => params[:user][:provider])
      if isuser.present?
        @user = isuser
        respond_to do |format|
          format.html { redirect_to root_url, notice: 'Velkommen.' }
          format.json { render json: root_url, status: :created, location: @user }
        end
      else
        @user = User.new(params[:user])

        respond_to do |format|
          if @user.save
            format.html { redirect_to root_url, notice: 'Du er nu oprettet.' }
            format.json { render json: root_url, status: :created, location: @user }
          else
            format.html { render action: "new" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    elsif User.authenticate(params[:user][:email], params[:user][:password], params[:user][:setting_id]).present?
      @user = User.authenticate(params[:user][:email], params[:user][:password], params[:user][:setting_id])
      if @user.present?
        user_setting = UserSetting.new()
        user_setting.user_id = @user.id
        user_setting.setting_id = params[:user][:setting_id]
        user_setting.password = params[:user][:password]
        user_setting.save!
        ding = 'created'
      end
      respond_to do |format|
        if @user.save
          format.html { redirect_to root_url, notice: "Du er nu oprettet." }
          format.json { render json: root_url, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    elsif User.where(email: params[:user][:email]).present?
      @user = User.where(email: params[:user][:email]).first
      if @user.present?
        #user_setting = @user.user_settings.new_user(params[:user][:setting_id],params[:user][:password])
        user_setting = @user.user_settings.new()
        user_setting.setting_id = params[:user][:setting_id]
        user_setting.password = params[:user][:password]
        user_setting.save!
      end
      redirect_to root_url, notice: "Velkommen."
    else
      @user = User.create(params[:user])
      if @user.present?
        user_setting = @user.user_settings.new()
        user_setting.setting_id = params[:user][:setting_id]
        user_setting.password = params[:user][:password]
        user_setting.save!
        redirect_to root_url, :notice => "Oprettet!"
      else
        render "new"
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_hash, :password_salt, :uid, :provider, :icon)
    end
end
