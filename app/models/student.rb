class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :susername, uniqueness: true,\
    presence: true, length: { maximum: 30 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:susername]
         
    has_many :answered_worksheets
    belongs_to :admin
    has_many :studentanswers

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  def active_for_authentication?
        #logger.debug self.to_yaml 	
        super && status?
  end

end