class Api::V1::UsersController < ApplicationController
  include Swagger::Blocks

  swagger_path '/users/login' do
    operation :post do
      key :description, 'Api for authenting a user. Returns an api_token if success'
      key :produces, ['application/json']
      key :tags, ['user']
      parameter do
        key :name, :user
        key :in, :body
        key :description, 'User login credentials'
        key :required, true
        schema do
          key :'$ref', :UserLogin
        end
      end
      response 200 do
        key :description, 'Api success resoonse'
        schema do
          key :'$ref', :login_success
        end
      end
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

  def login
    byebug
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
