Rails.application.routes.draw do
  scope "api" do
    mount_devise_token_auth_for "User", at: "auth"
  end

  namespace "api" do
    resources :products do
      collection do
        get "get_by_name"
      end
    end
    resources :categories
  end
end
