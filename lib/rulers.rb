require "rulers/version"
require "rulers/routing"
require "rulers/array"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      begin
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        return [200, {'Content-Type' => 'text/html'}, [text]]
      rescue NameError, NoMethodError => error
        return [200, {'Content-Type' => 'text/html'}, ['404 - Page not found']]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end