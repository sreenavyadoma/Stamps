module Stamps
  class BrowserHelper
    include Singleton

    def set_text(field, text, field_name)
      10.times do
        field.focus
        field.set log_browser_set(field, text, field_name)
        field.focus
        break if field.attribute_value('value').include? text
      end
    end

    def text(field, field_name)
      begin
        field.focus
      rescue
        #ignore
      end
      field_text = field.text
      field_attribute_value = field.attribute_value('value')
       if field_text.size > 0
         text = field_text
       elsif  field_attribute_value.size > 0
         text = field_attribute_value
       else
         text = ""
       end
      log_browser_get(field, text, field_name)
      text
    end

    def click(field, field_name)
      field.focus
      field.click
      log_browser_click field, field_name
    end

    def field_present?(field)
      begin
        field.present?
      rescue
        return false
      end
    end
  end
end

# todo refactor into PageHelper