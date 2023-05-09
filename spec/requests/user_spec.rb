require 'rails_helper'


RSpec.describe 'User', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      get '/api/v1/users'
      expect(response).to be_successful
    end

    it 'renders the index template with all users' do
      user = User.create(username: 'testuser')
      user2 = User.create(username: 'testuser2')
      get '/api/v1/users'
      expected_usernames = [
        user.username,
        user2.username
      ]
      parsed_response = JSON.parse(response.body)
      usernames = parsed_response.map { |user| user['username'] }
      expect(usernames).to include(*expected_usernames)
    end

    it 'renders the show template with the requested user' do
      user = User.create(username: 'testuser')
      get "/api/v1/users/#{user.id}"
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['username']).to eq(user.username)
    end


    it 'renders the create template with the new user' do
      user_params = {
        username: 'testuser'
      }
      post '/api/v1/users', params: { user: user_params }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['username']).to eq(user_params[:username])
    end

    it 'renders the update template with the updated user' do
      user = User.create(username: 'testuser')
      user_params = {
        username: 'testuser2'
      }
      user.update(user_params) # Update the user attributes
      patch "/api/v1/users/#{user.id}", params: { user: user_params }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(JSON.parse({ "message" => "user successfully updated.", "username" => user_params[:username] }.to_json))
    end
    
    
    it 'renders the destroy template with the deleted user' do
      user = User.create(username: 'testuser')
      delete "/api/v1/users/#{user.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include(JSON.parse({ "message" => "User deleted successfully." }.to_json))
    end  
  end
end