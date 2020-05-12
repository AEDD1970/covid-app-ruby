class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  config.time_zone = 'America/Bogota'


end
