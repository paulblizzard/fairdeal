class Dealing < ApplicationRecord
	has_one :work
	has_many :answers
	has_and_belongs_to_many :factors
end
