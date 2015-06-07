class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def formata_data(data)
  	data.strftime("%d/%m/%Y ás %H:%M ")
  end

  helper_method :formata_data
end
