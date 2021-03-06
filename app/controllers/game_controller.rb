class GameController < ApplicationController

  def hilo
    @user_guess = params[:user_input].to_i
    random_number = 1 + rand(10)

    #Assigns a random number to a cookie if there is none
    if session[:answer].nil?
      session[:answer] = random_number
      cookies[:attempts] = 0
    end

    #Hi-Lo game
    if @user_guess > session[:answer].to_i
      @message = "Your number is too high!"
      cookies[:attempts] = cookies[:attempts].to_i + 1
      @tries_message = cookies[:attempts]
    elsif @user_guess < session[:answer].to_i
      @message = "Your number is too low!"
      cookies[:attempts] = cookies[:attempts].to_i + 1
      @tries_message = cookies[:attempts]
    else
      @message = "Good job!"
      session[:answer] = random_number
      cookies[:attempts] = cookies[:attempts].to_i + 1
      @tries_message = cookies[:attempts]
      cookies[:attempts] = 0
    end
  end
end
