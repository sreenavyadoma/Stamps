# encoding: utf-8
include Stamps
include Stamps::Browser
include Orders
include Print
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation

Before do  |scenario|
  Stamps.init scenario.name
  logger.info "Running Tests..."

  logger.info "---------------- Feature: #{scenario.feature}"
  logger.info "---------------- Scenario: #{scenario.name}"
  logger.info "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| logger.info "---------------- Tag #{index+1}: #{tag.name}" }
  logger.info "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| logger.info "---------------- Step #{index}: #{test_step.source.last.name}" if index>0 }
end

After do |scenario|
  logger.info "Teardown Tests..."
  logger.info "---------------- Feature: #{scenario.feature}"
  logger.info "---------------- Scenario: #{scenario.name}"
  logger.info "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| logger.info "---------------- Tag #{index+1}: #{tag.name}" }
  logger.info "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| logger.info "---------------- Step #{index}: #{test_step.source.last.name}" if index>0 }

  Stamps.teardown

  $start = false

  if scenario.failed?
    logger.error "#{scenario.feature}"
    logger.error "#{scenario.feature} TEST FAILED! #{scenario.exception.message}"
    logger.error "#{scenario.feature}"
  end
end

