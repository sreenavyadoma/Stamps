Then /^User views the Orders tab$/ do

end

Then /^[Ww]ait [Uu]ntil [Oo]rders [Ll]oaded (\d+)$/ do |delay|
  (delay.nil? || delay == 0 ? 5 : delay.to_i).times do
    break unless SdcWebsite.orders.loading_popup.present?
    sleep(1)
  end
end