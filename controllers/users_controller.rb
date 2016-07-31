class UsersController < BaseController

  get '/' do
    handler.list
  end

  get '/show/:id' do
    handler.show(params[:id])
  end

  private

  def handler
    @handler ||= UsersHandler.new
  end

end
