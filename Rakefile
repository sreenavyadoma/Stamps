require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:bvt_qacc_chrome) do |t|
  t.profile = 'default'
  t.cucumber_opts = "-p html_report -p bvt_qacc_chrome"
end

Cucumber::Rake::Task.new(:bvt_qacc_ff) do |t|
  t.profile = 'default'
  t.cucumber_opts = "-p html_report -p bvt_qacc_ff"
end

Cucumber::Rake::Task.new(:bvt_qacc_ie) do |t|
  t.profile = 'default'
  t.cucumber_opts = "-p html_report -p bvt_qacc_ie"
end

Cucumber::Rake::Task.new(:regress_qacc_chrome) do |t|
  t.profile = 'default'
  t.cucumber_opts = "-p html_report -p regress_qacc_chrome"
end

Cucumber::Rake::Task.new(:regress_qacc_ie) do |t|
  t.profile = 'default'
  t.cucumber_opts = "-p html_report -p regress_qacc_ie"
end

Cucumber::Rake::Task.new(:regress_qacc_firefox) do |t|
  t.profile = 'default'
  t.cucumber_opts = "-p html_report -p regress_qacc_firefox"
end
