class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: %i[ edit update destroy ]
  # before_action :authorize_request

  # GET /users or /users.json
  def index
    @users = User.where.not(role_id: 'admin')
    nice = @users
    render json:nice
  end

  # GET /users/1 or /users/1.json
  def show
    managerId = params[:id]
    @users = User.left_joins(:music)
    .select('users.userId,users.fname,users.lname,users.email,users.dob,musics.album, min(musics.created_at) as releaseDate,count(musics.album) as count')
    .where(managerId: managerId)
    .group("users.fname,users.lname,users.email,users.dob")
    render json: @users
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        notice = "User was successfully created."
        return render json:notice, status: :created
      else

        return render json: @user.errors, status: :unprocessable_entity 
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        notice = "User was successfully updated."
        return render json: notice,  status: :ok
      else
        return render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    respond_to do |format|
      if @user && @user.destroy!
        notice =  "User was successfully destroyed."
        return render json: notice ,  status: :ok
      else
        return render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  private
    def set_user
      puts params
      @user = User.find_by(userId: params[:id])
      unless @user
        message = "No User Found." 
        render json: message, status: :unprocessable_entity
      end
    end
  

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :userId,:created_at,:updated_at,:gender,:dob,:address, :password,:role_id,:managerId)
    end
end