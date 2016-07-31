Dir[File.dirname(__FILE__) + '/{controllers,handlers}/*.rb'].each {|file| require file }

urlmaps = {
  '/'      => HomeController.new,
  '/users' => UsersController.new
}

run Rack::URLMap.new(urlmaps)
