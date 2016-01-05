Rails.application.routes.draw do
  root :to => 'home#index'
  resources :home
  get "/login"=> "login#index"
  post "/login"=> "login#login"
  get "/exit"=> "login#logout"


  get "/find_tags"=>"tags#find_tags"

  get "/search" => "news#search"

  get "/news/:slug" => "news#show"
  post "/news_avaliable" => "news#avaliable"

  get "/video/:slug" => "videos#show"
  post "/video_avaliable" => "videos#avaliable"

  post "/comments/news" => "comments#news"
  post "/comments/video" => "comments#video"

  namespace :admin do
    get "/"=>"home#index"
    get "/users"=> "users#index"
    get "/user/new"=> "users#new"
    get "/user/:id"=> "users#edit"
    post "/user/:id"=> "users#update"
    post "/user"=> "users#create"
    get "/profile"=>"users#profile"

    get "/news"=> "news#index"
    get "/news/new"=> "news#new"
    get "/news/:id"=> "news#edit"
    post "/news/:id"=> "news#update"
    post "/news"=> "news#create"
    post "/register" => "users#auto_register"

    get "/videos"=> "videos#index"
    get "/video/new"=> "videos#new"
    get "/video/:id"=> "videos#edit"
    post "/video/:id"=> "videos#update"
    post "/video"=> "videos#create"

    get "/comments_news" => "comments_news#index"
    post "/comments/valid" => "comments_news#valid"

    get "/comments_videos" => "comments_videos#index"
    post "/comments/valid_video" => "comments_videos#valid"

    resources :home
  end
end
