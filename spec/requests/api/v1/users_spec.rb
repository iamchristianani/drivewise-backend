require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    get('list users') do
      tags 'Users'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string, example: Faker::Internet.username }
        },
        required: %w[username]
      }
      response(201, 'successful') do
        let(:user) { user_params }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      tags 'Users'
      response(200, 'successful') do
        let(:id) { User.create(user_params).id }
        run_test!
      end
    end

    patch('update user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string, example: Faker::Internet.username }
        },
        required: %w[username]
      }

      response(200, 'successful') do
        let(:id) { User.create(user_params).id }
        let(:user) { { username: 'testusername' } }
        run_test!
      end
    end

    delete('delete user') do
      tags 'Users'
      response(200, 'successful') do
        let(:id) { User.create(user_params).id }
        run_test!
      end
    end
  end

  def user_params
    {
      username: Faker::Internet.username
    }
  end
end
