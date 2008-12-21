require 'templater'

module Kib
  module Generators
    extend Templater::Manifold
    desc "Kib generators"
  end
end

require 'kib/generators/resource'
