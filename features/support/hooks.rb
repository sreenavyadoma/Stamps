# encoding: utf-8
include Stamps
include Stamps::Browser
include Stamps::Orders
include Stamps::Print
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation

Before do  |scenario|
  Stamps.init scenario.name
  logger.message "Running Tests..."
  logger.message "-"
  logger.message "-"
  logger.message "---------------- Feature: #{scenario.feature}"
  logger.message "---------------- Scenario: #{scenario.name}"
  logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| logger.message "---------------- Step #{index+1}: #{test_step.source.last.keyword}#{test_step.source.last.name}"}

  logger.message "-"
  logger.message "-"
end

After do |scenario|
  logger.message "Teardown Tests..."
  logger.message "-"
  logger.message "-"
  logger.message "---------------- Feature: #{scenario.feature}"
  logger.message "---------------- Scenario: #{scenario.name}"
  logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| logger.message "---------------- Step #{index+1}: #{test_step.source.last.keyword}#{test_step.source.last.name}"}
  logger.message "-"
  logger.message "-"

  Stamps.teardown

  $start = false

  if scenario.failed?
    logger.error "#{scenario.feature}"
    logger.error "#{scenario.feature} TEST FAILED! #{scenario.exception.message}"
    logger.error "#{scenario.feature}"
  end
end

