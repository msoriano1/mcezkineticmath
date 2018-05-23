class Worksheet < ActiveRecord::Base
    self.primary_key = 'id'
    belongs_to :topic
    belongs_to :yearlevel
    belongs_to :teacher
    belongs_to :admin
    has_many :items, dependent: :destroy
    has_many :answered_worksheets, dependent: :destroy
    has_many :studentanswers
    
    accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true
    
    before_save :count_number
    
    def count_number
        if !self.items.empty?
            self.items.each_with_index do |item, index|
              item.number = index + 1
            end
        end
    end
    
    
end
