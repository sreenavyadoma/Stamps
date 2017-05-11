Then /^load username and password from (?:default parameter file|parameter file (.*))$/ do |filename|
  data_file = registration_parameter_file(filename)

  expect(File.exist?(data_file)).to be_truthy
  yml_file = YAML.load_file(data_file)
  test_param[:username] = yml_file['username']
  test_param[:password] = yml_file['password']
  expect(test_param[:username]).to be_truthy
  expect(test_param[:password]).to be_truthy
end

Then /^store username to (?:default data store file|data store file (.*))$/ do |filename|
  data_file = registration_data_store_file(filename)
  expect(test_param[:username]).to be_truthy
  FileUtils.touch(data_file) unless File.file?(data_file)
  File.open(data_file, 'a+') {|f| f.write("#{test_param[:username]}\n")} unless File.readlines(data_file).to_s.include? test_param[:username]
end

Then /^save username to (?:default parameter file|parameter file (.*))$/ do |filename|
  test_param[:username] = helper.random_username
  test_param[:password] = helper.random_username
  data_file = registration_parameter_file(filename)
  sleep(0.25)
  File.open(data_file, 'w+') {|f| f.write("username: #{test_param[:username]}\n")}
end

Then /^save password to (?:default parameter file|parameter file (.*))$/ do |filename|
  data_file = registration_parameter_file(filename)
  sleep(0.25)
  File.open(data_file, 'a+') {|f| f.write("password: #{test_param[:password]}\n")}
end













Then /^[Oo]n PAM Customer Search page, set username from parameter file$/ do
  config.logger.info "On PAM Customer Search page, set username from parameter file"
  step "On PAM Customer Search page, set username to #{CONFIG['username']}"
end

Then /^[Ss]et PAM Customer Search page username from parameter file$/ do
  logger.info "set PAM Customer Search page username from parameter file"
  step "set PAM Customer Search page username to #{CONFIG['username']}"
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  stamps.orders.landing_page.sign_in(test_param[:username], test_param[:password])
end

