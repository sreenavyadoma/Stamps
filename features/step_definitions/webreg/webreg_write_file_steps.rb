Then /^WebReg: Load username and password from parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  #config.logger.step "WebReg: Load user credentials from file #{data_file}"
  expect(File.exist?(data_file)).to be_truthy
  CONFIG = YAML.load_file(data_file)
  parameter[:usr] = CONFIG['usr']
  parameter[:pw] = CONFIG['pw']
  expect(parameter[:usr]).to be_truthy
  expect(parameter[:pw]).to be_truthy
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  #config.logger.step "Orders: Sign in"
  stamps.orders.landing_page.sign_in parameter[:usr], parameter[:pw]
end

Then /^[Oo]n PAM Customer Search page, set username from parameter file$/ do
  config.logger.info "On PAM Customer Search page, set username from parameter file"
  step "On PAM Customer Search page, set username to #{CONFIG['usr']}"
end

Then /^WebReg: Save username and password to parameter file(?:| (.*))$/ do |filename|
  step "WebReg: Save username to parameter file #{filename}"
  step "WebReg: Save password to parameter file #{filename}"
end

Then /^WebReg: Save username to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  config.logger.message "WebReg: Save username to parameter file: #{data_file}"
  sleep(0.35)
  File.open(data_file, 'w+') {|f| f.write("usr: #{parameter[:usr]}\n")}
  step "WebReg: Store username to data file #{filename}"
end

Then /^WebReg: Save password to parameter file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_user_parameter_file : webreg_user_parameter_file(filename)
  config.logger.message "WebReg: Save password to parameter file: #{data_file}"
  sleep(0.35)
  File.open(data_file, 'a+') {|f| f.write("pw: #{parameter[:pw]}\n")}
end

Then /^WebReg: Store username to data file(?:| (.*))$/ do |filename|
  data_file = (filename.nil?)? webreg_data_store_filename : webreg_data_store_filename(filename)
  config.logger.message "WebReg: Store username to data file: #{data_file}"
  sleep(2)
  if File.exist? data_file
    expect(parameter[:usr]).to be_truthy
    File.open(data_file, 'a+') {|f| f.write("#{parameter[:usr]}\n")} unless File.readlines(data_file).to_s.include? parameter[:usr]
  else
    File.open(data_file, 'w+') {|f| f.write("#{parameter[:usr]}\n")}
  end
end
