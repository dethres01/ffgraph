Rails.application.routes.draw do
  #uwu module routes
  get "uwu/index"  #uwu_index_path
  get 'uwu/search' => 'uwu#search' #uwu_search_path
  get 'uwu/graph' => 'uwu#graph' #uwu_graph_path
  #root path
  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
