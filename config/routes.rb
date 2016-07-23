Rails.application.routes.draw do
  root :to => "application#quicksort"
  get "/debug" => "application#debug"
end
