class TracksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  def index
    @tracks = Track.owned_by current_user

    @tracks = @tracks.where params[:filter] if params[:filter].present?
  end

  def create
  end
end
