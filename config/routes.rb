Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'api' do
    namespace 'v1' do
      get 'tokos/random', to: 'tokos#random' #ランダムに一つのデータ
      get 'tokos/heart', to: 'tokos#heart' #いいね数降順
      resources :tokos do
        get 'favorite', to: 'tokos#favorite' #いいね機能
      end
        
    end
  end


end
