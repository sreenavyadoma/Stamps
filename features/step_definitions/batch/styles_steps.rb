Then /^Right-click on page and inspect element$/ do
  font_family = batch.styles.general.font_family
  font_family.downcase.should include "helvetica"
  font_family.downcase.should include "arial"
  font_family.downcase.should include "sans-serif"
  font_family.downcase.should include "s60 sans"
  font_size= batch.styles.general.font_size
  font_size.downcase.should include "14px"

end