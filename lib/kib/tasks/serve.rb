require 'rack/adapter/kib'

desc "Serve files"
task :serve do
  Rack::Handler::WEBrick.run(Rack::Adapter::Kib.new, :Port => (ENV["PORT"] || 5000))
end
