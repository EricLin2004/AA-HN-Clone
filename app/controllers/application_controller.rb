class ApplicationController < ActionController::Base
  include SessionsHelper
  # REV: Good to include helpers here
  protect_from_forgery
end
