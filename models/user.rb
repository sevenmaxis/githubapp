require 'models/base'

class User < Base

	# Fields
	field :_id,            type: String
	field :login,          type: String
	field :activity_score, type: Integer, default: 0

	has_many :events
	has_and_belongs_to_many :repos

	validates :_id, presence: true, uniqueness: true

end