Rails.application.routes.draw do
  root 'home#index'

  resources :movies, except: :destroy

  resources :stars, except: :destroy

  resources :directors, except: :destroy

  resources :screenwriters, except: :destroy

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
