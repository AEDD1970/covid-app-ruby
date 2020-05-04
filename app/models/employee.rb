class Employee < ActiveRecord::Base
  belongs_to :gender
  belongs_to :interpretation
  # belongs_to :company
  # has_many :survey_histories
end
