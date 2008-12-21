require 'extlib'

module Kib::Generators
  class Resource < Templater::Generator
    first_argument :name, :required => true
    
    desc "Resource generator"
    
    def self.source_root
      File.join(File.dirname(__FILE__), "templates", "resource")
    end

    file :meta, "resources/%name%/meta.yml"
    file :texts, "resources/%name%/texts/arbitrary-id.body.markdown"
    
    template :index, "resources/%name%/views/index.haml",
                     "resources/%name%/views/index.haml"
    template :show, "resources/%name%/views/show.haml",
                    "resources/%name%/views/show.haml",
                    :after => :make_routes
    
    def make_routes(action)
      File.open("config/router.rb", "a") do |f|
        f.write <<-END
create "/#{name}" do
  make :#{name}, :index
end

create "/#{name}/:id" do
  @#{name}.each do |id, @#{name.singular}|
    make :#{name}, :show, :id => id
  end
end

        END
      end
    end
  end
  
  add :resource, Resource
end
