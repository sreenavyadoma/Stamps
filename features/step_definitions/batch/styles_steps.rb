Then /^Expect General Styles are correct$/ do
  # Inspect Font Family
  font_family = batch.styles.general.font_family
  font_family.downcase.should include "helvetica"
  font_family.downcase.should include "arial"
  font_family.downcase.should include "sans-serif"
  font_family.downcase.should include "s60 sans"

  # Inspect font Size
  font_size= batch.styles.general.font_size
  font_size.downcase.should include "14px"

  # Inspect Color
  color = batch.styles.general.color
  color.downcase.should include "black"

end