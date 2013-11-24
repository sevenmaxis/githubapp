require 'spec_helper'

describe Repo, orm: :mongoid do

	context "intance" do

		it { should have_field(:name).of_type(String) }

		it { should have_and_belong_to_many(:users) }
	
	end

end