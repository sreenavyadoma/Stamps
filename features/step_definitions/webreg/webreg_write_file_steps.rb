Then /^WebReg: Load username and password from parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  #logger.step "WebReg: Load user credentials from file #{data_file}"
  expect(File.exist?(data_file)).to be_truthy
  CONFIG = YAML.load_file(data_file)
  test_parameter[:usr] = CONFIG['usr']
  test_parameter[:pw] = CONFIG['pw']
  expect(test_parameter[:usr]).to be_truthy
  expect(test_parameter[:pw]).to be_truthy
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  #logger.step "Orders: Sign in"
  stamps.orders.landing_page.sign_in test_parameter[:usr], test_parameter[:pw]
end

Then /^[Oo]n PAM Customer Search page, set username from parameter file$/ do
  logger.info "On PAM Customer Search page, set username from parameter file"
  step "On PAM Customer Search page, set username to #{CONFIG['usr']}"
Then /^(?:S|s)et PAM Customer Search page username from parameter file$/ do
  logger.info "set PAM Customer Search page username from parameter file"
  step "set PAM Customer Search page username to #{CONFIG['usr']}"
end

Then /^WebReg: Save username and password to parameter file(?:| (.*))$/ do |filename|
  step "WebReg: Save username to parameter file #{filename}"
  step "WebReg: Save password to parameter file #{filename}"
end

Then /^WebReg: Save username to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  logger.message "WebReg: Save username to parameter file: #{data_file}"
  sleep(0.35)
  File.open(data_file, 'w+') {|f| f.write("usr: #{test_parameter[:usr]}\n")}
  step "WebReg: Store username to data file #{filename}"
end

Then /^WebReg: Save password to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  logger.message "WebReg: Save password to parameter file: #{data_file}"
  sleep(0.35)
  File.open(data_file, 'a+') {|f| f.write("pw: #{test_parameter[:pw]}\n")}
end

Then /^WebReg: Store username to data file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_data_store_filename : webreg_data_store_filename(filename)
  logger.message "WebReg: Store username to data file: #{data_file}"
  sleep(2)
  if File.exist? data_file
    expect(test_parameter[:usr]).to be_truthy
    File.open(data_file, 'a+') {|f| f.write("#{test_parameter[:usr]}\n")} unless File.readlines(data_file).to_s.include? test_parameter[:usr]
  else
    File.open(data_file, 'w+') {|f| f.write("#{test_parameter[:usr]}\n")}
  end
end
