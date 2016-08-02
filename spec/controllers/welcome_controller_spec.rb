require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "Get Index" do
    it "Returns HTTP Success" do
      get root_path
      expect(response).to have_http_status(:status)
    end
  end

end
