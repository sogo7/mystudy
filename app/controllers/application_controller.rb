class ApplicationController < ActionController::Base
  include SessionsHelper

  private

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        redirect_to login_path
      end
    end
end
