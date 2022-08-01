class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # https://stackoverflow.com/a/61266821
  # set status code to 201 ONLY for "create" method on success
  after_action :set_code_on_create, only: [:create]

  private
  def set_code_on_create
    response.status = 201 if response.status == 200
  end
end
