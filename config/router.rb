create "/" do
  make :root, :index
end

create "/posts" do
  make :posts, :index
end

create "/posts/:id" do
  @posts.each do |@post|
    make :posts, :show, :id => @post.id
  end
end

