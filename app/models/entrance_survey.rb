class EntranceSurvey < ApplicationRecord
  belongs_to :employee
  validates :sore_throat, :acceptance => true

end
