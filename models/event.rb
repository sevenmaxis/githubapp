require 'models/base'

class Event < Base

	# Fields
	field :event_id, type: String
	field :type, type: String
	field :created_at, type: Time

	belongs_to :user

	validates :event_id, presence: true, uniqueness: true

end