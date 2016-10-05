Then /^Expect Style for General Fonts font-family to include (.*)$/ do |font|
  logger.step "Expect Style for General Fonts font-family to include #{font}"
  web_apps.orders.styles.general.fonts.font_family.downcase.should include font
end

Then /^Expect Style for General Fonts Size to be (.*)$/ do |size|
  logger.step "Expect Style for General Fonts Size to be #{size}"
  web_apps.orders.styles.general.fonts.font_size.downcase.should include size
end

Then /^Expect Style for General Fonts Color to be (.*)$/ do |color|
  logger.step "Expect Style for General Fonts Color to be #{color}"
  web_apps.orders.styles.general.fonts.color.downcase.should include color
end

Then /^Expect Style for General Tooltip Border width to be (.*)$/ do |width|
  logger.step "Expect Style for General Tooltip Border width to be #{width}"
  web_apps.orders.styles.general.tooltip.width.should eql "#{width}px"
end

Then /^Expect Style for General Tooltip Border style to be (.*)$/ do |border_style|
  logger.step "Expect Style for General Tooltip Border width to be #{width}"
  web_apps.orders.styles.general.tooltip.border_style.downcase.should eql border_style
end

Then /^Expect Style for General Tooltip Border radius to be (.*)$/ do |border_style|
  logger.step "Expect Style for General Tooltip Border radius to be #{border_style}"
  web_apps.orders.styles.general.tooltip.border_radius.downcase.should include border_style
end

Then /^Expect Style for Navigation Header Height to be (.*)$/ do |height|
  logger.step "Expect Style for Navigation Header Height to be #{height}"
  web_apps.orders.styles.general.navigation_header.height.downcase.should eql height
end

Then /^Expect Style for Navigation Background Color to be rgba (.*)$/ do |color|
  logger.step "Expect Style for Navigation Background Color to be #{color}"
  web_apps.orders.styles.general.navigation_header.background_color.downcase.should include color
end

Then /^Expect Style for Navigation Links Color to be (.*)$/ do |color|
  logger.step "Expect Style for Navigation Links Color to be #{color}"
  web_apps.orders.styles.general.links.color.downcase.should include color
end



