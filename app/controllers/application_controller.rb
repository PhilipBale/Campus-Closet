class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionsHelper
  include ClothingHelper
  include UsersHelper

  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/outputter/html_outputter'
end
