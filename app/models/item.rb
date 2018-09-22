class Item < ActiveRecord::Base
  self.primary_key = 'id'
  belongs_to :worksheet
  belongs_to :topic
  belongs_to :yearlevel
  
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  validates :question, presence: true
  validates :answer, presence: true 

  private
  def image_size_validation
    errors[:image] << "should be less than 800KB" if image.size > 0.8.megabytes
  end
  #belongs_to :answered_worksheet
end
