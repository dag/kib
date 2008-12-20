require 'sass'
require 'sass/plugin'
require 'kib/builder'

Sass::Plugin.options = {
  :load_paths => ["stylesheets"],
  :template_location => "stylesheets",
  :css_location => "public/stylesheets"
}

require 'config/init.rb'

directory "public/stylesheets"

desc "Build files"
task :build => "public/stylesheets" do
  Sass::Plugin.update_stylesheets
  Kib::Builder.new.instance_eval(File.read("config/router.rb"))
end

task :default => :build
