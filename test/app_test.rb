require_relative "helper"

scope do
  describe "GET /" do
    setup { get "/" }
    should "successfully render" do
      assert /Incidents/.match last_response.body
    end
  end

  describe "GET /foo" do
    setup { get "/foo" }
    should "be not found" do
      assert_equal 404, last_response.status
    end
  end
end
