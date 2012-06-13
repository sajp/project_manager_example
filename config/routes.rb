ProjectManager::Application.routes.draw do
  resources :projects, :except => [:destroy]
  root :to => "projects#index"
end
