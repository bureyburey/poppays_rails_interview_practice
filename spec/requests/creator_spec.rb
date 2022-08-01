require 'rails_helper'

RSpec.describe "Creators", type: :request do
  it "GET /index" do
    get "/creators"
    expect(response.content_type).to eq("application/vnd.api+json; charset=utf-8")
    expect(response).to have_http_status(:ok)
  end

  it "POST /creators" do
    post "/creators", :params => {:first_name => "New", :last_name => "Creator"}
    expect(response.content_type).to eq("application/vnd.api+json; charset=utf-8")
    expect(response).to have_http_status(:created)
  end
end
