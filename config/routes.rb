Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "posts#index"
  root :to => redirect("/wiki")

  get "/wiki" => "wiki#index"
  get "/wiki/new" => "wiki#new"
  post "/wiki/create" => "wiki#create"

  get "/wiki/:page_name" => "wiki#show"
end
