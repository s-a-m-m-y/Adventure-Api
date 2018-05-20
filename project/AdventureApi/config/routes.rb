Rails.application.routes.draw do
  resources :adventure_option_results
  resources :adventure_options do
    collection do
      get "random_result" => "adventure_options#random_result", :as => :random_result
    end
  end
  resources :adventures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'adventures#random'

  get '/adventures/random', to: 'adventures#random'
  get '/adventure_options/random_result', to: 'adventure_options#random_result'
end
