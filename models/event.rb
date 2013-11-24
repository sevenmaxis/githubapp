require 'models/base'

class Event < Base

	# Fields
	field :event_id, type: String
	field :type, type: String

	belongs_to :user

	validates :event_id, presence: true, uniqueness: true

end