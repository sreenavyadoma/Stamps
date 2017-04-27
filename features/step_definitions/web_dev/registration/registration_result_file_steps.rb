Then /^Registration: Load username and password from parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? registration_user_parameter_file : registration_user_parameter_file(filename)

  expect(File.exist?(data_file)).to be_truthy
  CONFIG = YAML.load_file(data_file)
  parameter[:usr] = CONFIG['usr']
  parameter[:pw] = CONFIG['pw']
  expect(parameter[:usr]).to be_truthy
  expect(parameter[:pw]).to be_truthy
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  stamps.orders.landing_page.sign_in test_parameter[:usr], test_parameter[:pw]
end

Then /^[Oo]n PAM Customer Search page, set username from parameter file$/ do
  config.logger.info "On PAM Customer Search page, set username from parameter file"
  step "On PAM Customer Search page, set username to #{CONFIG['usr']}"
end

Then /^[Ss]et PAM Customer Search page username from parameter file$/ do
  logger.info "set PAM Customer Search page username from parameter file"
  step "set PAM Customer Search page username to #{CONFIG['usr']}"
end

Then /^Registration: Save username and password to parameter file(?:| (.*))$/ do |filename|
  step "Registration: Save username to parameter file #{filename}"
  step "Registration: Save password to parameter file #{filename}"
end

Then /^Registration: Save username to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? registration_user_parameter_file : registration_user_parameter_file(filename)
  config.logger.message "Registration: Save username to parameter file: #{data_file}"
  sleep(0.35)
  File.open(data_file, 'w+') {|f| f.write("usr: #{parameter[:usr]}\n")}
  step "Registration: Store username to data file #{filename}"
end

Then /^Registration: Save password to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? registration_user_parameter_file : registration_user_parameter_file(filename)
  config.logger.message "Registration: Save password to parameter file: #{data_file}"
  sleep(0.35)
  File.open(data_file, 'a+') {|f| f.write("pw: #{parameter[:pw]}\n")}
end

Then /^Registration: Store username to data file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? registration_data_store_filename : registration_data_store_filename(filename)
  config.logger.message "Registration: Store username to data file: #{data_file}"
  sleep(2)
  if File.exist? data_file
    expect(parameter[:usr]).to be_truthy
    File.open(data_file, 'a+') {|f| f.write("#{parameter[:usr]}\n")} unless File.readlines(data_file).to_s.include? parameter[:usr]
  else
    File.open(data_file, 'w+') {|f| f.write("#{parameter[:usr]}\n")}
  end
end
