class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :susername, uniqueness: true,\
    presence: true, length: { maximum: 30 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:susername]

  def email_required?
    false
  end

  def email_changed?
    false
  end
end