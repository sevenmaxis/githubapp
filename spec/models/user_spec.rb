require 'spec_helper'

describe User, orm: :mongoid do

	context "intance" do
		subject(:user) { build(:user) }

		it { should have_field(:_id).of_type(String) }
		it { should have_field(:login).of_type(String) }
		it { should have_field(:activity_score).of_type(Integer).with_default_value_of(0) }

		it { should have_and_belong_to_many(:repos) }
		it { should have_many(:events) }

		it { should be_valid }
    it { should validate_presence_of(:_id) }
    it { should validate_uniqueness_of(:_id) }
	
	end

end