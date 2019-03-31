module SessionsHelper
  # 渡されたユーザでログインする
  def log_in(user)
    # 一時cookiesにユーザidを登録するRailsの定義済みメソッドsession
    session[:user_id] = user.id
  end

  # ログインしている場合はログイン中のユーザを返却する
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザがログインしている:true、ログインしていない:false
  def logged_in?
    !!current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
