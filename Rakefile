$:.insert(0, "lib")

require 'rubygems'
require 'sass'
require 'sass/plugin'
require 'resource'
require 'builder'
require 'rack'

Sass::Plugin.options = {
  :load_paths => ["stylesheets"],
  :template_location => "stylesheets",
  :css_location => "public/stylesheets"
}

require 'config/init.rb'

directory "public/stylesheets"

task :build => "public/stylesheets" do
  Sass::Plugin.update_stylesheets
  Builder.new.instance_eval(File.read("config/router.rb"))
end

task :default => :build

class Static
  def initialize
    @app = Rack::File.new("public")
  end

  def call(env)
    sh "rake"
    unless File.file?("public/#{env["PATH_INFO"]}")
      env["PATH_INFO"] = (env["PATH_INFO"].split("/") << "index.html").join("/")
    end
    @app.call(env)
  end
end

task :serve do
  Rack::Handler::WEBrick.run(Static.new, :Port => (ENV["PORT"] || 5000))
end
