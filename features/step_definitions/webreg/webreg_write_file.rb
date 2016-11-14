
Then /^Orders: Sign in using Jenkins web reg credentials$/ do
  logger.step "Orders: Sign in"
  File.exist?(webreg_usr_filename).should be_truthy
  CONFIG = YAML.load_file(webreg_usr_filename)
  @webreg_data[:usr] = CONFIG['usr']
  @webreg_data[:pw] = CONFIG['pw']
  @webreg_data[:usr].should be_truthy
  @webreg_data[:pw].should be_truthy
  web_apps.orders.landing_page.sign_in @webreg_data[:usr], @webreg_data[:pw]
end

Then /^PAM Customer Search: Set username as web reg credentials$/ do
  logger.info "PAM Customer Search: Set username as web reg credentials"
  File.exist?(webreg_usr_filename).should be_truthy
  CONFIG = YAML.load_file(webreg_usr_filename)
  @webreg_data[:usr] = CONFIG['usr']
  @webreg_data[:usr].should be_truthy
  step "PAM Customer Search: Set username to #{CONFIG['usr']}"
end

Then /^WebReg Profile: Write credentials to properties file$/ do
  step "WebReg Profile: Write username to properties file"
  step "WebReg Profile: Write password to properties file"
end

Then /^WebReg Profile: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{webreg_usr_filename}"
  sleep 1
  File.open(webreg_usr_filename, 'w+') {|f| f.write("usr: #{@webreg_data[:usr]}\n")}
  step "WebReg Profile: Save username to file"
end

Then /^WebReg Profile: Write password to properties file$/ do
  logger.message "WebReg Profile: Write password to properties file: #{webreg_usr_filename}"
  sleep 1
  File.exist?(webreg_usr_filename).should be_truthy
  File.open(webreg_usr_filename, 'a+') {|f| f.write("pw: #{@webreg_data[:pw]}\n")}
end

Then /^WebReg Profile: Save username to file$/ do
  logger.message "WebReg Profile: Save username to file: #{webreg_data_filename}"
  sleep 1
  if File.exist? webreg_data_filename
    sleep 1
    File.exist?(webreg_data_filename).should be_truthy
    File.open(webreg_data_filename, 'a+') {|f| f.write("#{@webreg_data[:usr]}\n")} unless File.readlines(webreg_data_filename).to_s.include? @webreg_data[:usr]
  else
    sleep 1
    File.open(webreg_data_filename, 'w+') {|f| f.write("#{@webreg_data[:usr]}\n")}
  end
end

Then /^PAM: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{webreg_pam_data_filename}"
  sleep 1
  if File.exist?(webreg_pam_data_filename)
    sleep 1
    File.exist?(webreg_pam_data_filename).should be_truthy
    File.open(webreg_pam_data_filename, 'a+') {|f| f.write("#{@webreg_data[:usr]}\n")} unless File.readlines(webreg_pam_data_filename).to_s.include? @webreg_data[:usr]
  else
    sleep 1
    File.open(webreg_pam_data_filename, 'w+') {|f| f.write("#{@webreg_data[:usr]}\n")}
  end
end

Then /^WebReg PAM Orders: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{webreg_pam_ord_data_filename}"
  sleep 1
  if File.exist? webreg_pam_ord_data_filename
    sleep 2
    File.exist?(webreg_pam_ord_data_filename).should be_truthy
    file_content = File.readlines(webreg_pam_ord_data_filename).to_s
    File.open(webreg_pam_ord_data_filename, 'a+') {|f| f.write("#{@webreg_data[:usr]}\n")} unless file_content.include? @webreg_data[:usr]
  else
    sleep 1
    File.open(webreg_pam_ord_data_filename, 'w+') {|f| f.write("#{@webreg_data[:usr]}\n")}
  end
end


