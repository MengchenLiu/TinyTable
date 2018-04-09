class SessionsController < ApplicationController

  def destroy
    reset_session
    redirect_to "/", notice: "See ya!"
  end

  def new

  end

  def create
    user = User.find_by(name: params["name"])
    if user.present?
      if user.password==params["password"]
        session["user_id"] = user.id     
        redirect_to "/", notice: "Welcome back, #{user.name}"
      else
        redirect_to "/login", notice: "Wrong user name or password!"
      end
    else
      redirect_to "/login", notice: "Wrong user name or password!"
    end
  end

end
