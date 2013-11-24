require 'spec_helper'

describe User, orm: :mongoid do

	context "intance" do

		it { should have_field(:id).of_type(String) }
		it { should have_field(:login).of_type(String) }
		it { should have_field(:activity_score).of_type(Integer).with_default_value_of(0) }

		it { should have_and_belong_to_many(:repos) }
		it { should have_many(:events) }
	
	end

end