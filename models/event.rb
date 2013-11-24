require 'models/base'

class Event < Base

	# Fields
	field :type, type: String

	belongs_to :user

	attr_accessible :id, :_id

end