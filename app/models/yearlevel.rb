class Yearlevel < ActiveRecord::Base
    self.primary_key = 'id'
    has_many :topics
    has_many :worksheets
    has_many :items
    has_many :answered_worksheets
    has_many :studentanswers
end
