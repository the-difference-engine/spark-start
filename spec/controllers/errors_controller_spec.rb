require 'rails_helper'
include Auth0

RSpec.describe ErrorsController, type: :controller do
  xdescribe "#redirect_bad_url" do
    it "expect to get 200 ok" do
      expect(:get => "/not_a_good_route").to have_http_status(200)
    end
  end

end
