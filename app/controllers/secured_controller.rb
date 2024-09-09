class SecuredController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: "This is a secured route. You are authenticated." }
  end
end
