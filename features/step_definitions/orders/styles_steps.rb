Then /^Expect Style for General Fonts font-family to include (.*)$/ do |font|
  logger.step "Expect Style for General Fonts font-family to include #{font}"
  stamps.orders.styles.general.fonts.font_family.downcase.should include font
end

Then /^Expect Style for General Fonts Size is (.*)$/ do |size|
  logger.step "Expect Style for General Fonts Size is #{size}"
  stamps.orders.styles.general.fonts.font_size.downcase.should include size
end

Then /^Expect Style for General Fonts Color is (.*)$/ do |color|
  logger.step "Expect Style for General Fonts Color is #{color}"
  stamps.orders.styles.general.fonts.color.downcase.should include color
end

Then /^Expect Style for General Tooltip Border width is (.*)$/ do |width|
  logger.step "Expect Style for General Tooltip Border width is #{width}"
  stamps.orders.styles.general.tooltip.width.should eql "#{width}px"
end

Then /^Expect Style for General Tooltip Border style is (.*)$/ do |border_style|
  logger.step "Expect Style for General Tooltip Border width is #{width}"
  stamps.orders.styles.general.tooltip.border_style.downcase.should eql border_style
end

Then /^Expect Style for General Tooltip Border radius is (.*)$/ do |border_style|
  logger.step "Expect Style for General Tooltip Border radius is #{border_style}"
  stamps.orders.styles.general.tooltip.border_radius.downcase.should include border_style
end

Then /^Expect Style for Navigation Header Height is (.*)$/ do |height|
  logger.step "Expect Style for Navigation Header Height is #{height}"
  stamps.orders.styles.general.navigation_header.height.downcase.should eql height
end

Then /^Expect Style for Navigation Background Color is rgba (.*)$/ do |color|
  logger.step "Expect Style for Navigation Background Color is #{color}"
  stamps.orders.styles.general.navigation_header.background_color.downcase.should include color
end

Then /^Expect Style for Navigation Links Color is (.*)$/ do |color|
  logger.step "Expect Style for Navigation Links Color is #{color}"
  stamps.orders.styles.general.links.color.downcase.should include color
end



