class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end

# memo
# No template for interactive request
# UsersController#show is missing a template for request formats: text/html
# このエラーはusercontrollerに呼応するviews/users/show.html.erb
# がなくて起きた
