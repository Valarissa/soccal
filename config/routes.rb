Soccal::Application.routes.draw do
  resources :events, :only => [:index]
  match 'events/:start/:end' => 'events#index',
        :as => 'events_with_range',
        :constraints => { :start => /\d{4}-\d{2}-\d{2}/,
                          :end => /\d{4}-\d{2}-\d{2}/ }
  resources :calendar, :only => [:show] do
    resources :events, :only => [:index]
  end
end
