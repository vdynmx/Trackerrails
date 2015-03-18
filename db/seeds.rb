mask = File.join File.dirname(__FILE__), 'seeds', '*.rb'
Dir[mask].each { |file_name| require file_name }
