require 'rubygems'
require 'sinatra'
require 'json'

def render_fixture filename
  send_file File.join("fixtures", filename)
end

post "/tasks" do
  case params[:description]
  when "a task to cause a client error"
    content_type "application/json"
    status 400
    File.read "fixtures/error.json"
  when "a task to cause a server error"
    content_type "application/json"
    raise "a server error"
  when "a task to cause an unexpected response"
    content_type "text/html"
    "some crazy response"
  else
    render_fixture "task.json"
  end
end

get "/tasks/:id" do
  content_type "application/json"
  if params[:id] == "1000"
    { task: {
        id: 1000,
        description: "a task that was read from the server"
      }}.to_json
  end
end

get "/tasks" do
  content_type "application/json"
  [1,2,3,4,5].map do |i|
    { task: { id: i, description: "task ##{i}" }}
  end.to_json
end

put "/tasks/:id" do
  content_type "application/json"
  { task: {id: params[:id], description: params[:description]}}.to_json
end

delete "/tasks/:id" do
  content_type "application/json"
  case params[:id]
  when "3000"
    status 204
  when "4000"
    status 400
    { error: "an error occurred" }.to_json
  end
end
