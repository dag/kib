require 'kib/resource'
require 'yaml'
require 'haml'
require 'ftools'

module Kib
  class Builder
    def initialize
      Dir["resources/*"].each do |resource|
        res = []
        meta = YAML.load_file("#{resource}/meta.yml") rescue []
        meta.each do |id, meta|
          texts = Dir["#{resource}/texts/#{id}.*"]
          res << Kib::Resource.new(File.basename(resource).to_sym, id, meta, texts)
        end
        instance_variable_set "@#{File.basename(resource)}".to_sym, res
      end
    end

    def create(path, &block)
      @path = path
      instance_eval(&block)
    end
    
    def make(resource, view, opts={})
      layout = opts.delete(:layout) || :application
      res = Haml::Engine.new(File.read("layouts/#{layout}.haml")).to_html(self) do
        Haml::Engine.new(File.read("resources/#{resource}/views/#{view}.haml")).to_html(self)
      end
      path = "public/#@path/index.html"
      opts.each do |key, value|
        path.gsub!(":#{key}", value)
      end
      File.makedirs(File.dirname(path))
      File.open(path, "w") do |f|
        f.write(res)
      end
    end
  end
end
