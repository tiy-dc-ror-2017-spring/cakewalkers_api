Rails.application.routes.draw do
  resources :products, only: :index
  post "/bake_jobs/:product_code",
       controller: :bake_jobs,
       action: :create,
       as: :product_bake_jobs

  resources :bake_jobs, only: %i(index show) do
    collection do
      get :in_oven
      delete :flush_jobs
    end
  end
  root controller: :welcome, action: :index
end
