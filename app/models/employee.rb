class Employee < ApplicationRecord
  #---------Add assosiation--------------
  belongs_to :user 
  # belongs_to :department
  # has_many :leave_managements
  #---------Add Validation ---------------
  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }
  scope :date_of_birth, -> { where(date_of_birth: Time.zone.today) }

  validates :employee_id, presence: true, uniqueness: true
  validates :date_of_birth, presence: true
  validates :date_of_join, presence: true
  validates :city, presence: true 
  number_regex = /\b^([6789][0-9]{9})$\b/
  validates_format_of :mobile, :with =>  number_regex, :message => " No.are Valid  only indian & without spaces are allowed"


  def inactivate
    self.is_active = true
    save!
  end

  def activate
    self.is_active = false
    save!
  end


end 