Rails.application.routes.draw do

  get 'comments/index'

  resources :notes

  root 'home#index'

  resources :decades, only: [:show]
  resources :genres, only: [:show] #procurar por generos
  resources :regions, only: [:show] # procurar por regiões



  resources :movies, except: :destroy do 
    resources :reviews do 
      resources :comments
    end
    
    member do
      post 'cast'
      post 'director'
      post 'remove_star'
      post 'remove_director'
      post 'save_cast'
      get 'cast'
    end

    member do
      post 'grade'
    end 
  end

  resources :stars, except: :destroy

  resources :directors, except: :destroy

  resources :screenwriters, except: :destroy

  #resources :reviews, except: :destroy

  resources :users, except: :destroy 
    

  get '/register', to: 'users#new' 

 	#  A OPÇÃO INDEX SERVE PARA TODOS DA SEGUINTE MANEIRA, AO DIGITAR O NOME DELES NA BARRA DE BUSCA
 	# 	E AO BUSCAR NOS ARQUIVOS JSON PODEMOS MOSTRAR UM LINK COM ALGUNS RESULTADOS APRESENTADOS, 
 	# 	MAS DEVEMOS FILTRAR SEMPRE POIS NÃO PODEMOS JUTAR OS TIPOS EM APENAS UM INDEX

   


  get '/login', to: 'logins#new' 
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'



  # com essa rota posso ir para uma pagina onde tem o json dos objetos estrela
  # basta agora restringir esse link e dar um jeito de acessar o json dele
  # fazer o mesmo para todos os outros campos 
  get '/stars-get-json', to: 'stars#get_json'
  get '/movies-get-json', to: 'movies#get_json'
  get '/directors-get-json', to: 'directors#get_json' 
  get '/screenwriters-get-json', to: 'screenwriters#get_json'
  # rake routes | grep "key"


  # test request
  # match '/curl_example' => 'stars#curl_get_example', via: :get
  # match '/curl_example' => 'stars#curl_post_example', via: :post

end
