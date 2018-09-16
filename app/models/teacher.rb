class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :pusername, uniqueness: true,\
    presence: true, length: { maximum: 30 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         authentication_keys: [:pusername]
         
  has_many :worksheets
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
