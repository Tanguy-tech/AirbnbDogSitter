class City < ApplicationRecord
    has_many :dogsitters, dependent: :delete_all
	has_many :dogs, dependent: :delete_all
	has_many :strolls, dependent: :delete_all
end
