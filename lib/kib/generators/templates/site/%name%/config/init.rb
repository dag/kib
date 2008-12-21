require 'compass'

Compass::Frameworks::ALL.each do |directory|
  Sass::Plugin.options[:load_paths] << directory.stylesheets_directory
end
