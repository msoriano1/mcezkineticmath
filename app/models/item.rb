class Item < ActiveRecord::Base
  self.primary_key = 'id'
  belongs_to :worksheet
  belongs_to :topic
  belongs_to :yearlevel
  #belongs_to :answered_worksheet
end
