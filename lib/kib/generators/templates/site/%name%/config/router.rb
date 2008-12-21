create "/" do
  @page = @pages["start"]
  make :pages, :show, :id => @page.id
end

