require 'models/base'

class Repo < Base

	# Fields
	field :name, type: String

	has_and_belongs_to_many :users

end