require 'erb'

module Kib
  module Helpers
    include ERB::Util
    
    def tag(name, attrs={}, &block)
      attrs = attrs.map {|a| "#{a[0]}=#{h(String(a[1])).inspect}" }.join(" ")
      attrs = " " + attrs unless attrs.empty?
      if block
        "<#{name}#{attrs}>#{block.call}</#{name}>"
      else
        "<#{name}#{attrs} />"      
      end
    end
    
    def stylesheet_link(*sheets_and_opts)
      opts = sheets_and_opts.select {|e| e.kind_of? Hash }.first || {}
      sheets = sheets_and_opts.reject {|e| e.kind_of? Hash }
      opts[:media] ||= "screen"
      opts[:type] ||= "text/css"
      opts[:rel] ||= "stylesheet"
      tags = ""
      sheets.each do |sheet|
        opts[:href] = "/stylesheets/#{sheet}.css"
        tags << tag(:link, opts) << "\n"
      end
      tags
    end
    
    def link(text, *path)
      tag(:a, :href => "/#{path.join("/")}") { text }
    end
  end
end
