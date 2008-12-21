create "/" do
  @page = @pages.select {|p| p.id == "start" }.first
  make :pages, :show, :id => @page.id
end

