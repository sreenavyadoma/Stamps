Then /^WebReg: Load username and password from parameter file(?:| (.*))$/ do |filename|
  if filename.nil?
    data_file = webreg_user_parameter_file
  else
    data_file = webreg_user_parameter_file filename
  end
  logger.step "WebReg: Load user credentials from file #{data_file}"
  File.exist?(data_file).should be_truthy
  CONFIG = YAML.load_file(data_file)
  @webreg_data[:usr] = CONFIG['usr']
  @webreg_data[:pw] = CONFIG['pw']
  @webreg_data[:usr].should be_truthy
  @webreg_data[:pw].should be_truthy
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  logger.step "Orders: Sign in"
  stamps.orders.landing_page.sign_in @webreg_data[:usr], @webreg_data[:pw]
end

Then /^PAM Customer Search: Set username from parameter file$/ do
  logger.info "PAM Customer Search: Set username from parameter file"
  step "PAM Customer Search: Set username to #{CONFIG['usr']}"
end

Then /^WebReg: Save username and password to parameter file(?:| (.*))$/ do |filename|
  step "WebReg: Save username to parameter file #{filename}"
  step "WebReg: Save password to parameter file #{filename}"
end

Then /^WebReg: Save username to parameter file(?:| (.*))$/ do |filename|
  if filename.nil?
    data_file = webreg_user_parameter_file
  else
    data_file = webreg_user_parameter_file filename
  end
  logger.message "WebReg: Save username to parameter file: #{data_file}"
  sleep 1
  File.open(data_file, 'w+') {|f| f.write("usr: #{@webreg_data[:usr]}\n")}
  step "WebReg: Store username to data file #{filename}"
end

Then /^WebReg: Save password to parameter file(?:| (.*))$/ do |filename|
  if filename.nil?
    data_file = webreg_user_parameter_file
  else
    data_file = webreg_user_parameter_file filename
  end
  logger.message "WebReg: Save password to parameter file: #{data_file}"
  sleep 1
  File.open(data_file, 'a+') {|f| f.write("pw: #{@webreg_data[:pw]}\n")}
end

Then /^WebReg: Store username to data file(?:| (.*))$/ do |filename|
  if filename.nil?
    data_file = webreg_data_store_filename
  else
    data_file = webreg_data_store_filename filename
  end
  logger.message "WebReg: Store username to data file: #{data_file}"
  sleep 2
  if File.exist? data_file
    @webreg_data[:usr].should be_truthy
    File.open(data_file, 'a+') {|f| f.write("#{@webreg_data[:usr]}\n")} unless File.readlines(data_file).to_s.include? @webreg_data[:usr]
  else
    File.open(data_file, 'w+') {|f| f.write("#{@webreg_data[:usr]}\n")}
  end
end

=begin
Then /^PAM: Write username to properties file$/ do
  logger.message "WebReg: Save username to parameter file: #{webreg_pam_data_filename}"
  sleep 2
  if File.exist?(webreg_pam_data_filename)
    File.open(webreg_pam_data_filename, 'a+') {|f| f.write("#{@webreg_data[:usr]}\n")} unless File.readlines(webreg_pam_data_filename).to_s.include? @webreg_data[:usr]
  else
    File.open(webreg_pam_data_filename, 'w+') {|f| f.write("#{@webreg_data[:usr]}\n")}
  end
end

Then /^WebReg PAM Orders: Write username to properties file$/ do
  logger.message "WebReg: Save username to parameter file: #{webreg_pam_ord_data_filename}"
  sleep 3
  if File.exist? webreg_pam_ord_data_filename
    file_content = File.readlines(webreg_pam_ord_data_filename).to_s
    File.open(webreg_pam_ord_data_filename, 'a+') {|f| f.write("#{@webreg_data[:usr]}\n")} unless file_content.include? @webreg_data[:usr]
  else
    File.open(webreg_pam_ord_data_filename, 'w+') {|f| f.write("#{@webreg_data[:usr]}\n")}
  end
end


=end