require './settings'
require './sender'

url = "http://#{Settings.api.server}:#{Settings.api.port}/#{Settings.api.tracks_entry}"
(Sender.new url).send_package

