class ApplicationController < ActionController::Base
  #ログイン前の行動を制限
  def authenticate_any!
    if admin_signed_in?
      true
    else
      authenticate_user!
    end
  end
  # デバイスにnameを許可
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログイン後の推移先を変更
  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(current_user.id)
    elsif admin_signed_in?
      games_path
    end
  end
  # 新規登録後の推移先を変更
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
  # ログアウト後の推移先を変更
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :user
      new_user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
