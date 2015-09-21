Then /^Expect Style General Fonts font-family to include (.*)$/ do |font|
  batch.styles.general.fonts.font_family.downcase.should include font
end

Then /^Expect Style General Fonts Size to be (.*)$/ do |size|
  batch.styles.general.fonts.font_size.downcase.should include size
end

Then /^Expect Style General Fonts Color to be (.*)$/ do |color|
  batch.styles.general.fonts.color.downcase.should include color
end

Then /^Expect Style General Tooltip border width to be (\d+)$/ do |width|
  batch.styles.general.tooltip.width
end

Then /^Expect Style General Tooltip border style to be (.*)$/ do |border_style|

end
