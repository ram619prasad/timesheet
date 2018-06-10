class User < ApplicationRecord
    include Swagger::Blocks

    has_secure_password

    # swagger_schema :User do
    #     key :required, [:id, :email, :password, :country]
    #     property :id do
    #         key :type, :integer,
    #         key :format, :int64
    #     end
    #     property :email do
    #         key :type, :string
    #     end
    #     property :password do
    #         key :type, :string
    #     end
    #     property :country do
    #         key :type, :string
    #     end
    # end

    swagger_schema :UserLogin do
        key :required, [:email, :password]
        property :email do
            key :type, :string
        end
        property :password do
            key :type, :string
        end
    end

    swagger_schema :login_success do
      key :required, [:api_token]
      property :api_token do
          key :type, :string
      end
      property :status do
          key :type, :integer
      end
  end

end
