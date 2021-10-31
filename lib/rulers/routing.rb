module Rulers
  class Application
    def get_controller_and_action(env)
      if env['PATH_INFO'] == '/'
        cont = "HomeController"
        action = "index"
        return [Object.const_get(cont), action]
      end

      _, cont, action, after = env["PATH_INFO"].split('/', 4)
      cont = cont.capitalize # "People"
      cont += "Controller" # "PeopleController"
      [Object.const_get(cont), action]
    end
  end
end
