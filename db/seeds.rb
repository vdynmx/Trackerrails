env = Rails.env || 'development'
mask = File.join File.dirname(__FILE__), 'seeds', env, '*.rb'
Dir[mask].each { |file_name| require file_name }
