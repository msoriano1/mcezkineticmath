class Topic < ActiveRecord::Base
    self.primary_key = 'id'
    belongs_to :yearlevel

    has_many :worksheets
    has_many :items
    has_many :answered_worksheets
    has_many :studentanswers
end
