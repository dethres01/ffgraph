Rails.application.routes.draw do
  get "uwu/index"  
  #search method
  get 'uwu/search' => 'uwu#search'
  get 'uwu/graph' => 'uwu#graph'
  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
