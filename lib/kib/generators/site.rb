module Kib::Generators
  class Site < Templater::Generator
    first_argument :name, :required => true
    
    desc "Site generator"
    
    def self.source_root
      File.join(File.dirname(__FILE__), "templates", "site")
    end
    
    glob!
  end
  
  add :site, Site
end
