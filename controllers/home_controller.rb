class HomeController < BaseController

  get '/' do
    "Hello World"
  end

  get '/show/:id' do
    "Home Show #{params[:id]}"
  end

end
