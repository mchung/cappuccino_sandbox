require 'rubygems'
require 'sinatra'

get "/" do
  redirect "index.html"
end

get "/Frameworks/AppKit/AppKit.j" do
  [404, {}, "Look elsewhere"]
end

get "/Frameworks/AppKit/Foundation.j" do
  [404, {}, "Look elsewhere"]
end

get "/data" do
  "Hello from Sinatra"
end