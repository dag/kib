require 'redcloth'

module Kib
  class Resource
    attr :id
    attr :name
    def initialize(name, id, meta, texts)
      @name = name
      @id = id
      me = class << self; self; end
      meta.each do |key, value|
        me.send :define_method, key.to_sym do
          value
        end
      end
      texts.each do |text|
        f = File.basename(text).split(".")
        me.send :define_method, f[1].to_sym do
          RedCloth.new(File.read(text)).to_html
        end
      end
    end
  end
end
