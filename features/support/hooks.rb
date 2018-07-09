# encoding: utf-8

include RSpec
include RSpec::Matchers
include DataMagic
include PartnerPortal

class A
  def method2
    'method2'
  end

  def method(str)
    "This is from class A with #{str}"
  end

  def with_args(str)
    "With Args from A #{str}"
  end
end

class B < A
  def method
    'This is from class B'
  end

  def with_args(str, num)
    "With Args from B #{str}, #{num}"
    super(str)
  end
end

b = B.new
p b.method2
p b.with_args('Rob', 1)

Before do |scenario|
  SdcEnv.scenario = scenario
  SdcTest.start
end

After do
  SdcTest.teardown
  # Old framework
  @stamps = nil
  @health = nil
end
