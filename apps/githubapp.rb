class GithubappApp < Deano::Base
  register Sinatra::Twitter::Bootstrap::Assets

  get "/" do
    erb :index
  end

end
