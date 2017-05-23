module TestHelper
  def config
    @config ||= StampsTestSetup.new
  end

  def helper
    @helper ||= StampsTestHelper.new(config.logger)
  end
end