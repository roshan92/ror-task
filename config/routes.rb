Rails.application.routes.draw do
  mount API =>'/'
  get "/docs" => 'docs#index'
end
