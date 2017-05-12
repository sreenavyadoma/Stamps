module TestHelper
  def config
    @config ||= StampsTestConfig.new
  end

  def helper
    @helper ||= StampsTestHelper.new(config.logger)
  end
end