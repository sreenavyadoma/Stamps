require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:bvt_qacc_chrome) do |t|
  t.profile = 'bvt_qacc_chrome'
  t.cucumber_opts = "-p html_report -p bvt_qacc_chrome"
end

Cucumber::Rake::Task.new(:bvt_qacc_ff) do |t|
  t.profile = 'bvt_qacc_ff'
  t.cucumber_opts = "-p html_report -p bvt_qacc_ff"
end

Cucumber::Rake::Task.new(:bvt_qacc_ie) do |t|
  t.profile = 'bvt_qacc_ie'
  t.cucumber_opts = "-p html_report -p bvt_qacc_ie"
end

Cucumber::Rake::Task.new(:print_qacc_chrome) do |t|
  t.profile = 'print_qacc_chrome'
  t.cucumber_opts = "-p html_report -p print_qacc_chrome"
end

Cucumber::Rake::Task.new(:print_qacc_ff) do |t|
  t.profile = 'print_qacc_ff'
  t.cucumber_opts = "-p html_report -p print_qacc_ff"
end

Cucumber::Rake::Task.new(:print_qacc_ie) do |t|
  t.profile = 'print_qacc_ie'
  t.cucumber_opts = "-p html_report -p print_qacc_ie"
end

Cucumber::Rake::Task.new(:address_cleansing_qacc_chrome) do |t|
  t.profile = 'address_cleansing_qacc_chrome'
  t.cucumber_opts = "-p html_report -p address_cleansing_qacc_chrome"
end

Cucumber::Rake::Task.new(:address_cleansing_qacc_ie) do |t|
  t.profile = 'address_cleansing_qacc_ie'
  t.cucumber_opts = "-p html_report -p address_cleansing_qacc_ie"
end

Cucumber::Rake::Task.new(:address_cleansing_qacc_ff) do |t|
  t.profile = 'address_cleansing_qacc_ff'
  t.cucumber_opts = "-p html_report -p address_cleansing_qacc_ff"
end

Cucumber::Rake::Task.new(:regress_qacc_chrome) do |t|
  t.profile = 'regress_qacc_chrome'
  t.cucumber_opts = "-p html_report"
end
