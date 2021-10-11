Rails.application.routes.draw do
  root to: 'static_pages#home'
    
  resources :spells
  resources :books
  resources :spellclasses
  
  post 'books/:id', to: 'books#delete_spell', as: 'delete_spell'
  post 'books/:id/add_spell_book', to: 'books#add_spell_book', as: 'add_spell_book'
  get 'spells/:id/add_spell', to: 'spells#add', as: 'add' 
  post 'spells/:id/add_spell_in_book', to: 'spells#add_spell', as: 'add_spell_in_book'
    
end
