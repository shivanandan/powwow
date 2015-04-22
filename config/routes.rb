Powwow::Application.routes.draw do

  resources :reviews

  resources :submissions

  post '/tinymce_assets' => 'tinymce_assets#create'

  resources :webpages

  resources :announcements

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



  get 'applicant' => 'applicant#index', as: :applicant
  get 'setticket' => 'applicant#setticket', as: :setticket
  post 'checkdoattend' => 'applicant#checkdoattend', as: :checkdoattend
  post 'passport' => 'applicant#passport', as: :passport
  get 'uploadpassport' => 'applicant#uploadpassport', as: :uploadpassport


  get 'reviewer' => 'reviewer#index', as: :reviewer
  get 'reviewer/review/:submission_id' => 'reviewer#review_submission', as: :review_submission

  get 'archive/plenaries/:year' => 'home#plenaries_archive', as: :plenaries_archive
  get 'archive/plenary/:year/:slug' => 'home#single_plenary', as: :single_plenary_archive
  get 'archive/workshops/:year' => 'home#workshops_archive', as: :workshops_archive
  get 'archive/workshop/:year/:id' => 'home#single_workshop', as: :single_workshop_archive
  get 'archive/abstracts/:year/:type' => 'home#abstracts_archive', as: :presentation_archive
  get 'archive/abstract/:id' => 'home#single_abstract', as: :single_abstract_archive

  get 'participants' => 'participants#index', as: :participants
  get 'participants/new_user/' => 'participants#new_user', as: :new_participant
  post '/participants/create_user/' => 'participants#create_user', as: :create_participant
  get 'participants/edit_user/:user_id' => 'participants#edit_user', as: :edit_participant
  post '/participants/save_edited/:user_id' => 'participants#save_edited', as: :save_edited
  post 'participants/new_ticket/:user_id' => 'participants#new_ticket', as: :new_ticket
  get 'participants/all_reviewers/' => 'participants#all_reviewers', as: :all_reviewers
  get 'participants/non_indian/' => 'participants#non_indian', as: :non_indian_participants

  post 'submissions/lock/:id' => 'submissions#lock', as: :lock_submission
  post 'submissions/unlock/:id' => 'submissions#unlock', as: :unlock_submission

  get 'review_overview' => 'reviews#overview', as: :review_overview
  get 'get_free_reviewers/:submission_id' => 'reviews#get_free_reviewers', as: :get_free_reviewers
  post 'assign_reviewer/:submission_id/:reviewer_id' => 'reviews#assign_reviewer', as: :assign_reviewer
  delete 'unassign_reviewer/:submission_id/:reviewer_id' => 'reviews#unassign_reviewer', as: :unassign_reviewer
  post 'alert_reviewers/:user_id' => 'reviews#alert_reviewers', as: :alert_reviewers

  get 'transfer' => 'home#post_login', as: :post_login


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
