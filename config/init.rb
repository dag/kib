require 'compass'

@sass = {
  :load_paths =>
    Compass::Frameworks::ALL.map {|f| f.stylesheets_directory } << "stylesheets"
}

