Rails.application.routes.draw do

  %w(Student Teacher).each do |t|
    authenticated :user, lambda { |u| u.type == t } do
      root to: "#{ t.pluralize.underscore }#index", as: "#{ t.downcase }_root".to_sym
    end
  end

  root to: "pages#home"
  get 'auth' => "pages#auth"

  resources :courses
  resources :assignments

  post "/students/:id/add_course" => "student_addons#add_course", as: :add_course_student
  delete "/students/:id/leave_course/:course_id" => "student_addons#leave_course", as: :leave_course_student

  patch "/student_assignments/:id/complete" => "student_addons#complete_assignment", as: :complete_student_assignment
  patch "/student_assignments/:id/uncomplete" => "student_addons#uncomplete_assignment", as: :uncomplete_student_assignment

  post "/courses/:id/add_link" => "addons#add_link", as: :add_link_course
  delete "/courses/:id/delete_link/:link_id" => "addons#delete_link", as: :delete_link_course

  post "/courses/:id/add_file" => "addons#add_file", as: :add_file_course
  delete "/courses/:id/delete_file/:file_id" => "addons#delete_file", as: :delete_file_course

  devise_for :users, skip: :registrations
  devise_for :students, :teachers, controllers: { registrations: "registrations" }, skip: :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
