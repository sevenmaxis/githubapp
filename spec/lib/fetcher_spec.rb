require 'spec_helper'

describe Fetcher, :vcr do

	let(:repo_name) { 'rails/rails' }

	subject(:fetcher) { described_class.new(repo_name) }

	context ".new" do
	  it "returns instance" do
	  	fetcher.should be_instance_of(described_class)
	  end
	end

	context '.fetch' do

		before :each do 
			fetcher.fetch!
		end

		it "most active user for last user" do
			fetcher.hour_user.should == 3243
		end

		it "most active user for last user" do
			fetcher.day_user.should == 3243
		end
	end
end