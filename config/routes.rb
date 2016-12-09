Rails.application.routes.draw do
  resources :products, only: :index

  post "/bake_jobs/:product_code",
    controller: :bake_jobs,
    action: :create,
    as: :product_bake_jobs

  resources :bake_jobs, only: [:index, :show] do
    collection  do
      get :in_oven
      delete :flush_jobs
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
