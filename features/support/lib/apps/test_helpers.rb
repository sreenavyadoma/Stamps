module Stamps
  module TestHelper

    def test_helper
      @helper ||= StampsTestHelper.new(StampsTest.log)
    end

    def user_credentials
      @user_credentials ||= StampsUserCredentials.new(db_connection)
      @user_credentials.scenario_name=StampsTest.scenario_name
      @user_credentials
    end
  end
end