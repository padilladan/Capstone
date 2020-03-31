class Api::UsersController < ApplicationController
  def index
    @users = User.all.sort

    render "index.json.jbuilder"
  end

  def weather
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=Chicago&units=imperial&APPID=c1160865fbf4b05f0616436efdc42ee6")
    weather = response.parse
    render json: weather
  end

  def checkout
    user = User.find_by(id: current_user.id)
    location = Location.find_by(id: params[:location_id])

    if user.location_id.to_i == location.id.to_i
      user.location_id = nil
      user.save

      location.headcount = location.headcount - 1
      location.save
    else
      render json: {message: "User already checked out"}
    end
  end

  def checkin
    p "-------Checking In-----------"
    user = User.find_by(id: current_user.id)

    if user.location_id.to_i != 0   
      p "-------Checking User Location-----------"
      location = Location.find_by(id: user.location_id)
      p location
      p user.location_id
      user.location_id = nil
      user.save
      p "-------Removing from current location-----------"
      location.headcount = location.headcount - 1
      location.save
      p user.location_id
      p "-------REMOVED from location-----------"

    end


    location = Location.find_by(id: params[:location_id])
    p location

    if user.location_id.to_i != location.id.to_i

      user.location_id = location.id
      user.save
      p location
      p location.headcount
      location.headcount = location.headcount + 1
      location.save
      p location.headcount

      render json: {message: "User checked in"}
    else
      render json: {message: "User already checked in"}
    end
    p "-------Checked In-----------"
  end

  def logout
    user = User.find_by(id: current_user.id)
    location = Location.find_by(id: user.location_id)

    if user.location_id.to_i != nil 
      location = Location.find_by(id: user.location_id)

      user.location_id = nil
      user.save

      if location
        location.headcount = location.headcount - 1
        location.save
      end
    end
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      access: "user",
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      )
    
    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    render "show.json.jbuilder"
  end

  def update
    @user = User.find_by(id: params[:id])

    # @user.name = params[:name] || @user.name
    # @user.email = params[:email] || @user.email
    # @user.password = params[:password] || @user.password
    # @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.location_id = params[:location_id] || @user.location_id

    if @user.save
      render "show.json.jbuilder"
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    render json: {message: 'User deleted successfully'}
  end
end