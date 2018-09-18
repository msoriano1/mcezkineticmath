class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :susername, uniqueness: true, presence: true, length: { maximum: 30 }
  validates :firstname, presence: true
  validates :lastname, presence: true 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:susername]
         
    has_many :answered_worksheets
    belongs_to :admin
    has_many :studentanswers

  # for better-looking error messages
  HUMANIZED_ATTRIBUTES = {
    :susername => "Username",
    :firstname => "First name",
    :lastname => "Last name",
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

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