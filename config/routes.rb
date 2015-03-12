Powwow::Application.routes.draw do

  resources :submissions

  post '/tinymce_assets' => 'tinymce_assets#create'
  
  resources :webpages

  resources :announcements

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'participants' => 'participants#index', as: :participants

  get 'setticket' => 'applicant#setticket', as: :setticket
  post 'checkdoattend' => 'applicant#checkdoattend', as: :checkdoattend
  get 'applicant' => 'applicant#index', as: :applicant
  
  post 'passport' => 'applicant#passport', as: :passport
  get 'uploadpassport' => 'applicant#uploadpassport', as: :uploadpassport

  get 'archive/plenaries/:year' => 'home#plenaries_archive', as: :plenaries_archive
  get 'archive/plenary/:year/:slug' => 'home#single_plenary', as: :single_plenary_archive
  get 'archive/workshops/:year' => 'home#workshops_archive', as: :workshops_archive
  get 'archive/workshop/:year/:id' => 'home#single_workshop', as: :single_workshop_archive
  get 'archive/abstracts/:year/:type' => 'home#abstracts_archive', as: :presentation_archive
  get 'archive/abstract/:id' => 'home#single_abstract', as: :single_abstract_archive

  get 'participants/new_user/' => 'participants#new_user', as: :new_participant
  post '/participants/create_user/' => 'participants#create_user', as: :create_participant
  get 'participants/edit_user/:user_id' => 'participants#edit_user', as: :edit_participant
  post '/participants/save_edited/:user_id' => 'participants#save_edited', as: :save_edited
  

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
