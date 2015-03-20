class TracksController < ApplicationController
  before_action :set_track, only: [:edit, :update, :destroy, :get_points]
  skip_before_action :verify_authenticity_token, :only => [:create]

  def index
    @tracks = Track.owned_by current_user

    @tracks = @tracks.where params[:filter] if params[:filter].present?
  end

  def create
    attributes = track_params

    points = attributes[:points]
    attributes.delete :points

    waypoints = attributes[:waypoints]
    attributes.delete :waypoints

    attributes.merge!({
      timestamp: Time.new,
      user_id:   (User.find_by_token params[:token]).id
    })
    new_track = Track.new attributes

    points.map! do |point_data|
      Point.new({
        timestamp: point_data[0],
        latitude: point_data[1],
        longtitude: point_data[2],
        speed: point_data[4]
      })
    end

    waypoints.each do |waypoint|
      point_index = waypoint[:point_index]
      waypoint.delete :point_index

      points[point_index].waypoint = Waypoint.new waypoint
    end

    new_track.points.concat points
    new_track.save
    render json: true
  end

  def get_points
    respond_to do |format|
      format.json { render json: @track.points }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit!
  end

  def set_track
    @track = Track.find params[:id]
  end
end
