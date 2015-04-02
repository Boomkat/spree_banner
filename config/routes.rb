Spree::Core::Engine.routes.draw do
  
  namespace :spree do
    resources :tests
  end
  namespace :admin do
    resources :banner_boxes do
      collection do
        post :update_positions
      end
      member do
        get :clone
      end
    end
    resource :banner_box_settings

    resources :banner_box_locations
    resources :banner_box_heros


  end
end
