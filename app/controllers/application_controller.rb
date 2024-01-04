class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  private

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end

  def parameter_missing
    render json: { error: 'Required parameter missing' }, status: :unprocessable_entity
  end
end
