# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
config.time_zone = 'America/Bogota'
config.encoding = "utf-8"
end