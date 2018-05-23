class Studentanswer < ActiveRecord::Base
    self.primary_key = 'id'
    belongs_to :topic
    belongs_to :yearlevel
    belongs_to :worksheet
    belongs_to :student
    belongs_to :answered_worksheet
    
    
    
end
