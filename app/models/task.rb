class Task < ApplicationRecord
	belongs_to :project, optional: true
	validates :description, presence: true
end
