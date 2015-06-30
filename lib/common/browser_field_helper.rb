module Stamps
  class BrowserFieldHelper
    include Singleton
    include DataMagic

    def set_text(field, text, field_name)
      10.times do
        field.focus
        field.set log_browser_set(field, text, field_name)
        field.focus
        break if field.attribute_value('value').include? text
      end
    end

    def text(field, field_name)
      field.focus
      text = field.text #field.attribute_value('value')
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