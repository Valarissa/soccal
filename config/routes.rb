Soccal::Application.routes.draw do
  resources :events, :only => [:index]
  match 'events/:from/:to' => 'events#index',
        :as => 'events_within_date_range',
        :constraints => { :from => /\d{4}-\d{2}-\d{2}/,
                          :to => /\d{4}-\d{2}-\d{2}/ }
  resources :calendars, :only => [:show] do
    resources :events, :only => [:index]
  end
end
