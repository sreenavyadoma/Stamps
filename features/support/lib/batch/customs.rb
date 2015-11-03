module Batch

  class OriginCountry < BatchObject
    def select country
      log "Select Country #{country}"

      text_box_field = @browser.text_field :name => "OriginCountry"
      drop_down =text_box_field.parent.parent.divs[1]

      box = Textbox.new text_box_field
      dd_button = Button.new drop_down
      dd_button.safe_click

      if country == "United States"
        selection_country = country
      else
        selection_country = "#{country} "
      end

      10.times {
        begin
          selection_field = (@browser.lis(:text => selection_country)).last
          log browser_helper.present? selection_field
          if browser_helper.present? selection_field
            browser_helper.safe_click selection_field
            sleep 1
            selected_country_text = box.text
            log "Selected Country  #{selected_country_text} - #{(selected_country_text.include? country)?"#{country} selected": "#{country} not selected"}"
            break if selected_country_text.include? country
          else
            dd_button.safe_click
          end
        rescue
          #ignore
        end
      }
      log "Ship-To country now set to #{country}"
    end
  end

  class CustomsItemGrid < BatchObject

    def item_count
      size = (@browser.tables :css => "div[id^=customsItemsGrid-]>div>div>table").size
      log "Customs Item Count:  #{size}"
      size
    end

    def add_item
      Button.new (@browser.spans :text => "Add Item").last
    end

    def item number
      add_button = add_item
      log "Item Count: #{item_count}"

      20.times{
        add_button.safe_click
        log "Item Count: #{item_count}"
        break if item_count >= number
      }

      log "User Entered Number: #{number}. Actual Item Count: #{item_count}"

      CustomsLineItem.new(@browser).line_item number
    end
  end

  class CustomsLineItem < BatchObject
    def line_item number
      @number = number
      self
    end

    def present?
      delete.present?
    end

    def delete
      Button.new (@browser.spans :css => "span[class*=sdc-icon-remove]")[@number]
    end

    def item_description
      Textbox.new (@browser.text_fields :name => "CustomsItemName")[@number-1]
    end

    def qty
      Textbox.new (@browser.text_fields :name => "CustomsItemQuantity")[@number-1]
    end

    def qty_increment value

    end

    def qty_decrement value

    end

    def unit_price
      Textbox.new (@browser.text_fields :name => "CustomsItemPrice")[@number-1]
    end

    def unit_price_increment value

    end

    def unit_price_decrement value

    end

    def lbs
      Textbox.new (@browser.text_fields :name => "CustomsItemWeightLb")[@number-1]
    end

    def lbs_increment value

    end

    def lbs_decrement value

    end

    def oz
      Textbox.new (@browser.text_fields :name => "CustomsItemWeightOz")[@number-1]
    end

    def oz_increment value

    end

    def oz_decrement value

    end
=begin

    def origin_country
      Textbox.new origin_country_input
    end
