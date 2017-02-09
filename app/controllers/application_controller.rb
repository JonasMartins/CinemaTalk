class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # fazendo com que esse métodos não sejam apenas vistos pelos controllers, mas pelas views também.
  helper_method :current_user, :logged_in?

  def current_user
  	# pegando o user atualmente logado, if trta da exeção
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	# memiozation: ||= salva isso a variável @current_user, e se chamar muitas veses
  	# ele já busca pelo current_user correto sem ter que calcular tudo novamente
  	# e fazer uma nova requisição no banco
  end
  
  def logged_in?
  	!!current_user # faz a dinstinção se o usuário está logado ou não
  end

  def require_user
    if !logged_in?
      redirect_to root_path
    end
  end

  def require_user_critic
    if !logged_in? || current_user.user_level_id < 2
      redirect_to root_path
    end
  end

  def require_user_admin
    if !logged_in? || current_user.user_level_id < 3
      redirect_to root_path
    end
  end
end
