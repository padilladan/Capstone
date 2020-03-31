class Api::LocationsController < ApplicationController
  def index
    @locations = Location.all.sort

    render "index.json.jbuilder"
  end

  def create
    @location = Location.new(
      name: params[:name],
      location_type_id: params[:location_type_id],
      description: params[:description],
      capacity: params[:capacity],
      cap_percent: params[:cap_percent],
      address: params[:address],
      headcount: 0,
      )
    
    @location.save

    render "show.json.jbuilder"
  end

  def show
    @location = Location.find_by(id: params[:id])

    render "show.json.jbuilder"
  end

  def update
    @location = Location.find_by(id: params[:id])

    @location.id = params[:id]
    @location.name = params[:name]
    @location.location_type_id = params[:location_type_id]
    @location.description = params[:description]
    @location.capacity = params[:capacity]
    @location.cap_percent = params[:cap_percent]
    @location.address = params[:address]
    @location.headcount = params[:headcount]

    @location.save

    render action: "show"
  end

  def destroy
    @location = Location.find_by(id: params[:id])
    @location.destroy

    render "index.json.jbuilder"
  end
end
