class Attandance < ApplicationRecord
  belongs_to :user

  # validates_confirmation_of :in_time, greater_than: -> { Date.today }
  # scope :by_year, -> (year) {
  #   where(date: Date.new(year).beginning_of_year..Date.new(year).end_of_year)
  # }
  
end
