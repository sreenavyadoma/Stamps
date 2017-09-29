module Stamps
  module Orders
    module Details
      module BlurOutElement
        def blur_out(count=1)
          @service_blur_out_element = StampsElement.new(browser.label(text: 'Service:')) if @service_blur_out_element.nil? || !@service_blur_out_element.present?
          @weight_blur_out_element = StampsElement.new(browser.label(text: 'Weight:')) if @weight_blur_out_element.nil? || !@weight_blur_out_element.present?
          count.to_i.times do
            @service_blur_out_element.click
            @weight_blur_out_element.double_click
            @weight_blur_out_element.click
            @service_blur_out_element.double_click
          end
        end
      end

      class ShipToInternational < Browser::StampsModal
        include BlurOutElement
        def present?
          name.present?
        end

        def auto_suggest
          @auto_suggest = AutoSuggestInternational.new(param) if @auto_suggest.nil? || !@auto_suggest.present?
        end

        def name
          @name = StampsTextBox.new(browser.text_field(name: "ShipName")) if @name.nil? || !@name.present?
          @name
        end

        def company
          @company = StampsTextBox.new(browser.text_field(name: "ShipCompany")) if @company.nil? || !@company.present?
          @company
        end

        def address_1
          @address_1 = StampsTextBox.new(browser.text_field(name: "ShipStreet1")) if @address_1.nil? || !@address_1.present?
          @address_1
        end

        def address_2
          @address_2 = StampsTextBox.new(browser.text_field(name: "ShipStreet2")) if @address_2.nil? || !@address_2.present?
          @address_2
        end

        def email
          @email = StampsTextBox.new(browser.text_field(css: "[id*=shiptoview-international] [name=BuyerEmail]")) if @email.nil? || !@email.present?
          @email
        end

        def city
          @city = StampsTextBox.new(browser.text_field(name: "ShipCity")) if @city.nil? || !@city.present?
          @city
        end

        def phone
          @phone = StampsTextBox.new(browser.text_field(css: "[id*=shiptoview-international] [name=ShipPhone]")) if @phone.nil? || !@phone.present?
          @phone
        end

        def postal_code
          @postal_code = StampsTextBox.new(browser.text_field(name: "ShipPostalCode")) if @xxxx.nil? || !@xxxx.present?
        end

        def province
          @province = StampsTextBox.new(browser.text_field(name: "ShipState")) if @xxxx.nil? || !@xxxx.present?
        end

        def less_link
          @less_link = StampsElement.new browser.span(css: "[id*=shiptoview-international] [class*=sdc-icon-up-arrow]") if @less_link.nil? || !@less_link.present?
          @less_link
        end

        def hide_ship_to_details
          20.times do
            break unless less_link.present?
            less_link.click
            sleep(0.05)
          end
        end
      end

      class AutoSuggestInternational < Browser::StampsModal
        #todo-rob refactor auto-suggest internatinal
        attr_reader :auto_suggest_box

        def initialize(param)
          super
          @auto_suggest_box = AutoSuggestPopUp.new(param)
        end

        def set address
          text_field = self.name

          20.times{
            begin
              text_field.set address
              return auto_suggest_box if auto_suggest_box.present?
              text_field.click
              sleep(0.35)
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue
              #ignore
            end
          }
        end
      end

      class AutoSuggestPopUp < Browser::StampsModal
        def present?
          name_fields[0].present?
        end

        def size
          browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]").size
        end

        def select number
          selection = StampsElement.new(name_fields[number.to_i-1])
          selection.click
          selection.click
          selection.click
        end

        def name_fields
          browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]")
        end

        def address_fields
          browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=sub]")
        end
      end

      class AddressNotFound < Browser::StampsModal
        attr_reader :window_title

        def initialize(param)
          super
          @window_title = StampsElement.new browser.div(text: 'Exact Address Not Found')
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def row(number)
          row = number.to_i<=0?0:number.to_i-1
          checkbox_field = browser.text_field css: "input[name=addrAmbig][value='#{row}']"

          checkbox = StampsCheckBox.new checkbox_field, checkbox_field, "checked", "checked"
          checkbox.check

          accept_button = StampsElement.new browser.span text: "Accept"
          accept_button.click_while_present
        end

        def set partial_address_hash
          exact_address_not_found_field = browser.div text: 'Exact Address Not Found'
          form = SingleOrderDetails.new(param)
          form.validate_address_link
          country_dropdown = self.country
          form.ship_to.set test_helper.format_address(partial_address_hash)
          30.times {
            begin
              item_label.click
              country_dropdown.dropdown.click
              country_dropdown.dropdown.click
              item_label.click

              break if (exact_address_not_found_field.present?) || (form.validate_address_link.present?)
            rescue
              #ignore
            end
          }
          #single_order_form.hide_ship_to
          self
        end
      end

      class AmbiguousAddress < Browser::StampsModal
        attr_reader :address_not_found

        def initialize(param)
          super
          @address_not_found = AddressNotFound.new(param)
        end

        def data_error
          textarea.data_error_qtip
        end
      end

      class ShipToTextArea < StampsTextBox
        def full_address
          200.times do
            break if text.size > 5
          end
          text
        end

        def address_arr
          if @address_arr.nil?
            @address_arr = full_address.split("\n")
            expect(address_arr.size).to be > 2
          end
          @address_arr
        end

        def recipient_name
          address_arr[0].strip
        end

        def company_name
          expect(address_arr.size).to be_between(4, 5).inclusive
          address_arr[1].strip
        end

        def street_address
          if address_arr.size == 3
            address_arr[1].strip
          elsif address_arr.size == 4 || address_arr.size == 5
            address_arr[2].strip
          else
            #ignore
          end
        end

        def city
          if address_arr.size == 3
            @city_arr = address_arr[2].strip
          elsif address_arr.size == 4
            @city_arr = address_arr[3].strip
          elsif address_arr.size == 5
            @city_arr = address_arr[4].strip
          else
            #ignore
          end
          last_line_arr = @city_arr.split(",")
          expect(last_line_arr.size).to equal 2
          last_line_arr[0]
        end

        def state
          if address_arr.size == 3
            @state_arr = address_arr[2].strip
          elsif address_arr.size == 4
            @state_arr = address_arr[3].strip
          elsif address_arr.size == 5
            @state_arr = address_arr[4].strip
          else
            expect(address_arr.size).to be > 2
          end
          last_line_arr = @state_arr.split(",")
          expect(last_line_arr.size).to equal 2
          city_zip = last_line_arr[1].strip
          city_zip.split(" ").first
        end

        def zip_plus_4
          if address_arr.size == 3
            @zip_arr = address_arr[2].strip
          elsif address_arr.size == 4
            @zip_arr = address_arr[3].strip
          elsif address_arr.size == 5
            @zip_arr = address_arr[4].strip
          else
            expect(address_arr.size).to be > 2
          end
          last_line_arr = @zip_arr.split(",")
          expect(last_line_arr.size).to equal 2
          last_line_arr.last.strip.split(" ").last
        end

        def zip_code
          code = zip_plus_4.split("-")
          expect(code.size).to equal 2
          code.first
        end
      end

      module ShowShipToDetails
        def show_ship_to_details
          @show_ship_to_details_link = StampsElement.new(browser.span(css: "[id*=shipto] [class*=down]")) if @show_ship_to_details_link.nil? || !@show_ship_to_details_link.present?
          15.times do
            break unless @show_ship_to_details_link.present?
            @show_ship_to_details_link.click
            sleep(0.05)
          end
        end
      end

      class ShipToCountry < Browser::StampsModal
        include ShowShipToDetails

        def dropdown
          dd = nil
          dom_dd = browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker")
          int_dd = browser.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div>div>div>div[class*=arrow-trigger]")
          10.times do
            if dom_dd.present?
              dd = dom_dd
              break
            elsif int_dd.present?
              dd = int_dd
              break
            end
            sleep(0.35)
          end
          dd.should_not be nil
          expect(dd.present?).to be(true), "Ship-To Country drop-down is not present"
          StampsElement.new(dd)
        end

        def present?
          dropdown.present?
        end

        def textbox
          show_ship_to_details
          text_field = nil
          text_fields = browser.text_fields(name: "ShipCountryCode")
          20.times do
            text_fields.each do |element|
              sleep(0.25)
              text_field = element if element.present?
            end
            break if !text_field.nil? && text_field.present?
          end
          expect(text_field.present?).to be(true), "Ship-To Country is not present."
          StampsTextBox.new(text_field)
        end

        def selected?(country)
          textbox.text == country
        end

        def select(country)
          show_ship_to_details
          dd = dropdown
          text_field = textbox
          logger.info "Select Country #{country}"
          begin
            dd.click
            sleep(0.35)
            dd.click
            dd.click
            lis = browser.lis(text: country)
            expect(lis.size).to be_between(1, 2).inclusive

            case lis.size
              when 1
                selection = StampsElement.new(lis[0])
              when 2
                if lis[0].text.size > 0
                  selection = StampsElement.new(lis[0])
                else
                  selection = StampsElement.new(lis[1])
                end
              else
                expect(lis.size).to be_between(1, 2).inclusive
            end

            10.times do
              break if text_field.text.include?(country)
              dd.click unless selection.present?
              selection.scroll_into_view
              selection.scroll_into_view
              selection.click if selection.present?
              logger.info "Selection #{text_field.text} - #{(text_field.text.include? country)?"was selected": "not selected"}"
              break if text_field.text.include?(country)
              break if text_field.text.include?(country)
            end
            logger.info "#{country} selected."
            expect(text_field.text).to include(country)
          end unless text_field.text.include?(country)
        end
      end

      class ShipToDomestic < Browser::StampsModal
        include ShowShipToDetails, BlurOutElement

        attr_reader :ambiguous, :auto_suggest, :address_not_found

        def initialize(param)
          super
          @address_not_found = AddressNotFound.new(param)
          @ambiguous = AmbiguousAddress.new(param)
          @auto_suggest = AutoSuggestDomestic.new(param, @textarea)
        end

        def present?
          dom_textarea.present?
        end

        def less_link
          @less_link = StampsElement.new browser.span(css: "[id=shiptoview-domestic-targetEl] [class*=sdc-icon-up-arrow]") if @less_link.nil? || !@less_link.present?
          @less_link
        end

        def hide_ship_to_details
          10.times do
            break unless less_link.present?
            less_link.click
            sleep(0.05)
          end
        end

        def textarea
          show_ship_to_details
          @textarea = ShipToTextArea.new browser.textarea(name: "freeFormAddress") if @textarea.nil? || !@textarea.present?
          @textarea
        end

        def email
          show_ship_to_details
          @email = StampsTextBox.new browser.text_field(name: 'BuyerEmail') if @email.nil? || !@email.present?
          @email
        end

        def phone
          show_ship_to_details
          @phone = StampsTextBox.new browser.text_field(name: "ShipPhone") if @phone.nil? || !@phone.present?
          @phone
        end

        def set(address)
          10.times do
            begin
              textarea.set(address)
              15.times do
                blur_out(3)
                textarea.click
                break if less_link.present?
              end
              break if less_link.present?
            rescue Exception => e
              logger.error e.message
              logger.error e.backtrace.join("\n")
              expect("Unable to Ship-To address to #{address}. Error: #{e.message}").to eql "Set Ship-To Address Failed"
            end
          end
          expect(less_link.present?).to be(true), "Less link did not appear on Single Order Details form. Unable to save Ship-To data."
          expect(textarea.text).to include address.split(" ").last
        end

        def set_ambiguous(address)
          10.times do
            textarea.set address
            blur_out
            address_not_found.wait_until_present 4
            return address_not_found if address_not_found.present?
          end
          expect("Exact Address Not Found module did not appear.").to eql ""
        end
      end

      class AutoSuggestDomestic < Browser::StampsModal
        attr_reader :textarea, :auto_suggest_box
        def initialize(param, textarea)
          super(param)
          @textarea = textarea
          @auto_suggest_box = AutoSuggestPopUp.new(param)
        end

        def set(address)
          20.times{
            begin
              textarea.set address
              return auto_suggest_box if auto_suggest_box.present?
              textarea.click
              sleep(0.35)
              return auto_suggest_box if auto_suggest_box.present?
              ship_to_area1.double_click
              return auto_suggest_box if auto_suggest_box.present?
            rescue Exception => e
              logger.error e.message
              logger.error e.backtrace.join("\n")
            end
          }
        end
      end

      class ShipTo < Browser::StampsModal
        attr_reader :country, :international, :domestic
        def initialize(param)
          super
          @country = ShipToCountry.new(param)
          @domestic = ShipToDomestic.new(param)
          @international = ShipToInternational.new(param)
        end
      end

      class ViewRestrictions < Browser::StampsModal
        def browser_ok_button
          StampsElement.new( browser.span(text: "OK"))
        end

        def present?
          browser_ok_button.present?
        end

        def ok
          browser_ok_button.click
        end
      end

      class InsuranceTermsConditions < Browser::StampsModal
        def present?
          begin
            (browser.divs(text: "Stamps.com Insurance Terms and Conditions").first).present? || browser.spans(text: "I Agree").last.present?
          rescue
            false
          end
        end

        #todo-rob Updates to Insurance Terms and Conditions
        def agree
          10.times do
            begin
              browser.spans(text: "I Agree").each do |button|
                StampsElement.new(button).click
              end
            rescue
              #ignore
            end
          end
        end

        def cancel
          10.times do
            begin
              browser.spans(text: "Cancel").each do |button|
                StampsElement.new(button).click
              end
            rescue
              #ignore
            end
          end
        end
      end

      class DetailsInsureFor < Browser::StampsModal
        include BlurOutElement

        attr_reader :checkbox, :textbox, :increment_trigger, :decrement_trigger, :terms

        def initialize(param)
          super
          @textbox = StampsTextBox.new browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>input[name=InsuredValue]")
          @decrement_trigger = StampsElement.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger = StampsElement.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")

          field = browser.input(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=checkbox-]:nth-child(2)>div>div>input")
          verify = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=checkbox-]:nth-child(2)")
          @checkbox = StampsCheckBox.new(field, verify, "class", "checked")
          @terms = InsuranceTermsConditions.new(param)
        end

        def checked?
          checkbox.checked?
        end

        def check
          checkbox.check
        end

        def uncheck
          checkbox.uncheck
        end

        def text
          textbox.text
        end

        def value
          text.to_f if checked?
          0
        end

        def set(value)
          10.times do
            check
            textbox.set(value)
            sleep(0.025)
            2.times {blur_out}
            return true if text.to_f == value.to_f
          end
          expect(text.to_f).to eql(value.to_f)
        end

        def set_and_agree_to_terms(value)
          set(value)
          3.times do
            2.times {blur_out}
            terms.agree if terms.present?
          end
        end

        def increment(value)
          value.to_i.times do
            increment_trigger.click
          end
        end

        def decrement(value)
          value.to_i.times do
            decrement_trigger.click
          end
        end

        def cost_label
          labels = browser.label(text: "Insure For $:").parent.parent.parent.parent.labels
          cost_element = nil
          labels.each do |label|
            cost_element = label if label.text.include?('.')
          end
          cost_element
        end

        def cost
          test_helper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end
      end

      class DetailsTracking < Browser::StampsModal
        attr_reader :textbox, :dropdown, :cost_label
        def initialize(param)
          super
          @textbox = StampsTextBox.new browser.text_field(name: 'Tracking')
          @dropdown = StampsElement.new browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
          @cost_label = StampsElement.new(browser.label(css: "label[class*='selected_tracking_cost']"))
        end

        def present?
          textbox.present?
        end

        def tracking_selection(selection)
          if selection.downcase.include? "usps"
            browser.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td")
          elsif selection.downcase.include? "signature"
            browser.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td")
          elsif selection.downcase.include? "none"
            browser.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td")
          else
            expect("#{selection} is not a valid selection").to eql "Valid selections are USPS Tracking and Signature Required"
          end
        end

        # todo-rob Details Tracking selection fix
        def select(str)
          expect(dropdown.present?).to be(true)
          20.times do
            selection = StampsElement.new(tracking_selection(str).first)
            dropdown.click unless selection.present?
            selection.click
            break if textbox.text.include?(str)
          end
          expect(textbox.text).to include(str)
        end

        def inline_cost(selection)
          tds = tracking_selection(selection)
          expect(tds.size).to equal 2
          label = StampsElement.new(tds.last)
          5.times do
            begin
              dropdown.click unless label.present?
              return label.text if label.present?
              dropdown.click
              label = tracking_selection(selection).last
              dropdown.click unless label.present?
              return label.text if label.present?
            rescue
              #ignore
            end
            expect("Unable to fetch inline cost for #{selection}").to eql "Details - Tracking inline cost"
          end
        end

        def cost
          test_helper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def tooltip(selection)
          selection_label = browser.td(text: selection)
          5.times {
            begin
              dropdown.click unless selection_label.present?
              if selection_label.present?
                qtip = selection_label.parent.parent.parent.parent.attribute_value("data-qtip")
                logger.info "#{qtip}"
                return qtip
              end
            rescue
              #ignore
            end
          }
        end
      end

      class DetailsStoreItem < Browser::StampsModal
      end

      class OrderDetailsDimensions < Browser::StampsModal
        attr_reader :length, :width, :height
        def initialize(param)
          super
          textbox = browser.text_field(css: "input[class^=sdc-mainpanel-lengthnumberfield]")
          inc_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=down]")
          @length = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)

          textbox = browser.text_field(css: "input[class^=sdc-mainpanel-widthnumberfield]")
          inc_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=down]")
          @width = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)

          textbox = browser.text_field(css: "input[class^=sdc-mainpanel-heightnumberfield]")
          inc_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=down]")
          @height = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)
        end

        def present?
          length.present? && width.present? && height.present?
        end
      end

      class AssociatedOrderItem < Browser::StampsModal
        attr_reader :index, :item_qty, :item_id, :item_description, :delete
        def initialize(param, number)
          super(param)
          @index = number

          textbox = browser.text_fields(name: "Quantity")[@index-1]
          inc_btn = browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index-1]
          dec_btn = browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index-1]
          @item_qty = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)

          @item_id = StampsTextBox.new((browser.text_fields(name: "SKU")[index-1]))
          @delete = StampsElement.new(browser.spans(css: "span[class*=sdc-icon-remove]")[index-1])
          @item_description = StampsTextBox.new(browser.text_fields(name: "Description")[index-1])
        end

        def present?
          ((browser.text_fields name: "SKU")[@index-1]).present?
        end

        def scroll_into_view
          item_description.scroll_into_view
        end
      end

      class ItemsOrderedSection < Browser::StampsModal
        attr_reader :add_btn, :dropdown

        def initialize(param)
          super
          @add_btn = StampsElement.new(browser.span(css: "span[class*=sdc-icon-add]"))
          @dropdown = StampsElement.new(browser.img(css: "div[id^=associatedorderitems-][id$=_header-targetEl]>div>img"))
        end
      
        def expand
          5.times do
            dropdown.click
            break if dropdown.element.attribute_value('class').include?('collapse-top')
          end
        end

        def collapse
          5.times do
            dropdown.click
            break if dropdown.element.attribute_value('class').include?('expand-bottom')
          end
        end

        def size
          browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]").size
        end

        def count
          size
        end

        def item(number)
          associated_item = AssociatedOrderItem.new(param, number)
          10.times do
            associated_item.scroll_into_view
            return associated_item if associated_item.present?
            sleep(0.5)
            add_btn.click if number > size
            logger.info "Item Count: #{size}"
          end
          associated_item
        end
      end

      class DetailsCollapsible < Browser::StampsModal
        attr_reader :field
        def initialize(param)
          super
          @field = StampsElement.new(browser.img(class: "x-tool-img x-tool-expand-left"))
        end

        def present?
          field.present?
        end

        def open
          5.times do
            field.click
            break unless field.present?
          end
        end
      end

      class ToolbarMenu < Browser::StampsModal
        attr_reader :dropdown
        def initialize(param)
          super
          @dropdown = StampsElement.new(browser.spans(css: "span[class*='sdc-icon-more']").first)
        end

        def collapse
          selection = StampsElement.new browser.span(text: "Collapse Panel")
          dd = dropdown
          collapsed_details = DetailsCollapsible.new(param)
          10.times do
            dd.click unless selection.present?
            selection.click
            break if collapsed_details.present?
          end
        end

        def tooltip
          tooltip_element = StampsElement.new(browser.div id: 'ext-quicktips-tip-innerCt')
          dropdown.element.hover
          dropdown.element.hover
          15.times do
            dropdown.element.hover
            sleep(0.35)
            if tooltip_element.present?
              logger.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      class DetailsToolbar < Browser::StampsModal
        attr_reader :menu

        def initialize(param)
          super
          @menu = ToolbarMenu.new(param)
        end

        def order_id
          20.times{
            begin
              order_id_label = StampsElement.new(browser.b(css: "div[id^=singleOrderDetailsForm][class*=singleorder-detailsform]>div[id^=toolbar]>div[id^=toolbar]>div[id^=toolbar]>label>b"))
              sleep(0.25)
              return order_id_label.text.split('#').last if order_id_label.text.include? '#'
            rescue
              #ignroe
            end
          }
          ""
        end
      end

      class DetailsFooter < Browser::StampsModal
        attr_reader :label
        def initialize(param)
          super
          @label = StampsElement.new browser.strong(text: 'Total Ship Cost:')
        end

        def total_ship_cost
          cost_label = StampsElement.new browser.label(css: "div[id^=singleOrderDetailsForm]>div>div>div>label[class*=total_cost]")
          10.times do
            begin
              cost = cost_label.text
              logger.info "Single Order Details Total Cost is #{cost}"
              break if cost.include? "$"
            rescue
              #ignore
            end
          end
          test_helper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def multiple_order_cost
          cost_label = StampsElement.new(browser.labels(css: "label[class*=total_cost]")[1])
          10.times do
            begin
              cost = cost_label.text
              logger.info "Cost is #{cost}"
            rescue
              #ignore
            end
            break unless cost.include? "$"
          end
          test_helper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end
      end

      class OrdersCustomsFields < Browser::StampsModal
        attr_reader :customs_form, :view_restrictions, :browser_restrictions_button, :edit_form_btn, :restrictions_btn

        def initialize(param)
          super
          @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
          @view_restrictions = Orders::Details::ViewRestrictions.new(param)
          @edit_form_btn = StampsElement.new browser.span text: 'Edit Form...'
          @restrictions_btn = StampsElement.new browser.span text: 'Restrictions...'
        end

        def edit_form
          10.times do
            return customs_form if customs_form.present?
            edit_form_btn.scroll_into_view
            edit_form_btn.click
            customs_form.wait_until_present(2)
          end
          expect(customs_form.present?).to be(true)
        end

        def restrictions
          5.times do
            return view_restrictions if view_restrictions.present?
            restrictions_btn.click
          end
          expect(view_restrictions.present?).to be(true)
        end
      end

      class SingleOrderDetails < Browser::StampsModal
        include BlurOutElement
        attr_reader :toolbar, :ship_from, :ship_to, :weight, :body, :insure_for, :service, :tracking, :dimensions,
                    :footer, :customs, :items_ordered, :reference_no, :collapsed_details

        def initialize(param)
          super
          @toolbar = DetailsToolbar.new(param)
          @ship_from = Stamps::Orders::OrderDetailsCommon::ShipFromAddress.new(param, :single_order)
          @ship_to = ShipTo.new(param)
          @weight = Stamps::Orders::OrderDetailsCommon::OrderDetailsWeight.new(param, :single_order)
          @service = Stamps::Orders::OrderDetailsCommon::OrdersService.new(param, :single_order).extend(Stamps::Orders::OrderDetailsCommon::ServiceCost)
          @insure_for = DetailsInsureFor.new(param)
          @tracking = DetailsTracking.new(param)
          @reference_no = StampsTextBox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(10)>div>div>div>div>div>div>input"))
          @dimensions = OrderDetailsDimensions.new(param)
          @items_ordered = ItemsOrderedSection.new(param)
          @customs = OrdersCustomsFields.new(param)
          @body = StampsElement.new(browser.div(css: "div[id^=singleOrderDetailsForm][id$=body]"))
          @collapsed_details = DetailsCollapsible.new(param)
          @footer = DetailsFooter.new(param)
        end

        def present?
          body.present?
        end

        def wait_until_present(*args)
          body.wait_until_present(*args)
        end

        def expand
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        end
      end
    end
  end
end