require "./bundle-server/*"
require "kemal"

get "/version" do
  Bundle::Server::VERSION
end

before_get "/json" do |env|
  env.response.content_type = "application/json"
end

get "/json" do |env|
  file = env.params.query["file"]
  response = File.read("public/assets/#{file}.json")
end

Kemal.run