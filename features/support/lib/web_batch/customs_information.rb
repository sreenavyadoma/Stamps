module Batch

  class UspsPrivactActStatement < BrowserObject
    def present?

    end

  end

  class RestrictionsAndProhibitions < BrowserObject

    def present?

    end

  end

  class CustomsInformation < BrowserObject

    private

    public
    def present?

    end

    def package_contents=value

    end

    def non_delivery_options=value

    end

    def internal_transaction_number=value

    end

    def more_info=value

    end

    def itn_number=value

    end

    def plus_symbol

    end

    def add_item

    end

    def item_description=value

    end

    def quantity=value

    end

    def quantity_increment value

    end

    def quantity_decrement value

    end

    def unit_price=value

    end

    def unit_price_increment value

    end

    def unit_price_decrement value

    end

    def weight_pounds=value

    end

    def weight_pounds_increment value

    end

    def weight_pounds_decrement value

    end

    def weight_ounces=value

    end

    def weight_ounces_increment value

    end

    def weight_ounces_decrement=value

    end

    def origin=value

    end

    def hs_tariff=value

    end

    def total_weight_label
      divs = @browser.divs :css => "div[class*=x-form-display-field-default]"
      div = divs[1]
      present = browser_helper.present? div
      log "Total Weight: #{browser_helper.text div}" # 0 lbs. 0 oz.
      div
    end

    def total_weight_pounds
      lbs = total_weight_label.scan(/\d+/).first
      log "Pounds: #{lbs}"
      lbs
    end

    def total_weight_ounces
      oz = total_weight_label.scan(/\d+/).last
      log "Ounces: #{oz}"
      oz
    end

    def total_value_label
      divs = @browser.divs :css => "div[class*=x-form-display-field-default]"
      div = divs.last
      log "Total Value label is #{(browser_helper.present? div)? 'present' : 'not present'}"
      div
    end

    def total_value
      test_helper.remove_dollar_sign total_value_label
    end

    def verify_i_agree_checked
      div = @browser.div :css => "div[id^=checkboxfield][style^=right]"
      attribute_value = browser_helper.attribute_value div
      checked = attribute_value.include? "checked"
      log "I agree is #{(checked)? 'checked' : 'unchecked'}"
      checked
    end

    def i_agree_checkbox
      text_fields = @browser.text_fields :css => "input[id^=checkboxfield]"
      text_field = text_fields.last
      log "I Agree Checkbox is #{(browser_helper.present? text_field)?'Present' : 'Not Present'}"
      text_field
    end

    def i_agree agree
      if agree
        #check i agree
      else
        #uncheck i agree
      end
    end

    def privacy_act_statement_link
      link = @browser.span :text => "USPS Privacy Act Statement"
      log "USPS Privacy Act Statement is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
      link
    end

    def usps_privacy_act_statement
      privacy_statement = UspsPrivactActStatement.new @browser
      5.times{
        browser_helper.safe_click privacy_act_statement_link
        return privacy_statement if privacy_statement.present?
      }
    end

    def restrictions_prohibitions_link
      link = @browser.span :text => "Restrictions and Prohibitions"
      log "Restrictions and Prohibitions is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
      link
    end

    def restrictions_and_prohibitions
      restrictions_link = RestrictionsAndProhibitions.new @browser
      5.times{
        browser_helper.safe_click restrictions_prohibitions_link
        return restrictions_link if restrictions_link.present?
      }
    end

    def close_button
      button = @browser.span :text => "Close"
      log "Close button is #{(browser_helper.present? button)?'present' : 'not present'}"
      button
    end

    def close
      3.times{
        browser_helper.safe_click close_button
        break unless browser_helper.present? close_button
      }
    end

    def x_window
      img = @browser.img :css => "img[class*=x-tool-close]"
      log "x button is #{(browser_helper.present? img)?'present' : 'not present'}"
      5.times{
        browser_helper.safe_click img
        break unless browser_helper.present? img
      }
    end

  end

end
