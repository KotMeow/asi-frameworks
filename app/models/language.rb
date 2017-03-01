class Language < ApplicationRecord
    has_many :frameworks
    validates :name, presence: true, 
                     length: {in: 1..20}
    validates :description, presence: true, length: {maximum: 200}
    
end
