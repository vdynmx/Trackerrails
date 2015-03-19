require 'settingslogic'

class Settings < Settingslogic
  source 'config.yml'
  namespace 'default'
end
