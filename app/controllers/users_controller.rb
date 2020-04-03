class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.select("id", "name", "progress", "created_at", "updated_at")
    render :json => @users
  end

  def icon
    @user = User.find_by(name: params[:name])
    send_data @user.icon, filename: @user.name, :type => 'image/jpeg', :disposition => 'inline'
  end

  def rank
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @user = User.where(updated_at: range).order(progress: "DESC").limit(params[:num]).select("id", "name", "progress")
    render :json => @user
  end

  def update_progress
    @user = User.find_by(name: params[:name])
    if @user.nil?
      result = {"status": "failed not found name"}
    else
      if @user.update(progress: params[:progress])
        @user.touch
        result = {"status": "success progress status"}
      else
        result = {"status": "failed update progress"}
      end
    end
    render :json => result
  end

  def auth
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user.nil?
      data = {"status": "failed login"}
    else 
      data = {"status": "success", "user_id": @user.id}
    end
    render :json => data
  end

  def add
    @image = params[:image]
    data = {
      "name":params[:name],
      "password":params[:password],
      "icon":@image.read,
      "progress": 0.0
    }
    @client = User.find_by(name: data["name"], password: data["password"])
    if @client.nil?
      @user = User.new(data)
      if @user.save
        result = {"status": "success", "user_id": @user.id}
      else 
        result = {"status": "failed create"}
      end
    else
      result = {"status": "failed already exist this user"}
    end
    render :json => result
  end

end