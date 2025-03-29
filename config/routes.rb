Rails.application.routes.draw do
  # UI routes (HTML)
  resources :posts, only: [:index, :show]

  # API routes (JSON)
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :show]
    end
  end
end
