require 'rack'

module Rack
  module Adapter
    class Kib
      def initialize
        @app = Rack::File.new("public")
      end

      def call(env)
        sh "rake"
        unless ::File.file?("public/#{env["PATH_INFO"]}")
          env["PATH_INFO"] = (env["PATH_INFO"].split("/") << "index.html").join("/")
        end
        @app.call(env)
      end
    end
  end
end
