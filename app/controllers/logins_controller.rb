class LoginsController < ApplicationController
=begin
	Quando alguem loga, a informação inserida é guardada em uma
	entidade chamada session, e esse session guarda no browser,
	e o browser tem um cookie que armazena essa informação.
=end
  def new
  	# apenas renderiza o template de new para receber as informações
    redirect_to root_path
  end
  
  def create
  	# sempre uma boa pratica usar binding.pry para saber 
  	# quais parametros estão sendo envidos para essa ação
  	# ao digitar binding.pry e params no servidor para
  	# saber quais parametros estão sendo passados
  	user = User.find_by(email: params[:email])
  	# saber se o e-mail é válido:
  	if user && user.authenticate(params[:password]) # segurança?
  		
      # salvando o id do user em session
  		session[:user_id] = user.id
  		#flash[:success] = "You're logged in!"
  		redirect_to user_path(user) if logged_in? # redirecionando para a página perfil daquele user
  	
  	else
  		flash.now[:danger] = "Something Wrong, Your email or password does not match!"
  		redirect_to root_path
  	end
  end  

  def destroy
  	session[:user_id] = nil
  	#flash[:success] = "You have logged out"
  	redirect_to root_path
  end
end