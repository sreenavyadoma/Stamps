Then /^WebReg: Load username and password from parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  #logger.step "WebReg: Load user credentials from file #{data_file}"
  File.exist?(data_file).should be_truthy
  CONFIG = YAML.load_file(data_file)
  test_data[:usr] = CONFIG['usr']
  test_data[:pw] = CONFIG['pw']
  test_data[:usr].should be_truthy
  test_data[:pw].should be_truthy
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  #logger.step "Orders: Sign in"
  stamps.orders.landing_page.sign_in test_data[:usr], test_data[:pw]
end

Then /^On PAM Customer Search page, set username from parameter file$/ do
  logger.info "On PAM Customer Search page, set username from parameter file"
  step "On PAM Customer Search page, set username to #{CONFIG['usr']}"
end

Then /^WebReg: Save username and password to parameter file(?:| (.*))$/ do |filename|
  step "WebReg: Save username to parameter file #{filename}"
  step "WebReg: Save password to parameter file #{filename}"
end

Then /^WebReg: Save username to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  logger.message "WebReg: Save username to parameter file: #{data_file}"
  sleep 1
  File.open(data_file, 'w+') {|f| f.write("usr: #{test_data[:usr]}\n")}
  step "WebReg: Store username to data file #{filename}"
end

Then /^WebReg: Save password to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  logger.message "WebReg: Save password to parameter file: #{data_file}"
  sleep 1
  File.open(data_file, 'a+') {|f| f.write("pw: #{test_data[:pw]}\n")}
end

Then /^WebReg: Store username to data file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_data_store_filename : webreg_data_store_filename(filename)
  logger.message "WebReg: Store username to data file: #{data_file}"
  sleep 2
  if File.exist? data_file
    test_data[:usr].should be_truthy
    File.open(data_file, 'a+') {|f| f.write("#{test_data[:usr]}\n")} unless File.readlines(data_file).to_s.include? test_data[:usr]
  else
    File.open(data_file, 'w+') {|f| f.write("#{test_data[:usr]}\n")}
  end
end
