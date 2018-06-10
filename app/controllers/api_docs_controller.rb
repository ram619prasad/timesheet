class ApiDocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Timesheet'
      key :description, 'A Ruby on Rails api for Timesheets'
      contact do
        key :name, 'RPR.Maddi'
      end
      license do
        key :name, 'MIT'
      end
    end
    key :host, 'localhost:3000'
    key :basePath, '/api/v1/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Api::V1::UsersController,
    User,
    ErrorModel,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
