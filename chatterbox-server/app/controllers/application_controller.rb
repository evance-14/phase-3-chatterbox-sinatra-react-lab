class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

  #route to get all messages
  get '/messages' do
    messages = Message.order(created_at: :asc)
    messages.to_json
  end

  #route to create a new message
  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  #update body of message
  patch '/messages/:id' do
    message = Message.find(params[:id])
    #update body
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  #delete message
  delete '/messages/:id' do
    #find a message using id
    message =Message.find(params[:id])
    #delete message
    message.destroy
    #return message in JSON
    message.to_json
  end
  
end
