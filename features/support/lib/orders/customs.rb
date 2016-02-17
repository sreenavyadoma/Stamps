module Orders

  class OriginCountry < OrdersObject

    def initialize(browser, index)
      super browser
      @index = index
    end

    def select country
      log.info "Select Country #{country}"
      selection = Label.new (@browser.lis :text => country)[@index]
      text_box_field = (@browser.text_fields :name => "OriginCountryCode")[@index-1]
      text_box = Textbox.new text_box_field
      drop_down = StampsButton.new text_box_field.parent.parent.divs[1]

      10.times {
        begin
          drop_down.safe_click unless selection.present?
          selection.scroll_into_view
          selection.safe_click
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
      StampsButton.new @browser.span :text => "Restrictions..."
    end

    def restrictions
      restrictions_button = browser_restrictions_button
      view_restrictions = Orders::Details::ViewRestrictions.new @browser
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

    def size
      (@browser.tables :css => "div[id^=associatedcustomsitems]>div[id^=singlecustomsitem]").size
    end

    def item number
      add_button = StampsButton.new (@browser.spans :text => "Add Item").last
      log.info "Item Count: #{size}"

      20.times{
        break if size >= number
        sleep 1
        break if size >= number
        add_button.safe_click if number > size
        log.info "Item Count: #{size}"
      }

      log.info "User Entered Number: #{number}. Actual Item Count: #{size}"

      CustomsLineItem.new @browser, number
    end
  end

  class CustomsLineItem < OrdersObject

    class Qty < OrdersObject
      def initialize browser, number
        super browser
        @number = number
      end

      def text_box
        Textbox.new ((@browser.text_fields :css => "div[id*=customswindow] input[name=Quantity]")[@number-1]), "data-errorqtip"
      end

      def set value
        text_field = text_box
        value = value.to_i
        max = value + text_field.text.to_i
        max.times do
          current_value = text_field.text.to_i
          break if value == current_value
          if value > current_value
            increment 1
          else
            decrement 1
          end
          break if value == current_value
        end
        sleep 1
        log.info "Qty set to #{text_field.text}"
      end

      def increment value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(2)>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class UnitPrice < OrdersObject
      def initialize browser, number
        super browser
        @number = number
      end

      def text_box
        Textbox.new ((@browser.text_fields :name => "Value")[@number-1]), "data-errorqtip"
      end

      def set value
        text_box.set value
        log.info "Ounces set to #{text_box.text}"
      end

      def increment value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(3)>div>div>div>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class UnitWeightLbs < OrdersObject
      def initialize browser, number
        super browser
        @number = number
      end

      def text_box
        Textbox.new ((@browser.text_fields :name => "lbs")[@number-1]), "data-errorqtip"
      end

      def set value
        text_field = text_box
        value = value.to_i
        max = value + text_field.text.to_i
        max.times do
          current_value = text_field.text.to_i
          break if value == current_value
          if value > current_value
            increment 1
          else
            decrement 1
          end
          break if value == current_value
        end
        sleep 1
        log.info "Pounds set to #{text_field.text}"
      end

      def increment value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(1)>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end
    end

    class UnitWeightOz < OrdersObject
      def initialize browser, number
        super browser
        @number = number
      end

      def text_box
        Textbox.new ((@browser.text_fields :name => "oz")[@number-1]), "data-errorqtip"
      end

      def set value
        text_field = text_box
        value = value.to_i
        max = value + text_field.text.to_i
        max.times do
          current_value = text_field.text.to_i
          break if value == current_value
          if value > current_value
            increment 1
          else
            decrement 1
          end
          break if value == current_value
        end
        sleep 1
        log.info "Ounces set to #{text_field.text}"
      end

      def increment value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=up]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end

      def decrement value
        button = StampsButton.new (@browser.divs :css => "div[id^=singlecustomsitem][id$=targetEl]>div:nth-child(4)>div>div>div:nth-child(3)>div>div>div[id$=spinner]>div[class*=down]")[@number-1]
        value.to_i.times do
          button.safe_click
        end
      end
    end

    def initialize browser, number
      super browser
      @number = number
    end

    def present?
      delete.present?
    end

    def delete
      StampsButton.new (@browser.spans :css => "div[id*=customswindow] span[class*=sdc-icon-remove]")[@number-1]
    end

    def description
      Textbox.new ((@browser.text_fields :css => "div[class*=customs-description] input[name=Description]")[@number-1]), "data-errorqtip"
    end

    def qty
      Qty.new @browser, @number
    end

    def unit_price
      UnitPrice.new @browser, @number
    end

    def lbs
      UnitWeightLbs.new @browser, @number
    end

    def oz
      UnitWeightOz.new @browser, @number
    end

    def origin
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
      drop_down = StampsButton.new @browser.div :id => "sdc-customsFormWindow-internaltransactiondroplist-trigger-picker"
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
      drop_down = StampsButton.new @browser.div :id => "sdc-customsFormWindow-packagecontentsdroplist-trigger-picker"
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
      drop_down = StampsButton.new @browser.div :id => "sdc-customsFormWindow-nondeliveryoptionsdroplist-trigger-picker"
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

    def usps_privacy_act_warning
      Label.new (@browser.label :text => "You must agree to the USPS Privacy Act Statement")
    end

    def present?
      StampsButton.new @browser.image :css => "img[class*='x-tool-close']"
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
      Textbox.new @browser.text_field :name => "CustomsLicenseNumber"
    end

    def certificate
      Textbox.new @browser.text_field :name => "CustomsCertificateNumber"
    end

    def invoice
      Textbox.new @browser.text_field :name => "CustomsInvoiceNumber"
    end

    def item_grid
      sleep 1
      CustomsItemGrid.new @browser
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
      test_helper.remove_dollar_sign (Label.new (@browser.divs :css => "div[class*=x-form-display-field-default]").last).text
    end

    def i_agree
      checkbox_fields = @browser.inputs :css => "input[id^=checkbox-]"
      checkbox_field = checkbox_fields.last
      verify_fields = @browser.inputs :css => "div[id^=checkbox][class*=x-form-type-checkbox]"
      verify_field = verify_fields.last

      Stamps::Browser::Checkbox.new checkbox_field, verify_field, "class", "checked"
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
      (StampsButton.new @browser.span :text => "Close").click_while_present
    end

    def cancel
      (StampsButton.new @browser.img :css => "img[class$=x-tool-close]").click_while_present
    end
  end

end
#todo-rob refactor into Customs module