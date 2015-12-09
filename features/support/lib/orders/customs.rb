module Orders

  class OriginCountry < OrdersObject

    def initialize(browser, index)
      super browser
      @index = index
    end

    def select country
      log.info "Select Country #{country}"

      selection_1 = Label.new ((@browser.lis :text => country)[@index+1])
      selection_2 = Label.new ((@browser.lis :text => "#{country} ")[@index+1])


      text_box_field = @browser.text_field :name => "OriginCountryCode"

      text_box = Textbox.new text_box_field
      drop_down = Button.new text_box_field.parent.parent.divs[1]

      10.times {
        begin
          drop_down.safe_click unless selection_1.present? || selection_2.present?
          if selection_1.present?
            selection_1.scroll_into_view
            selection_1.safe_click
          elsif selection_2.present?
            selection_2.scroll_into_view
            selection_2.safe_click
          end

          log.info "Selection #{text_box.text} - #{(text_box.text.include? country)?"was selected": "not selected"}"
          break if text_box.text.include? country
        rescue
          #ignore
        end
      }
      log.info "#{country} selected."
    end
  end

  class CustomsFields < OrdersObject

    def browser_edit_form_button
      links = @browser.links :css => "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
      Link.new links.first
    end

    def edit_form
      @customs_form = CustomsForm.new @browser
      edit_form_button = browser_edit_form_button
      20.times{
        edit_form_button.safe_click
        break if @customs_form.present?
      }
      raise "Customs Information Modal is not visible." unless @customs_form.present?
      @customs_form
    end

    def browser_restrictions_button
      Button.new @browser.span :text => "Restrictions..."
    end

    def restrictions
      restrictions_button = browser_restrictions_button
      view_restrictions = ViewRestrictions.new @browser
      5.times{
        restrictions_button.safe_click
        if view_restrictions.present?
          return view_restrictions
        end
      }
      nil
    end

  end

  class CustomsItemGrid < OrdersObject

    def line_item_count
      (@browser.tables :css => "div[id^=customsItemsGrid-]>div>div>table").size
    end

    def item number
      add_button = Button.new (@browser.spans :text => "Add Item").last
      log.info "Item Count: #{line_item_count}"

      20.times{
        add_button.safe_click if number > line_item_count
        log.info "Item Count: #{line_item_count}"
        break if line_item_count >= number
      }

      log.info "User Entered Number: #{number}. Actual Item Count: #{line_item_count}"

      CustomsLineItem.new(@browser).line_item number
    end
  end

  class CustomsLineItem < OrdersObject
    def line_item number
      @number = number
      self
    end

    def present?
      delete.present?
    end

    def delete
      Button.new (@browser.spans :css => "div[id*=customswindow] span[class*=sdc-icon-remove]")[@number-1]
    end

    def item_description
      Textbox.new (@browser.text_fields :css => "div[class*=customs-description] input[name=Description]")[@number-1]
    end

    def qty
      Textbox.new (@browser.text_fields :css => "div[id*=customswindow] input[name=Quantity]")[@number-1]
    end

    def qty_increment value

    end

    def qty_decrement value

    end

    def unit_price
      Textbox.new (@browser.text_fields :name => "Value")[@number-1]
    end

    def unit_price_increment value

    end

    def unit_price_decrement value

    end

    def lbs
      Textbox.new (@browser.text_fields :name => "lbs")[@number-1]
    end

    def lbs_increment value

    end

    def lbs_decrement value

    end

    def oz
      Textbox.new (@browser.text_fields :name => "oz")[@number-1]
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
      (@browser.text_fields :name => "OriginCountryCode")[@number-1]
    end

    def origin_country
      OriginCountry.new @browser, @number
    end

    def hs_tariff
      Textbox.new (@browser.text_fields :name => "TariffNo")[@number-1]
    end

  end

  class UspsPrivactActStatementModal < OrdersObject
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

  class RestrictionsAndProhibitionsModal < OrdersObject

    def present?

    end

  end

  class InternalTransaction < OrdersObject

    def text_box
      Textbox.new @browser.text_field :name => "IsITNRequired"
    end

    def select selection
      log.info "Select Internal Transaction Number: #{selection}"
      text_box = self.text_box
      drop_down = Button.new @browser.div :id => "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker"
      selection_label = Label.new @browser.li :text => selection
      10.times {
        begin
          drop_down.safe_click unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          log.info "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
          break if text_box.text.include? selection
        rescue
          #ignore
        end
      }
      log.info "#{selection} selected."
      selection_label
    end
  end

  class PackageContents < OrdersObject

    def text_box
      Textbox.new @browser.text_field :name => "CustomsContents"
    end

    def select selection
      log.info "Select Internal Transaction Number: #{selection}"
      text_box = self.text_box
      drop_down = Button.new @browser.div :id => "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
      selection_label = Label.new @browser.li :text => selection
      10.times {
        begin
          drop_down.safe_click unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          log.info "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
          break if text_box.text.include? selection
        rescue
          #ignore
        end
      }
      log.info "#{selection} selected."
      selection_label
    end
  end

  class NonDeliveryOptions < OrdersObject

    def text_box
      Textbox.new @browser.text_field :name => "NonDelivery"
    end

    def select selection
      log.info "Select Internal Transaction Number: #{selection}"
      text_box = self.text_box
      drop_down = Button.new @browser.div :id => "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
      selection_label = Label.new @browser.li :text => selection
      10.times {
        begin
          drop_down.safe_click unless selection_label.present?
          selection_label.scroll_into_view
          selection_label.safe_click
          log.info "Selection #{text_box.text} - #{(text_box.text.include? selection)?"was selected": "not selected"}"
          break if text_box.text.include? selection
        rescue
          #ignore
        end
      }
      log.info "#{selection} selected."
      selection_label
    end
  end

  class CustomsForm < OrdersObject
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
      Textbox.new @browser.text_field :name => "CustomsComments"
    end

    def itn_number
      Textbox.new @browser.text_field :name => "AES"
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
      log.info "Total Weight dev error: #{qtip_error}"
      qtip_error
    end

    def total_weight
      divs = @browser.divs :css => "div[id^=displayfield]>div[id^=displayfield]>div[id^=displayfield]"
      div = divs[divs.size-2]
      weight_label = Label.new div
      log.info "Total Weight: #{weight_label.text}"
      weight_label
    end

    def total_weight_lbs
      lbs = total_weight.text.scan(/\d+/).first
      log.info "Pounds: #{lbs}"
      lbs
    end

    def total_weight_oz
      oz = total_weight.text.scan(/\d+/).last
      log.info "Ounces: #{oz}"
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
      log.info "I agree is #{(checked)? 'checked' : 'unchecked'}"
      checked
    end

    def i_agree_checkbox
      text_fields = @browser.text_fields :css => "input[id^=checkboxfield]"
      text_field = text_fields.last
      log.info "I Agree Checkbox is #{(browser_helper.present? text_field)?'Present' : 'Not Present'}"
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
        log.info checkbox.checked?
      else
        checkbox.uncheck
        log.info checkbox.checked?
      end

    end

    def privacy_act_statement_link
      link = @browser.span :text => "USPS Privacy Act Statement"
      log.info "USPS Privacy Act Statement is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
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
      log.info "Restrictions and Prohibitions is #{(browser_helper.present? link)?'Present' : 'Not Present'}"
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
