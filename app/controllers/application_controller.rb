class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'predictionio'
  
  require 'openssl'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

end
