Then /^[Ee]xpect Style for General Fonts font-family to include (.*)$/ do |font|
  #logger.step "Expect Style for General Fonts font-family to include #{font}"
  expect(stamps.orders.styles.general.fonts.font_family.downcase).to include font
end

Then /^[Ee]xpect Style for General Fonts Size is (.*)$/ do |size|
  #logger.step "Expect Style for General Fonts Size is #{size}"
  expect(stamps.orders.styles.general.fonts.font_size.downcase).to include size
end

Then /^[Ee]xpect Style for General Fonts Color is (.*)$/ do |color|
  #logger.step "Expect Style for General Fonts Color is #{color}"
  expect(stamps.orders.styles.general.fonts.color.downcase).to include color
end

Then /^[Ee]xpect Style for General Tooltip Border width is (.*)$/ do |width|
  #logger.step "Expect Style for General Tooltip Border width is #{width}"
  expect(stamps.orders.styles.general.tooltip.width).to eql "#{width}px"
end

Then /^[Ee]xpect Style for General Tooltip Border style is (.*)$/ do |border_style|
  #logger.step "Expect Style for General Tooltip Border width is #{width}"
  expect(stamps.orders.styles.general.tooltip.border_style.downcase).to eql border_style
end

Then /^[Ee]xpect Style for General Tooltip Border radius is (.*)$/ do |border_style|
  #logger.step "Expect Style for General Tooltip Border radius is #{border_style}"
  expect(stamps.orders.styles.general.tooltip.border_radius.downcase).to include border_style
end

Then /^[Ee]xpect Style for Navigation Header Height is (.*)$/ do |height|
  #logger.step "Expect Style for Navigation Header Height is #{height}"
  expect(stamps.orders.styles.general.navigation_header.height.downcase).to eql height
end

Then /^[Ee]xpect Style for Navigation Background Color is rgba (.*)$/ do |color|
  #logger.step "Expect Style for Navigation Background Color is #{color}"
  expect(stamps.orders.styles.general.navigation_header.background_color.downcase).to include color
end

Then /^[Ee]xpect Style for Navigation Links Color is (.*)$/ do |color|
  #logger.step "Expect Style for Navigation Links Color is #{color}"
  expect(stamps.orders.styles.general.links.color.downcase).to include color
end



