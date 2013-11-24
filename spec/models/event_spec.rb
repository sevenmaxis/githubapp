require 'spec_helper'

describe Event, orm: :mongoid do

	context "intance" do

		it { should have_field(:type).of_type(String) }

		it { should belong_to(:user) }
	
	end

end