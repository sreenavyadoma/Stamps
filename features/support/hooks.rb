# encoding: utf-8
include Stamps
include Stamps::Browser
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation
include Spreadsheet

Before do  |scenario|
  Stamps.init scenario.name
  scenario.feature.name
  logger.message "-"
  logger.message "-"
  logger.message "Cucumber Test: #{ENV['USER_CREDENTIALS']}"
  logger.message "-"
  logger.message "-"
  logger.message "URL: #{ENV['URL']}"
  "".should eql "Environment variable URL is not defined!" if (ENV['URL'].nil? || ENV['URL'].size==0)
  logger.message "Test Name: #{ENV['USER_CREDENTIALS']}"
  "".should eql "Environment variable USER_CREDENTIALS is not defined!" if (ENV['USER_CREDENTIALS'].nil? || ENV['USER_CREDENTIALS'].size==0)
  logger.message "Browser: #{ENV['BROWSER']}"
  "".should eql "Environment variable BROWSER is not defined!" if (ENV['BROWSER'].nil? || ENV['BROWSER'].size==0)
  logger.message "-"
  logger.message "-"
  logger.message "Verbose: #{ENV['VERBOSE']}"
  ENV['VERBOSE'].should be_truthy
  logger.message "Healthcheck: #{ENV['HEALTHCHECK']}"
  ENV['HEALTHCHECK'].should be_truthy
  logger.message "-"
  logger.message "-"

  logger.message "-"
  logger.message "USER CREDENTIALS"

  # process username from default.yml
  begin
    if ENV['WEB_APP'].nil?
      "cucumber.yml: Missing WEB_APP variable".should eql "WEB_APP is nil"
    elsif (ENV['WEB_APP'].downcase == 'orders') || (ENV['WEB_APP'].downcase == 'mail' || (ENV['WEB_APP'].downcase.include? 'reg'))
      if (ENV['USR'].nil?) || (ENV['USR'].size==0) || (ENV['USR'].downcase == 'default') || (ENV['USR'].downcase == 'jenkins')
        logger.message "Using Default Credentials from ../config/data/default.yml"
        begin
          if ENV['WEB_APP'].downcase == 'orders'
            ENV['USR'] = data_for(:orders_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['usr']
          elsif ENV['WEB_APP'].downcase== 'mail'
            ENV['USR'] = data_for(:mail_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['usr']
          else
            "Valid WEB_APP values are orders and mail. You may add to the list, see hooks.rb".should eql "Invalid WEB_APP selection. #{ENV['WEB_APP']} is not recognized."
          end
        rescue => e
          if e.message.include? "mapping values are not allowed"
            "Formatting issues in default.yml file".should eql "default.yml - #{e.message.split(':').last}}"
          else
            "There are no user credentials in default.yml file for WEB_APP=#{ENV['WEB_APP']}, #{(ENV['WEB_APP'].downcase=='orders')?"orders_credentials":"mail_credentials"}:#{ENV['URL']}:#{ENV['USER_CREDENTIALS']}".should eql "Missing credentials in default.yml #{(ENV['WEB_APP'].downcase=='orders')?"orders_credentials":"mail_credentials"}:#{ENV['URL']}:#{ENV['USER_CREDENTIALS']} - #{e.message}"
          end
        end
        begin
          if ENV['WEB_APP'].downcase == 'orders'
            ENV['PW'] = data_for(:orders_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['pw']
          else
            ENV['PW'] = data_for(:mail_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['pw']
          end
        rescue => e
          "Missing credentials in #{ENV['WEB_APP']} Parameter credentials #{ENV['URL']}:#{ENV['USER_CREDENTIALS']}".should eql "There are no user credentials defined in default.yml file for URL:#{ENV['URL']} USER_CREDENTIALS:#{ENV['USER_CREDENTIALS']} usr:#{ENV['usr']} - #{e.message}"
        end
        logger.message "#{ENV['WEB_APP']} Default Username: #{ENV['USR']}"
      else
        logger.message "Environment Variable Username (USR) is defined: #{ENV['USR']}"
      end
    else
      "Valid values are WEB_APP=orders or WEB_APP=mail".should eql "WEB_APP=#{ENV['WEB_APP']} is not a valid value."
    end
  end unless (ENV['USER_CREDENTIALS'] == 'healthcheck' || ENV['USER_CREDENTIALS'].include?('webreg') || ENV['USER_CREDENTIALS'].include?('pam') || ENV['USER_CREDENTIALS'].include?('intellij'))

  test_data[:username] = ENV['USR']
  test_data[:web_app] = ENV['WEB_APP']
  test_data[:url] = ENV['URL']
  test_data[:test] = ENV['USER_CREDENTIALS']

  logger.message "-"
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
  scenario.test_steps.each_with_index { |test_step, index| logger.message "---------------- Step #{index}: #{test_step.source.last.keyword}#{test_step.source.last.name}" if index>0}
  logger.message "-"
  logger.message "-"

  Stamps.teardown

  if scenario.failed?
    logger.error "#{scenario.feature}"
    logger.error "#{scenario.feature} USER_CREDENTIALS FAILED! #{scenario.exception.message}"
    logger.error "#{scenario.feature}"
  end
  logger.step "  --  Test Parameters"
  test_data.each do |key, value|
    logger.step "  --  #{key} : #{value}"
  end

  logger.step "  --  Test Parameters"
  test_data.each_key { |key_value_array| logger.step("#{key_value_array} : #{test_data[key_value_array]}") }
end

