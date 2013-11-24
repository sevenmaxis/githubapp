require 'models/base'

class User < Base

	# Fields
	field :id,             type: String
	field :login,          type: String
	field :activity_score, type: Integer, default: 0

	has_many :events
	has_and_belongs_to_many :repos

	attr_accessible :id, :_id

end