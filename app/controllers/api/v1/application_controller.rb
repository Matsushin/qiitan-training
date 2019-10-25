class Api::V1::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
end