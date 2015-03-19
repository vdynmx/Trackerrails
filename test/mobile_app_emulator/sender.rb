require 'rest-client'

class Sender
  def initialize url
    @url = url
  end

  def send_package
    generate_package
    return unless @package

    RestClient.post @url, @package.to_json, {:content_type => :json, :accept => :json} {}
  end

  private

  def generate_random_track_points count
    @track_points = []
    count.times { @track_points << get_random_track_point }
  end

  def generate_package
    track_points_count = rand(100..1000)
    generate_random_track_points track_points_count

    meta = {
      title: "Random track",
      desc: "",
      device: "Emulator",
      privacy: "PRIVATE"
    }

    @package = meta.merge({
      points: @track_points,
    })
  end

  def get_random_track_point
    [
      Time.new,
      rand(-90..89) + rand, # latitude
      rand(-180..179) + rand, # longtitude
      rand * 100, # some angle
      rand(0..10) # speed
    ]
  end
end
