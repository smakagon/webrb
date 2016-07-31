class BaseController

  attr_reader :env

  def self.actions
    @actions ||= { get: {}, post: {} }
  end
  
  def self.get(path, &block)
    actions[:get][path] = block_to_unbound_method(block)
  end
  
  def call(env)
    @env = env
    action = self.class.actions[request_method][request_path]

    action ? respond_with(action) : page_not_found
  end

  private

  def request_method
    env['REQUEST_METHOD'].downcase.to_sym
  end

  def request_path
    env['PATH_INFO'] == '' ? '/' : env['PATH_INFO']
  end

  def page_not_found
    [404, {}, Array('Page Not Found')]
  end

  def respond_with(action)
    result = action.bind(self).call.to_s

    [200, {}, Array(result)] 
  end

  # transforms block to UnboundMethod
  # block's self initially bounded to BaseController
  # but we need to run block in instance's context
  def self.block_to_unbound_method(block)
    define_method :temp, block
    method = instance_method(:temp)
    remove_method(:temp)

    method
  end
end
