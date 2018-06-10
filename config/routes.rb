Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :api_docs, only: [:index]

  namespace :api do
    namespace :v1 do

      resources :users do
        collection do
          post :login
        end
      end
    end
  end

end
