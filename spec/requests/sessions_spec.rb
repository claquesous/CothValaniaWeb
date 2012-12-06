require 'spec_helper'

describe "Sessions" do
  describe "GET /login" do
    it "allows anyone" do
      get login_path
      response.status.should be(200)
    end
  end
  describe "GET /logout" do
    it "redirects everyone" do
      get logout_path
      response.status.should be(302)
    end
  end
end
