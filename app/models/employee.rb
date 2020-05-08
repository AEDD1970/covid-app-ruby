class Employee < ActiveRecord::Base
  belongs_to :gender
  belongs_to :interpretation
  has_many :exit_surveys
  has_many :init_surveys
  has_many :entrance_surveys
  # belongs_to :company


  def calculate_muscle_mass_index
    height = self.size.to_f
    weight = self.weight
    weight / (height)**2
  end
end
