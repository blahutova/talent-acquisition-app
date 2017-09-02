class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
      render html: "Ahojkyy <3"
    end

end
