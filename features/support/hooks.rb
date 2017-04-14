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
  config.init(scenario.name, ENV["BROWSER"], ENV["FIREFOX_PROFILE"], nil)
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "Cucumber Test: #{ENV['USER_CREDENTIALS']}"
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "URL: #{ENV['URL']}"
  expect("").to eql "Environment variable URL is not defined!" if (ENV['URL'].nil? || ENV['URL'].size==0)
  config.logger.message "Test Name: #{ENV['USER_CREDENTIALS']}"
  config.logger.message "Browser: #{ENV['BROWSER']}"
  expect("").to eql "Environment variable BROWSER is not defined!" if (ENV['BROWSER'].nil? || ENV['BROWSER'].size==0)
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "Verbose: #{ENV['DEBUG']}"
  expect(ENV['DEBUG']).to be_truthy
  config.logger.message "Healthcheck: #{ENV['HEALTHCHECK']}"
  expect(ENV['HEALTHCHECK']).to be_truthy
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "USER CREDENTIALS"

  # process username from default.yml
  begin
    expect(ENV['WEB_APP'].nil?).not_to be_nil, "Missing WEB_APP variable on default.yml file or Jenkins parameter list."

    if (ENV['WEB_APP'].downcase == 'orders') || (ENV['WEB_APP'].downcase == 'mail' || (ENV['WEB_APP'].downcase.include? 'reg'))
      if (ENV['USR'].nil?) || (ENV['USR'].size==0) || (ENV['USR'].downcase == 'default') || (ENV['USR'].downcase == 'jenkins')
        config.logger.message "Using Default Credentials from ../config/data/default.yml"
        begin
          if ENV['WEB_APP'].downcase == 'orders'
            ENV['USR'] = data_for(:orders_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['usr']
          elsif ENV['WEB_APP'].downcase== 'mail'
            ENV['USR'] = data_for(:mail_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['usr']
          else
            expect("Valid WEB_APP values are orders and mail. You may add to the list, see hooks.rb").to eql "Invalid WEB_APP selection. #{ENV['WEB_APP']} is not recognized."
          end
        rescue => e
          if e.message.include? "mapping values are not allowed"
            expect("Formatting issues in default.yml file").to eql "default.yml - #{e.message.split(':').last}}"
          else
            expect("There are no user credentials in default.yml file for WEB_APP=#{ENV['WEB_APP']}, #{(ENV['WEB_APP'].downcase=='orders')?"orders_credentials":"mail_credentials"}:#{ENV['URL']}:#{ENV['USER_CREDENTIALS']}").to eql "Missing credentials in default.yml #{(ENV['WEB_APP'].downcase=='orders')?"orders_credentials":"mail_credentials"}:#{ENV['URL']}:#{ENV['USER_CREDENTIALS']} - #{e.message}"
          end
        end
        begin
          if ENV['WEB_APP'].downcase == 'orders'
            ENV['PW'] = data_for(:orders_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['pw']
          else
            ENV['PW'] = data_for(:mail_credentials, {})[ENV['URL']][ENV['USER_CREDENTIALS']]['pw']
          end
        rescue => e
          expect("Missing credentials in #{ENV['WEB_APP']} Parameter credentials #{ENV['URL']}:#{ENV['USER_CREDENTIALS']}").to eql "There are no user credentials defined in default.yml file for URL:#{ENV['URL']} USER_CREDENTIALS:#{ENV['USER_CREDENTIALS']} usr:#{ENV['usr']} - #{e.message}"
        end
        config.logger.message "#{ENV['WEB_APP']} Default Username: #{ENV['USR']}"
      else
        config.logger.message "Environment Variable Username (USR) is defined: #{ENV['USR']}"
      end
    else
      expect("Valid values are WEB_APP=orders or WEB_APP=mail").to eql "WEB_APP=#{ENV['WEB_APP']} is not a valid value."
    end
  end unless (ENV['USER_CREDENTIALS'].nil? || ENV['USER_CREDENTIALS'] == 'healthcheck' || ENV['USER_CREDENTIALS'].include?('webreg') || ENV['USER_CREDENTIALS'].include?('pam') || ENV['USER_CREDENTIALS'].include?('intellij') || ENV['USER_CREDENTIALS'].include?('developers'))

  test_parameter[:username] = ENV['USR']
  test_parameter[:web_app] = ENV['WEB_APP']
  test_parameter[:url] = ENV['URL']
  test_parameter[:test] = ENV['USER_CREDENTIALS']
  config.logger.message "-"
  config.logger.message "Running Tests..."
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "---------------- Feature: #{scenario.feature}"
  config.logger.message "---------------- Scenario: #{scenario.name}"
  config.logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| config.logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  config.logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| config.logger.message "---------------- Step #{index+1}: #{test_step.source.last.keyword}#{test_step.source.last.name}"}
  config.logger.message "-"
  config.logger.message "-"
end

After do |scenario|
  config.logger.message "Teardown Tests..."
  config.logger.message "-"
  config.logger.message "-"
  config.logger.message "---------------- Feature: #{scenario.feature}"
  config.logger.message "---------------- Scenario: #{scenario.name}"
  config.logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| config.logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  config.logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| config.logger.message "---------------- Step #{index}: #{test_step.source.last.keyword}#{test_step.source.last.name}" if index>0}
  config.logger.message "-"
  config.logger.message "-"

  test_config.teardown

  if scenario.failed?
    config.logger.error "#{scenario.feature}"
    config.logger.error "#{scenario.feature} USER_CREDENTIALS FAILED! #{scenario.exception.message}"
    config.logger.error "#{scenario.feature}"
  end
  config.logger.step "  --  Test Parameters"
  test_parameter.each do |key, value|
    config.logger.step "  --  #{key} : #{value}"
  end
end

