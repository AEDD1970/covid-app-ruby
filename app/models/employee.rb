class Employee < ActiveRecord::Base
  belongs_to :gender
  belongs_to :interpretation
  has_many :exit_surveys
  has_many :entrance_surveys
  # belongs_to :company
end
