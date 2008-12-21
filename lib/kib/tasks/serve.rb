require 'rack/adapter/kib'

desc "Serve files while building continuously"
task :serve do
  handlers = Array(ENV["handler"]) + %w(thin ebb mongrel webrick)
  port = ENV["port"] || 5000
  handlers.each do |handler|
    begin
      require handler
      puts "Booting #{handler} on http://localhost:#{port}/ ..."
      Rack::Handler.get(handler).run(Rack::Adapter::Kib.new, :Port => port)
      break
    rescue LoadError
      next
    end
  end
end
