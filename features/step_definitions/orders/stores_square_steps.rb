Then /^[Ee]xpect [Ss]quare [Ss]tore modal present$/ do
  expect(stamps.orders.marketplace.square.present?).to be(true), "Sqaure Store is not present"
end

Then /^[Ee]xpect [Ss]quare logo present$/ do
  expect(stamps.orders.marketplace.square.store_icon.present?).to be(true), "Sqaure logo is not present"
end

Then /^[Ee]xpect [Ss]quare [Aa]uthorize [Bb]utton present$/ do
  expect(stamps.orders.marketplace.square.authorize_btn.present?).to be(true), "Sqaure Authorize Button is not present"
end

Then /^[Cc]lick [Ss]quare [Aa]uthorize [Bb]utton$/ do
  stamps.orders.marketplace.square.authorize_btn.click
end

#### Settings Modal ####

Then /^[Ee]xpect [Ss]quare [Ss]ettings [Dd]ialog is present$/ do
  step "pause for 5 seconds"
  expect(stamps.orders.marketplace.square.settings.window_title.present?).to be(true), "Sqaure Settings dialog is not present"
end

Then /^[Ee]xpect [Ss]ettings [Dd]ialog [Gg]eneral [Ss]ettings is present$/ do
  expect(stamps.orders.marketplace.square.settings.title_text.present?).to be(true), "Sqaure General Settings part is not present"
end

Then /^[Ss]et [Ss]ettings [Dd]ialog [Ss]tore NickName to (.*)$/ do |str|
  stamps.orders.marketplace.square.settings.store_nickname.set(str)
end

Then /^[Cc]heck Settings dialog store import new orders$/ do
  stamps.orders.marketplace.square.settings.checkbox.check
end

Then /^[Ee]xpect Settings dialog store import new orders is checked$/ do
  expect(stamps.orders.marketplace.square.settings.checkbox.checked?).to be(true), "Automatically import new orders is NOT checked"
end

Then /^[Uu]ncheck Settings dialog store import new orders$/ do
  stamps.orders.marketplace.square.settings.checkbox.uncheck
end

Then /^[Ee]xpect Settings dialog store import new orders is Unchecked$/ do
  expect(stamps.orders.marketplace.square.settings.checkbox.checked?).not_to be(true), "Automatically import new orders is NOT unchecked"
end