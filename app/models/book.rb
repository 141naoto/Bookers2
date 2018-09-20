class Book < ApplicationRecord
	belongs_to :user

	validates :Title, presence: true
	validates :Opinion, presence: true

	validates :Opinion,
	length:{ maximum: 200 }

	# validates :Title,
end
