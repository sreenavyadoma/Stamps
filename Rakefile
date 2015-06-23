require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:bvt_qacc_chrome) do |t|
  t.profile = 'bvt_qacc_chrome'
  t.cucumber_opts = "-p html_report"
end

Cucumber::Rake::Task.new(:bvt_qacc_ff) do |t|
  t.profile = 'bvt_qacc_ff'
  t.cucumber_opts = "-p html_report"
end

Cucumber::Rake::Task.new(:bvt_qacc_ie) do |t|
  t.profile = 'bvt_qacc_ie'
  t.cucumber_opts = "-p html_report"
end

Cucumber::Rake::Task.new(:regress_qacc_chrome) do |t|
  t.profile = 'regress_qacc_chrome'
  t.cucumber_opts = "-p html_report"
end

Cucumber::Rake::Task.new(:regress_qacc_ie) do |t|
  t.profile = 'regress_qacc_ie'
  t.cucumber_opts = "-p html_report"
end

Cucumber::Rake::Task.new(:regress_qacc_firefox) do |t|
  t.profile = 'regress_qacc_firefox'
  t.cucumber_opts = "-p html_report"
end
