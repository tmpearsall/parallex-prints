Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
  get "shop", to: "pages#shop"
  get "merch", to: "pages#merch"
  get "made-to-order", to: "pages#made_to_order", as: :made_to_order
  get "about", to: "pages#about"
  get "privacy", to: "pages#privacy"
end
