class Employee < ActiveRecord::Base
  belongs_to :gender
  has_many :exit_surveys
  has_many :entrance_surveys
  # belongs_to :company
end
