class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :ausername, uniqueness: true,\
    presence: true, length: { maximum: 30 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:ausername]
         
  has_many :students
  has_many :teachers
  has_many :worksheets
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
end