Then /^[Ss]et [Oo]rders [Ss]ettings [Gg]eneral [Pp]ostdate to (now [+-]\d+ hours|\d{1,2}:\d\d [ap].m.)$/ do |time|
  step "Open Orders Settings General Settings"
  time = TestHelper.now_plus_hh(/[+-]\d+/.match(time).to_s.to_i) unless /^\d{1,2}:\d\d [ap].m.$/.match(time)
  settings = SdcOrders.modals.settings.general_settings
  settings.selection(time)
  5.times do
    settings.postdate_drop_down.click unless settings.selection_obj.present?
    settings.selection_obj.safe_click unless settings.selection_obj.class_disabled?
    break if settings.postdate_text_field.text_value.include?(time)
  end
  expect(settings.postdate_text_field.text_value).to include(time), "Postdate was not selected"
  step "close Orders Settings modal"
end

Then /^[Oo]pen [Oo]rders [Ss]ettings [Mm]odal$/ do
  step 'Wait until order toolbar present 40, 3'
  SdcOrders.toolbar.settings.safe_click
  step 'Wait until Orders Settings Modal present 40, 3'
  expect(SdcOrders.modals.settings.title).to be_present, "Order Settings modal is not present"
end

Then /^[Ww]ait [Uu]ntil [Oo]rders [Ss]ettings [Mm]odal [Pp]resent(?: (\d+), (\d+)|)$/ do |iteration, delay|
  (iteration.zero? ? 20 : iteration).times do
    break if SdcOrders.modals.settings.title.present?
    sleep(delay.zero? ? 0.2 : delay / 10)
  end
end

Then /^[Oo]pen [Oo]rders [Ss]ettings [Gg]eneral [Ss]ettings$/ do
  step 'Open Orders settings modal'
  SdcOrders.modals.settings.general.safe_click
  sleep(0.2)
  expect(SdcOrders.modals.settings.general_settings.title).to be_present, "Order Settings modal is not present"
end

Then /^[Cc]lose [Oo]rders [Ss]ettings [Mm]odal$/ do
  SdcOrders.modals.settings.close.safe_click
  sleep(0.2)
  expect(SdcOrders.modals.settings.general_settings.title).not_to be_present, "Order Settings modal present"
end