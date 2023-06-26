class Project < ApplicationRecord
	has_many :tasks
	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
	validates :name, presence: true
	has_rich_text :description
end