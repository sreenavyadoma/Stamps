module TestHelper
  def test_config
    @config ||= StampsTestSetup.new
  end

  def test_helper
    @helper ||= StampsTestHelper.new(test_config.logger)
  end
end