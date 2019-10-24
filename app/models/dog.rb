class Dog < ApplicationRecord
    belongs_to :city
    has_and_belongs_to_many :strolls
    has_one :dogsitter, through: :strolls
    has_many :dogsitters, through: :city
end
