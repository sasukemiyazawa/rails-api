Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'api' do
    namespace 'v1' do
      resources :tokos
      get '/heart', to: 'tokos#heart' #いいね数降順
      get '/random', to: 'tokos#random' #ランダムに一つのデータ
      # get '/:id/Heart', to: 'tokos#fovorite' #いいね機能
    end
  end


end
