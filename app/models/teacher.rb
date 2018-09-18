class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :pusername, uniqueness: true, presence: true, length: { maximum: 30 }
  validates :firstname, presence: true
  validates :lastname, presence: true 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         authentication_keys: [:pusername]
         
  has_many :worksheets
  
  # for better-looking error messages
  HUMANIZED_ATTRIBUTES = {
    :pusername => "Username",
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
end
