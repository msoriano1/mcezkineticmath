Rails.application.routes.draw do
  
  get '/students', to: 'students#index'
  get '/teachers', to: 'teachers#index'
  
  devise_scope :student do
    authenticated :student do
      resources :yearlevels do
        resources :topics do
          resources :worksheets do
            resources :items
            resources :answered_worksheets do
              resources :studentanswers
            end
          end
        end
      end
      root 'students#splash', as: :authenticated_student
    end
  end
  
  devise_scope :teacher do
    authenticated :teacher do
      resources :yearlevels do
        resources :topics do
          resources :worksheets do
            resources :items
          end
        end
      end
      root 'teachers#splash', as: :authenticated_teacher
    end
  end
  
  
  devise_scope :admin do
    authenticated :admin do
      resources :yearlevels do
        resources :topics do
          resources :worksheets do
            resources :items
          end
        end
      end
      resources :students, only: [:create, :deactivate, :update, :edit]
      resources :teachers, only: [:create, :deactivate, :update, :edit]

      get '/students/deactivate/' =>'students#deactivate'
      get '/students/edit' =>'students#edit'
      put '/students/update' =>'students#update'
      root 'admins#index', as: :authenticated_admin
    end
  end
  
  devise_for :admins
    
  devise_for :teachers
    resources :teachers, except: :create
    resources :teachers_admin, :controller => 'teachers'
  devise_for :students
    resources :students, except: :create
    resources :students_admin, :controller => 'students'
    
    root 'publics#index'
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
