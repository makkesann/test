Rails.application.routes.draw do
  devise_for :admins
  namespace 'users' do
    resources :users do 
      namespace 'api' do
        namespace 'v1' do
          resources :books
        end
      end
      resources :books do
        collection do
          get "publish"
        end
      end
    end
  end
  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
