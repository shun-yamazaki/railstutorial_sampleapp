module SessionsHelper
  # 渡されたユーザでログインする
  def log_in(user)
    # 一時cookiesにユーザidを登録するRailsの定義済みメソッドsession
    session[:user_id] = user.id
  end

  # 渡されたユーザのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # ログインしている場合はログイン中のユーザを返却する
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id]) # 一時セッション(session[])が切れているので永続セッション(cookies)で再ログイン
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # ユーザがログインしている:true、ログインしていない:false
  def logged_in?
    !!current_user
  end

  # ユーザをログアウトさせる
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # 渡されたユーザの永続セッションを削除する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
