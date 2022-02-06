Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
