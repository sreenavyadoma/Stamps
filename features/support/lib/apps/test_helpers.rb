module Stamps
  module TestHelper
    def test_config
      @config ||= StampsTestSetup.new
    end

    def test_helper
      @helper ||= StampsTestHelper.new(test_config.logger)
    end

    def user_credentials
      @user_credentials ||= StampsUserCredentials.new(db_connection)
      @user_credentials.scenario_name = test_config.scenario_name
      @user_credentials
    end
  end
end