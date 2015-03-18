class TracksController < ApplicationController
  def index
    @tracks = Track.owned_by current_user

    @tracks = @tracks.where params[:filter] if params[:filter].present?
  end
end
