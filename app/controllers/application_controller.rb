class ApplicationController < ActionController::Base
  #ログイン前の行動を制限
  before_action :authenticate_user!,except: [:top,:about]
  # デバイスにnameを許可
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログイン後の推移先を変更
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  # 新規登録後の推移先を変更
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end
  # ログアウト後の推移先を変更
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
