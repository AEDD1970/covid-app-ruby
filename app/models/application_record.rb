class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  config.time_zone = 'America/Bogota'
  config.encoding = "utf-8"


end
