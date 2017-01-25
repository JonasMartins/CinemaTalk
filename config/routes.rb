Rails.application.routes.draw do

  resources :notes
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


  # com essa rota posso ir para uma pagina onde tem o json dos objetos estrela
  # basta agora restringir esse link e dar um jeito de acessar o json dele
  # fazer o mesmo para todos os outros campos 
  get '/stars-get-json', to: 'stars#get_json'

  post '/stars', to: 'stars#ajax'
  # rake routes | grep "key"


  # test request
  # match '/curl_example' => 'stars#curl_get_example', via: :get
  # match '/curl_example' => 'stars#curl_post_example', via: :post

end
