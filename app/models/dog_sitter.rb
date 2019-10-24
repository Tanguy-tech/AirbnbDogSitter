class DogSitter < ApplicationRecord
    belongs_to :city, dependent: :delete_all 
    has_many :strolls, dependent: :delete_all
    has_many :dogs, through: :stroll, dependent: :delete_all
end
