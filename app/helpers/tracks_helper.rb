module TracksHelper
  def select_options_tracks_filter
    options_array = Track.owned_by(current_user).pluck('country_id').uniq.map {|country_id| [country_id, Country.find(country_id)] }
    options_array.unshift ['All', 'all']
    options_for_select options_array
  end
end
