Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/edit'

  get 'reviews/new'

  get 'screenwriters/index'

  get 'screenwriters/show'

  get 'screenwriters/edit'

  get 'screenwriters/new'

  get 'directors/index'

  get 'directors/show'

  get 'directors/edit'

  get 'directors/new'

  get 'stars/index'

  get 'stars/show'

  get 'stars/edit'

  get 'stars/new'

  get 'movies/index'

  get 'movies/show'

  get 'movies/edit'

  get 'movies/new'

  get 'regions/show'

  get 'genres/show'

  get 'decades/show'

  get 'users/index'

  get 'users/new'

  get 'users/edit'

  root 'home#index'

  resources :movies, except: :destroy

  resources :stars, except: :destroy

  resources :directors, except: :destroy

  resources :screewriters, except: :destroy

  resources :reviews, except: :destroy

 	resources :users, except: :destroy 

 	#  A OPÇÃO INDEX SERVE PARA TODOS DA SEGUINTE MANEIRA, AO DIGITAR O NOME DELES NA BARRA DE BUSCA
 	# 	E AO BUSCAR NOS ARQUIVOS JSON PODEMOS MOSTRAR UM LINK COM ALGUNS RESULTADOS APRESENTADOS, 
 	# 	MAS DEVEMOS FILTRAR SEMPRE POIS NÃO PODEMOS JUTAR OS TIPOS EM APENAS UM INDEX


  resources :decades, only: [:show] #procurar por decadas
  resources :genres, only: [:show] #procurar por generos
  resources :regions, only: [:show] # procurar por regiões 

  # Creating Login/logout action routes: ISSO VEM DEPOIS DO PASSWORD SETADO	
  get '/login', to: 'logins#new' 
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'


  # rake routes | grep "key"


end