=end

    def origin_country_input
      (@browser.text_fields :name => "OriginCountry")[@number-1]
    end

    def origin_country
      OriginCountry.new @browser
    end

    def hs_tariff
      Textbox.new (@browser.text_fields :name => "HSTariff")[@number-1]
    end

  end

  class UspsPrivactActStatementModal < BatchObject
    def window_title
      Label.new @browser.div :text => "USPS Privacy Act Statement"
    end

    def present?
      window_title.present?
    end

    def okay
      @browser.span :text => "OK"
    end

  end

  class RestrictionsAndProhibitionsModal < BatchObject

    def present?

    end

  end

  class InternalTransaction < BatchObject

    def text_box
      Textbox.new @browser.text_field :name => "isITNRequired"
    end

    def select selection
      log "Select Internal Transaction Number: #{selection}"
      text_box = self.text_box
      drop_down = Button.new @browser.div :id => "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker"
      selection_label = Label.new @browser.li :text => selection
      10.times {
        begin
          drop_down.safe_click unless selection_label.present?
          selection_label.safe_click
          log "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
          break if text_box.text.include? selection
        rescue
          #ignore
        end
      }
      log "#{selection} selected."
      selection_label
    end
  end

  class PackageContents < BatchObject

    def text_box
      Textbox.new @browser.text_field :name => "ContentType"
    end

    def select selection
      log "Select Internal Transaction Number: #{selection}"
      text_box = self.text_box
      drop_down = Button.new @browser.div :id => "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
      selection_label = Label.new @browser.li :text => selection
      10.times {
        begin
          drop_down.safe_click unless selection_label.present?
          selection_label.safe_click
          log "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
          break if text_box.text.include? selection
        rescue
          #ignore
        end
      }
      log "#{selection} selected."
      selection_label
    end
  end

  class NonDeliveryOptions < BatchObject

    def text_box
      Textbox.new @browser.text_field :name => "NonDeliveryOption"
    end

    def select selection
      log "Select Internal Transaction Number: #{selection}"
      text_box = self.text_box
      drop_down = Button.new @browser.div :id => "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
      selection_label = Label.new @browser.li :text => selection
      10.times {
        begin
          drop_down.safe_click unless selection_label.present?
          selection_label.safe_click
          log "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
          break if text_box.text.include? selection
        rescue
          #ignore
        end
      }
      log "#{selection} selected."
      selection_label
    end
  end

  class CustomsForm < BatchObject
    public

    def present?
      Button.new @browser.image :css => "img[class*='x-tool-close']"
    end

    def package_contents
      PackageContents.new @browser
    end

    def non_delivery_options
      NonDeliveryOptions.new @browser
    end


    def internal_transaction
      InternalTransaction.new @browser
    end

    def more_info
      Textbox.new @browser.text_field :name => "Comments"
    end

    def itn_number
      div = (@browser.divs :css => "div[id^=textfield][class*=x-hbox-form-item]").last
      text_field = @browser.text_field :css => "input[name=ITN][maxlength='50']"
      Textbox.new text_field, div
    end

    def license
      Textbox.new @browser.text_field :css => "input[name=LicenseNumber]"
    end

    def certificate
      Textbox.new @browser.text_field :css => "input[name=CertificateNumber]"
    end

    def invoice
      Textbox.new @browser.text_field :css => "input[name=InvoiceNumber]"
    end

    def item_grid
      sleep 2
      CustomsItemGrid.new @browser
    end

    def plus

    end

    def total_weight_error
      qtip_error = total_weight.attribute_value "data-errorqtip"
      log "Total Weight dev error: #{qtip_error}"
      qtip_error
    end

    def total_weight
      divs = @browser.divs :css => "div[id^=displayfield]>div[id^=displayfield]>div[id^=displayfield]"
      div = divs[divs.size-2]
      weight_label = Label.new div
      log "Total Weight: #{weight_label.text}" # 0 lbs. 0 oz.
      weight_label
    end

    def total_weight_lbs
      lbs = total_weight.text.scan(/\d+/).first
      log "Pounds: #{lbs}"
      lbs
    end

    def total_weight_oz
      oz = total_weight.text.scan(/\d+/).last
      log "Ounces: #{oz}"
      oz
    end

    def total_value
      divs = @browser.divs :css => "div[class*=x-form-display-field-default]"
      div = divs.last
      test_helper.remove_dollar_sign (Label.new div).text
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

    def i_agree user_agreed

      checkbox_fields = @browser.inputs :css => "input[id^=checkbox-][id$=-inputEl]"
      checkbox_field = checkbox_fields.last

      verify_fields = @browser.inputs :css => "div[id^=checkbox][class*=x-form-type-checkbox]"
      verify_field = verify_fields.last
      checkbox = Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"

      if user_agreed
        checkbox.check
        log checkbox.checked?
      else
        checkbox.uncheck
        log checkbox.checked?
      end

    end

    def privacy_act_statement_link
      link = @browser.span :text => "USPS Privacy Act Statement"
      log "USPS Privacy Act Statement is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
      link
    end

    def usps_privacy_act_statement
      privacy_statement = UspsPrivactActStatementModal.new @browser
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
      restrictions_link = RestrictionsAndProhibitionsModal.new @browser
      5.times{
        browser_helper.safe_click restrictions_prohibitions_link
        return restrictions_link if restrictions_link.present?
      }
    end

    def close
      (Button.new @browser.span :text => "Close").click_while_present
    end

    def cancel
      (Button.new @browser.img :css => "img[class$=x-tool-close]").click_while_present
    end
  end

end
