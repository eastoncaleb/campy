class Task < ApplicationRecord
	belongs_to :project, optional: true
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	validates :description, presence: true
end
