Then /^Expect Style General Fonts font-family to include (.*)$/ do |font|
  batch.styles.general.fonts.font_family.downcase.should include font
end

Then /^Expect Style General Fonts Size to be (.*)$/ do |size|
  batch.styles.general.fonts.font_size.downcase.should include size
end

Then /^Expect Style General Fonts Color to be (.*)$/ do |color|
  batch.styles.general.fonts.color.downcase.should include color
end

Then /^Expect Style General Tooltip Border width to be (.*)$/ do |width|
  batch.styles.general.tooltip.width.should eql "#{width}px"
end

Then /^Expect Style General Tooltip Border style to be (.*)$/ do |border_style|
  batch.styles.general.tooltip.border_style.downcase.should eql border_style
end

Then /^Expect Style General Tooltip Border radius to be (.*)$/ do |border_style|
  batch.styles.general.tooltip.border_radius.downcase.should include border_style
end

Then /^Expect Style Navigation Header Height to be (.*)$/ do |height|
  batch.styles.general.navigation_header.height.downcase.should eql height
end

Then /^Expect Style Navigation Background Color to be rgba (.*)$/ do |color|
  batch.styles.general.navigation_header.background_color.downcase.should include color
end

Then /^Expect Style Navigation Links Color to be (.*)$/ do |color|
  batch.styles.general.links.color.downcase.should include color
end



