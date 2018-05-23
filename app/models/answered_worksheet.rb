class AnsweredWorksheet < ActiveRecord::Base
    
    self.primary_key ='id'
    belongs_to :topic
    belongs_to :yearlevel
    belongs_to :worksheet
    belongs_to :student
   # has_many :items
    has_many :studentanswers, dependent: :destroy
    #attr_accessor :title
    #attr_accessor :directions
    #attr_accessor :studentinput
    
    accepts_nested_attributes_for :studentanswers, :reject_if => :all_blank, :allow_destroy => true
    
end
