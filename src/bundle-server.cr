require "./bundle-server/*"
require "kemal"

get "/version" do
  Bundle::Server::VERSION
end

before_get "/json" do |env|
  env.response.content_type = "application/json"
end

get "/json" do |env|
  filename = "default"
  if env.params.query["file"]?
    filename = env.params.query["file"]
  end
  file_path = ::File.join [Kemal.config.public_folder, "assets/", filename + ".json"]
  response = File.read(file_path)
end

Kemal.run