class Api::BaseController < ApplicationController
  respond_to :json

  rescue_from BlogPost::BlogPostNotFound do
    render json: { errors: 'record not found' }, status: 404
  end
end
