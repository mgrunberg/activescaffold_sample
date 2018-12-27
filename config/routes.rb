Rails.application.routes.draw do
  concern :active_scaffold_association, ActiveScaffold::Routing::Association.new
  concern :active_scaffold, ActiveScaffold::Routing::Basic.new(association: true)
  resources :categories, concerns: :active_scaffold
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
