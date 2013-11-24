require 'spec_helper'

describe Event, orm: :mongoid do

	context "intance" do
		subject(:event) { build(:event) }

		it { should have_field(:type).of_type(String) }
		it { should have_field(:event_id).of_type(String) }

		it { should belong_to(:user) }

		it { should be_valid }
    it { should validate_presence_of(:event_id) }
    it { should validate_uniqueness_of(:event_id) }
	
	end

end