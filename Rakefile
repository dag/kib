$:.insert(0, "lib")

require 'rubygems'
require 'sass'
require 'resource'
require 'builder'
require 'rack'
require 'config/init.rb'

task :build do
  @sass ||= {}
  Dir["stylesheets/**/*"].each do |style|
    File.makedirs("public/#{File.dirname(style)}")  
    File.open("public/stylesheets/#{style[12..-6]}.css", "w") do |f|
      f.write(Sass::Engine.new(File.read(style), @sass).render)
    end
  end
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

