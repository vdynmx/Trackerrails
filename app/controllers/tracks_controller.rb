class TracksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  def index
    @tracks = Track.owned_by current_user

    @tracks = @tracks.where params[:filter] if params[:filter].present?
  end

  def create
    attributes = track_params
    points = attributes[:points]
    attributes.delete :points
    attributes.merge!({
      timestamp: Time.new,
      user_id: (User.find_by_token params[:token]).id
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
    new_track.points.concat points
    new_track.save
    render json: true
  end

  private

  def track_params
    params.require(:track).permit!
  end
end
