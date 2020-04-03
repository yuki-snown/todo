class AdminsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all.select("id", "name")
    render :json => @admins
  end

  def icon
    @admin = Admin.find_by(name: params[:name])
    send_data @admin.icon, filename: @admin.name, :type => 'image/jpeg', :disposition => 'inline'
  end

  def auth
    @user = Admin.find_by(name: params[:name], password: params[:password])
    if @user.nil?
      data = {"status": "failed login"}
    else 
      data = {"status": "success", "admin_id": @user.id}
    end
    render :json => data
  end

  def add
    @image = params[:image]
    data = {
      "name":params[:name],
      "password":params[:password],
      "icon":@image.read
    }
    @client = User.find_by(name: data["name"], password: data["password"])
    if @client.nil?
      @user = Admin.new(data)
      if @user.save
        result = {"status": "success", "admin_id": @user.id}
      else 
        result = {"status": "failed create"}
      end
    else
      result = {"status": "failed already exist this admin"} 
    end
    render :json => result
  end

end
