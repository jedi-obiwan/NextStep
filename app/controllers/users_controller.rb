class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/login
  def login_form
  end

  # POST /users/login
  def login
    @user = User.find_by(user_account: params[:user_account],
			 password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Hi! " + @user.disp_name
      redirect_to("/")
    else
      flash[:notice] = "Authentication failed. Please login again"
      render("/users/login_form")
    end
  end

  # POST /users/logout
  def logout
    session[:user_id] = nil
    flash[:notice] = "You have Logout successfully."
    render("/users/login_form")
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @users = User.find(session[:user_id])
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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id] != nil then
         @user = User.find(params[:id])
      elsif session[:user_id] != nil then 
        @user = User.find(session[:user_id])
      end 
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_account, :disp_name, :mail, :password)
    end
end
