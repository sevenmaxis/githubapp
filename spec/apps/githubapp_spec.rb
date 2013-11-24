require 'spec_helper'

describe GithubappApp do
  
  def app
    GithubappApp
  end

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should match("GithubappApp!")
  end

end
