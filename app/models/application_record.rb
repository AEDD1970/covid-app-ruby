class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  config.time_zone = 'America/Bogota'
  config.active_record.default_timezone = "utf-8" # Or :utc

end
