class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  # https://www.lifewire.com/turn-on-airplay-on-a-mac-5188718
  # rescue_from ::ActionController::RoutingError, with: :routing_error
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::AASM::InvalidTransition, with: :invalid_transition

  # https://stackoverflow.com/a/61266821
  # set status code to 201 ONLY for "create" method on success
  after_action :set_code_on_create, only: [:create]

  def routing_error(error = 'Routing error', status = :not_found, exception = nil)
    render json: { error: error }.to_json, status: status
  end

  protected

  def record_not_found(exception)
    render json: { error: exception.message }.to_json, status: :not_found
  end

  def invalid_transition(exception)
    render json: {
      error: exception.message,
      # traces: exception.backtrace
    }.to_json, status: :bad_request
  end

  def error_occurred(exception)
    render json: { error: exception.message }.to_json, status: :internal_server_error
  end

  private

  def set_code_on_create
    response.status = 201 if response.status == 200
  end
end
