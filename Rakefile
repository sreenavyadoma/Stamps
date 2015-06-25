require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:bvt_qacc_chrome) do |t|
  t.profile = 'bvt_qacc_chrome'
  t.cucumber_opts = "-p report -p bvt_qacc_chrome"
end

Cucumber::Rake::Task.new(:bvt_qacc_ff) do |t|
  t.profile = 'bvt_qacc_ff'
  t.cucumber_opts = "-p report -p bvt_qacc_ff"
end

Cucumber::Rake::Task.new(:bvt_qacc_ie) do |t|
  t.profile = 'bvt_qacc_ie'
  t.cucumber_opts = "-p report -p bvt_qacc_ie"
end

Cucumber::Rake::Task.new(:regress_qacc_chrome) do |t|
  t.profile = 'regress_qacc_chrome'
  t.cucumber_opts = "-p report -p regress_qacc_chrome"
end

Cucumber::Rake::Task.new(:regress_qacc_ie) do |t|
  t.profile = 'regress_qacc_ie'
  t.cucumber_opts = "-p report -p regress_qacc_ie"
end

Cucumber::Rake::Task.new(:regress_qacc_firefox) do |t|
  t.profile = 'regress_qacc_firefox'
  t.cucumber_opts = "-p report -p regress_qacc_firefox"
end

Cucumber::Rake::Task.new(:print_sample_priority_mail_package) do |t|
  t.profile = 'print_sample_priority_mail_package'
  t.cucumber_opts = "-p report -p print_sample_priority_mail_package"
end

Cucumber::Rake::Task.new(:print_qacc_chrome) do |t|
  t.profile = 'print_qacc_chrome'
  t.cucumber_opts = "-p report -p print_qacc_chrome"
end

