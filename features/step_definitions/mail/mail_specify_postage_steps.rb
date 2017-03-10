# encoding: utf-8

Then /^select Stamps Specify Postage Amount/ do
  stamps.mail.netstamps.specify_postage_amount
end

Then /^Mail Stamps: Set Stamp Amount to \$(.*)$/ do |value|
  stamps.mail.netstamps.specify_postage_amount.stamp_amount.set(value)
end

