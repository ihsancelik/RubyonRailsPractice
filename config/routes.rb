Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# resources :products do
#   collection do
#     post "add"
#   end
# end

namespace "api" do
    resources :products do
      collection do
        get 'get_by_name'
      end
    end
    resources :categories
end

end
