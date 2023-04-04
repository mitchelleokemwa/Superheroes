class HeroPower < ApplicationRecord
    belongs_to :power
    belongs_to :hero
    validates :strength, inclusion: {in:['average', 'weak', 'strong',"Average","Weak", 'Strong']}
end
