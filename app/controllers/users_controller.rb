class UsersController < ApplicationController


  private
  def post_params
    params.require(:post).permit(:name, :email)
  end

end
