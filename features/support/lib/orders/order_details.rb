module Stamps
  module Orders
    module SingleOrder
      ##
      # Single Order Details for Insurance Terms and Conditions
      class InsuranceTermsConditions < WebApps::Base #todo-Rob move to Stamps::Common
        def present?
          begin
            (driver.divs(text: "Stamps.com Insurance Terms and Conditions").first).present? || driver.spans(text: "I Agree").last.present?
          rescue
            false
          end
        end

        #todo-rob Updates to Insurance Terms and Conditions
        def agree
          10.times do
            begin
              driver.spans(text: "I Agree").each do |button|
                StampsField.new(button).click
              end
            rescue
              # ignore
            end
          end
        end

        def cancel
          10.times do
            begin
              driver.spans(text: "Cancel").each do |button|
                StampsField.new(button).click
              end
            rescue
              # ignore
            end
          end
        end
      end

      ##
      # Single Order Details Form fields
      module Fields
        module BlurOutField
          # @param [count] count
          def blur_out(count = 1)
            @service_blur_out_field = StampsField.new(driver.label(text: 'Service:')) if @service_blur_out_field.nil? || !@service_blur_out_field.present?
            @weight_blur_out_field = StampsField.new(driver.label(text: 'Weight:')) if @weight_blur_out_field.nil? || !@weight_blur_out_field.present?
            (count.nil? ? 1 : count.to_i).times do
              @service_blur_out_field.click
              @weight_blur_out_field.double_click
              @weight_blur_out_field.click
              @service_blur_out_field.double_click
            end
          end
        end

        #todo-rob refactor auto-suggest internatinal
        class AutoSuggestInternational < WebApps::Base


          def auto_suggest_box
            cache[:auto_suggest_box].nil? ? cache[:auto_suggest_box] = AutoSuggestPopUp.new(param) : cache[:auto_suggest_box]
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
                # ignore
              end
            }
          end
        end

        class AutoSuggestPopUp < WebApps::Base


          def present?
            name_fields[0].present?
          end

          def size
            driver.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]").size
          end

          def select number
            selection = StampsField.new(name_fields[number.to_i - 1])
            selection.click
            selection.click
            selection.click
          end

          def name_fields
            driver.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]")
          end

          def address_fields
            driver.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=sub]")
          end
        end

        class AddressNotFound < WebApps::Base


          def window_title
            if cache[:window_title].nil? || !cache[:window_title].present?
                cache[:window_title] = StampsField.new(driver.div(text: 'Exact Address Not Found'))
            end
            cache[:window_title]
          end

          def present?
            window_title.present?
          end

          def wait_until_present(*args)
            window_title.wait_until_present(*args)
          end

          def row(number)
            row = number.to_i <= 0 ? 0 : number.to_i - 1
            checkbox_field = driver.text_field css: "input[name=addrAmbig][value='#{row}']"

            checkbox = StampsCheckbox.new checkbox_field, checkbox_field, 'checked', 'checked'
            checkbox.check

            accept_button = StampsField.new driver.span text: "Accept"
            accept_button.click_while_present
          end

          def set partial_address_hash
            exact_address_not_found_field = driver.div text: 'Exact Address Not Found'
            form = OrderDetails.new(param) #todo-Rob this is wrong, change it.
            form.validate_address_link
            country_drop_down = self.country
            form.ship_to.set TestHelper.format_address(partial_address_hash)
            30.times {
              begin
                item_label.click
                country_drop_down.drop_down.click
                country_drop_down.drop_down.click
                item_label.click

                break if (exact_address_not_found_field.present?) || (form.validate_address_link.present?)
              rescue
                # ignore
              end
            }
            #single_order_form.hide_ship_to
            self
          end
        end

        class AmbiguousAddress < WebApps::Base


          def address_not_found
            cache[:address_not_found].nil? ? cache[:address_not_found] =  AddressNotFound.new(param) : cache[:address_not_found]
          end

          def data_error
            textarea.data_error_qtip
          end
        end

        class ShipToTextArea < StampsTextbox
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
              # ignore
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
              # ignore
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
          def ship_to_details_link
            if cache[:ship_to_details_link].nil? || !cache[:ship_to_details_link].present?
              cache[:ship_to_details_link] = StampsField.new(driver.span(css: "[id*=shipto] [class*=down]"))
            end
            cache[:ship_to_details_link]
          end

          def show_ship_to_details
            20.times do
              break unless ship_to_details_link.present?
              ship_to_details_link.click
              sleep(0.05)
            end
          end
        end

        class ShipToCountry < WebApps::Base

          include ShowShipToDetails
          attr_reader :textbox_field, :drop_down_field
          def initialize(param, textbox_field, drop_down_field)
            super(param)
            @textbox_field = textbox_field
            @drop_down_field = drop_down_field
          end



          def drop_down
            if cache[:drop_down].nil? || !cache[:drop_down].present?
              cache[:drop_down] = StampsField.new(drop_down_field)
            end
            cache[:drop_down]
          end

          def textbox
            if cache[:textbox].nil? || !cache[:textbox].present?
              cache[:textbox] = StampsTextbox.new(textbox_field)
            end
            cache[:textbox]
          end

          def present?
            drop_down.present?
          end

          def selection(str)
            lov = driver.lis(text: str)
            if lov.size == 1 # return first one
              return lov[0]
            elsif lov.size == 2
              10.times do
                drop_down.scroll_into_view.click unless lov[0].present? && lov[1].present?
                return lov[0] if lov[0].present?
                return lov[1] if lov[1].present?
              end
            end

            raise ArgumentError, "Unable to create selection field for #{str}. Maximum of 2 floating country list of values expected."
          end

          def select(str)
            show_ship_to_details
            drop_down.scroll_into_view.click
            5.times do
              begin
                field = StampsField.new(selection(str))
                drop_down.scroll_into_view.click unless field.present?
                field.scroll_into_view.click
                break if textbox.text.include?(str)
              rescue
                # ignore
              end
            end
            textbox.text
          end
        end

        class ShipToInternational < WebApps::Base

          include BlurOutField
          def present?
            name.present?
          end

          def country
            if cache[:country].nil?
              cache[:country] = ShipToCountry.new(
                  param,
                  driver.text_field(css: "[id*=international] [name=ShipCountryCode]"),
                  driver.div(css: "[id*=international] [id^=combo][id$=trigger-picker]"))
            end
            cache[:country]
          end

          def auto_suggest
            cache[:auto_suggest] = AutoSuggestInternational.new(param) if cache[:auto_suggest].nil?
            cache[:auto_suggest]
          end

          def name
            cache[:name] = StampsTextbox.new(driver.text_field(name: "ShipName"))  if cache[:name].nil? || !cache[:name].present?
            cache[:name]
          end

          def company
            cache[:company] = StampsTextbox.new(driver.text_field(name: "ShipCompany")) if cache[:company].nil? || !cache[:company].present?
            cache[:company]
          end

          def address_1
            cache[:address_1] = StampsTextbox.new(driver.text_field(name: "ShipStreet1")) if cache[:address_1].nil? || !cache[:address_1].present?
            cache[:address_1]
          end

          def address_2
            cache[:address_2] = StampsTextbox.new(driver.text_field(name: "ShipStreet2")) if cache[:address_2].nil? || !cache[:address_2].present?
            cache[:address_2]
          end

          def email
            cache[:email] = StampsTextbox.new(driver.text_field(css: "[id*=shiptoview-international] [name=BuyerEmail]")) if cache[:email].nil? || !cache[:email].present?
            cache[:email]
          end

          def city
            cache[:city] = StampsTextbox.new(driver.text_field(name: "ShipCity")) if cache[:city].nil? || !cache[:city].present?
            cache[:city]
          end

          def phone
            cache[:phone] = StampsTextbox.new(driver.text_field(css: "[id*=shiptoview-international] [name=ShipPhone]")) if cache[:phone].nil? || !cache[:phone].present?
            cache[:phone]
          end

          def postal_code
            cache[:postal_code] = StampsTextbox.new(driver.text_field(name: "ShipPostalCode")) if cache[:postal_code].nil? || !cache[:postal_code].present?
            cache[:postal_code]
          end

          def province
            cache[:province] = StampsTextbox.new(driver.text_field(name: "ShipState")) if cache[:province].nil? || !cache[:province].present?
            cache[:province]
          end

          def less_link
            cache[:less_link] = StampsField.new driver.span(css: "[id*=shiptoview-international] [class*=sdc-icon-up-arrow]") if cache[:less_link].nil? || !cache[:less_link].present?
            cache[:less_link]
          end

          def hide_ship_to_details
            20.times do
              break unless less_link.present?
              less_link.click
              sleep(0.05)
            end
          end
        end

        class ShipToDomestic < WebApps::Base

          include ShowShipToDetails, BlurOutField

          def ambiguous
            cache[:ambiguous].nil? ? cache[:ambiguous] = AmbiguousAddress.new(param) : cache[:ambiguous]
          end

          def auto_suggest
            cache[:auto_suggest].nil? ? cache[:auto_suggest] = AutoSuggestDomestic.new(param, textarea) : cache[:auto_suggest]
          end

          def address_not_found
            cache[:address_not_found].nil? ? cache[:address_not_found] = AddressNotFound.new(param) : cache[:address_not_found]
          end

          def country
            if cache[:country].nil?
              cache[:country] = ShipToCountry.new(
                  param,
                  driver.text_field(css: "[id*=domestic] [name=ShipCountryCode]"),
                  driver.div(css: "div#sdc-mainpanel-matltocountrydroplist-trigger-picker"))
            end
            cache[:country]
          end

          def present?
            textarea.present?
          end

          def less_link
            @less_link = StampsField.new driver.span(css: "[id=shiptoview-domestic-targetEl] [class*=sdc-icon-up-arrow]") if @less_link.nil? || !@less_link.present?
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
            cache[:textarea].nil? || !cache[:textarea].present? ? cache[:textarea] = ShipToTextArea.new(driver.textarea(name: "freeFormAddress")) : cache[:textarea]
          end

          def email
            cache[:email].nil? || !cache[:email].present? ? cache[:email] = StampsTextbox.new(driver.text_field(name: 'BuyerEmail')) : cache[:email]
          end

          def phone
            cache[:phone].nil? || !cache[:phone].present? ? cache[:phone] = StampsTextbox.new(driver.text_field(name: "ShipPhone")) : cache[:phone]
          end

          def set(address) #todo-Rob move setting textarea responsibility to step def
            10.times do
              begin
                textarea.click
                textarea.set(address)
                15.times do
                  textarea.click
                  blur_out(3)
                  break if less_link.present?
                end
                break if less_link.present?
              rescue
                # ignore
              end
            end
            textarea.text
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

        class AutoSuggestDomestic < WebApps::Base


          attr_reader :textarea

          def initialize(param, textarea)
            super(param)
            @textarea = textarea
          end

          def auto_suggest_box
            cache[:auto_suggest_box].nil? ? cache[:auto_suggest_box] = AutoSuggestPopUp.new(param) : cache[:auto_suggest_box]
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
              rescue
                # ignore
              end
            }
          end
        end

        class ShipTo < WebApps::Base

          def domestic
            cache[:domestic] = ShipToDomestic.new(param) if cache[:domestic].nil? || !cache[:domestic].present?
            cache[:domestic]
          end

          def international
            cache[:international] = Fields::ShipToInternational.new(param) if cache[:international].nil? || !cache[:international].present?
            cache[:international]
          end
        end

        class ViewRestrictions < WebApps::Base
          def browser_ok_button
            StampsField.new(driver.span(text: "OK"))
          end

          def present?
            browser_ok_button.present?
          end

          def ok
            browser_ok_button.click
          end
        end

        class InsureFor < WebApps::Base
          include BlurOutField


          def cost
            cache[:cost] = StampsField.new(driver.div(css: "[class*=single] [class*=insurance-field]").parent.labels[4]) if cache[:cost].nil? || !cache[:cost].present?
            cache[:cost]
          end

          def textbox
            cache[:textbox] = StampsTextbox.new(driver.text_field(css: "[class*=single] [name=InsuredValue]")) if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox]
          end

          def checkbox
            if cache[:checkbox].nil? || !cache[:checkbox].present?
              cache[:checkbox] = StampsCheckbox.new(
                  driver.label(text: "Insure For $:").parent.input,
                  driver.label(text: "Insure For $:").parent.divs[1],
                  'class', 'checked')
            end
            cache[:checkbox]
          end

          def increment
            cache[:increment] = StampsField.new(driver.div(css: "[class*=single] [id^=insurance] [class*=up]")) if cache[:increment].nil? || !cache[:increment].present?
            cache[:increment]
          end

          def decrement
            cache[:decrement] = StampsField.new(driver.div(css: "[class*=single] [id^=insurance] [class*=down]")) if cache[:decrement].nil? || !cache[:decrement].present?
            cache[:decrement]
          end
        end

        class Tracking < WebApps::Base


          def cost
            cache[:cost] = StampsField.new(driver.label(css: '[class*=single] [class*=tracking_cost]')) if cache[:cost].nil? || !cache[:cost].present?
            cache[:cost]
          end

          def textbox
            cache[:textbox] = StampsTextbox.new(driver.text_field(css: '[class*=single] [name=Tracking]')) if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox]
          end

          def drop_down
            cache[:drop_down] = StampsField.new(driver.div(css: "[class*=single] [id^=tracking][id$=picker]")) if cache[:drop_down].nil? || !cache[:drop_down].present?
            cache[:drop_down]
          end

          def present?
            textbox.present?
          end

          def tracking_selection(selection)
            if selection.downcase.include? "usps"
              StampsField.new(driver.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td"))
            elsif selection.downcase.include? "signature"
              StampsField.new(driver.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td"))
            elsif selection.downcase.include? "none"
              StampsField.new(driver.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td"))
            else
              expect("#{selection} is not a valid selection").to eql "Valid selections are USPS Tracking and Signature Required"
            end
          end

          # todo-rob Details Tracking selection fix
          def select(str)
            expect(drop_down).to be_present
            20.times do
              selection = StampsField.new(tracking_selection(str).first)
              drop_down.click unless selection.present?
              selection.click
              break if textbox.text.include?(str)
            end
            expect(textbox.text).to include(str)
          end

          def inline_cost(selection)
            tds = tracking_selection(selection)
            expect(tds.size).to equal 2
            label = StampsField.new(tds.last)
            5.times do
              begin
                drop_down.click unless label.present?
                return label.text if label.present?
                drop_down.click
                label = tracking_selection(selection).last
                drop_down.click unless label.present?
                return label.text if label.present?
              rescue
                # ignore
              end
              expect("Unable to fetch inline cost for #{selection}").to eql "Details - Tracking inline cost"
            end
          end

          def tooltip(selection)
            selection_label = driver.td(text: selection)
            5.times {
              begin
                drop_down.click unless selection_label.present?
                if selection_label.present?
                  qtip = selection_label.parent.parent.parent.parent.attribute_value("data-qtip")
                  log.info "#{qtip}"
                  return qtip
                end
              rescue
                # ignore
              end
            }
          end
        end

        class StoreItem < WebApps::Base
        end

        class AssociatedOrderItem < WebApps::Base
          attr_reader :index, :item_qty, :item_id, :item_description, :delete
          def initialize(param, number)
            super(param)
            @index = number

            textbox = driver.text_fields(name: "Quantity")[@index - 1]
            inc_btn = driver.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index - 1]
            dec_btn = driver.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index - 1]
            @item_qty = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)

            @item_id = StampsTextbox.new((driver.text_fields(name: "SKU")[index - 1]))
            @delete = StampsField.new(driver.spans(css: "span[class*=sdc-icon-remove]")[index - 1])
            @item_description = StampsTextbox.new(driver.text_fields(name: "Description")[index - 1])
          end

          def present?
            ((driver.text_fields name: "SKU")[@index - 1]).present?
          end

          def scroll_into_view
            item_description.scroll_into_view
          end
        end

        class ItemsOrderedSection < WebApps::Base


          def add_btn
            cache[:add_btn] = StampsField.new(driver.span(css: "span[class*=sdc-icon-add]")) if cache[:add_btn].nil? || !cache[:add_btn].present?
            cache[:add_btn]
          end

          def drop_down
            if cache[:drop_down].nil? || cache[:drop_down].present?
              cache[:drop_down] = StampsField.new(driver.img(css: "div[id^=associatedorderitems-][id$=_header-targetEl]>div>img"))
            end
            cache[:drop_down]
          end

          def expand
            5.times do
              drop_down.click
              break if drop_down.field.attribute_value('class').include?('collapse-top')
            end
          end

          def collapse
            5.times do
              drop_down.click
              break if drop_down.field.attribute_value('class').include?('expand-bottom')
            end
          end

          def size
            driver.divs(css: "div[id^=singleorderitem-][id$=-targetEl]").size
          end
          alias_method :count, :size


          def item(number)
            associated_item = AssociatedOrderItem.new(param, number)
            10.times do
              associated_item.scroll_into_view
              return associated_item if associated_item.present?
              sleep(0.5)
              add_btn.click if number > size
            end
            associated_item
          end
        end

        class Collapsible < WebApps::Base
          attr_reader :field
          def initialize(param)
            super
            @field = StampsField.new(driver.img(class: "x-tool-img x-tool-expand-left"))
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

        class ToolbarMenu < WebApps::Base
          attr_reader :drop_down
          def initialize(param)
            super
            @drop_down = StampsField.new(driver.spans(css: "span[class*='sdc-icon-more']").first)
          end

          def collapse
            selection = StampsField.new driver.span(text: "Collapse Panel")
            dd = drop_down
            collapsed_details = Collapsible.new(param)
            10.times do
              dd.click unless selection.present?
              selection.click
              break if collapsed_details.present?
            end
          end

          def tooltip
            tooltip_field = StampsField.new(driver.div id: 'ext-quicktips-tip-innerCt')
            drop_down.field.hover
            drop_down.field.hover
            15.times do
              drop_down.field.hover
              sleep(0.35)
              if tooltip_field.present?
                log.info tooltip_field.text
                return tooltip_field.text
              end
            end
          end
        end

        module OrderDetailsOrderId
          def order_id
            if cache[:order_id_field].nil? || !cache[:order_id_field].present?
              cache[:order_id_field] = StampsField.new(driver.b(css: "[class*=singleorder] [id^=toolbar][id$=targetEl]>label>b"))
            end
            cache[:order_id_field]
          end
        end

        class Toolbar < WebApps::Base
          include OrderDetailsOrderId

          def menu
            cache[:menu].nil? ? cache[:menu] = ToolbarMenu.new(param) : cache[:menu]
          end

          def order
            cache[:order].nil? ? cache[:order] = SingleOrderDetailsOrderId.new(param) : cache[:order]
          end
        end

        class Footer < WebApps::Base


          def label
            cache[:label].nil? || !cache[:label].present? ? cache[:label] = StampsField.new(driver.strong(text: 'Total Ship Cost:')) : cache[:label]
          end

          def total_ship_cost
            if cache[:total_ship_cost].nil? || !cache[:total_ship_cost].present?
                cache[:total_ship_cost] = StampsField.new(driver.strong(css: '[class*=singleorder-detailsform] [class*=total_cost] strong'))
            end
            cache[:total_ship_cost]
          end

          def cost_label
            cache[:cost_label] = StampsField.new(driver.labels(css: "label[class*=total_cost]")[1]) if cache[:cost_label].nil? || !cache[:cost_label].present?
            cache[:cost_label]
          end

          def multiple_order_cost
            # cost_label = StampsField.new(driver.labels(css: "label[class*=total_cost]")[1])
            10.times do
              begin
                cost = cost_label.text
                log.info "Cost is #{cost}"
              rescue
                # ignore
              end
              break unless cost.include? "$"
            end
            cost_label.text.dollar_amount_str.to_f.round(2)
          end
        end

        class Contents < WebApps::Base

          attr_reader

          def initialize(param)
            super
            @restrictions_btn = StampsField.new(driver.span(text: 'Restrictions...'))
          end

          def restrictions_btn
            cache[:restrictions_btn] = StampsField.new(driver.a(css: '[data-qtip^=View]')) if cache[:restrictions_btn].nil? || !cache[:restrictions_btn].present?
            cache[:restrictions_btn]
          end

          def view_restrictions
            cache[:view_restrictions] = Orders::SingleOrder::Fields::ViewRestrictions.new(param) if cache[:view_restrictions].nil?
            cache[:view_restrictions]
          end

          def customs_form
            cache[:customs_form] = StampsField.new(driver.a(css: '[data-qtip*=Edit]')) if cache[:customs_form].nil? || !cache[:customs_form].present?
            cache[:customs_form]
          end

          def restrictions
            5.times do
              return view_restrictions if view_restrictions.present?
              restrictions_btn.click
            end
            expect(view_restrictions).to be_present
          end
        end

        class Service < WebApps::Base


          def textbox
            if cache[:textbox].nil? || !cache[:textbox].present?
              cache[:textbox] = StampsTextbox.new(driver.text_field(css: "[id^=singleOrder] [name=Service]"))
            end
            cache[:textbox]
          end

          def drop_down
            if cache[:drop_down].nil? || !cache[:drop_down].present?
              cache[:drop_down] = StampsField.new(driver.div(css: "[id^=singleOrder] [id^=service][id$=picker]"))
            end
            cache[:drop_down]
          end

          def cost
            cache[:cost] = StampsField.new(driver.div(css: "[id^=single] [class*=service-droplist]").parent.labels[2]) if cache[:cost].nil? || !cache[:cost].present?
            cache[:cost]
          end

          def selection(str)
            lov = driver.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text")
            if lov.size == 1 # return first one
              return lov[0]
            elsif lov.size == 2
              10.times do
                drop_down.scroll_into_view.click unless lov[0].present? || lov[1].present?
                return lov[0] if lov[0].present?
                return lov[1] if lov[1].present?
              end
            end

            raise ArgumentError, "Unable to create selection field for #{str}. Maximum of 2 floating service list of values expected."
          end

          def select(str)
            drop_down.scroll_into_view.click
            10.times do
              begin
                field = StampsField.new(selection(str))
                drop_down.scroll_into_view.click unless field.present?
                field.scroll_into_view.click
                break if textbox.text.include?(str)
              rescue
                # ignore
              end
            end
            textbox.text
          end

          def inline_cost(service_name)
            cost_label = StampsField.new(driver.td(css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"))
            10.times do
              begin
                drop_down.click unless cost_label.present?
                if cost_label.present?
                  service_cost = cost_label.text.dollar_amount_str
                  log.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                  drop_down.click if cost_label.present?
                  return service_cost.to_f.round(2)
                end
              rescue
                # ignore
              end
            end
          end
        end

        class Weight < WebApps::Base
          def present?
            lbs.present? && oz.present? && checkbox.present?
          end

          def lb
            @lb ||= StampsNumberField.new(
                driver.text_field(css: '[class*=single] [name=WeightLbs]'),
                driver.div(css: '[class*=single] [class*=pounds] [class*=up]'),
                driver.div(css: '[class*=single] [class*=pounds] [class*=down]'))
          end

          def oz
            @oz ||= StampsNumberField.new(
                driver.text_field(css: '[class*=single] [name=WeightOz]'),
                driver.div(css: '[class*=single] [class*=ounces] [class*=up]'),
                driver.div(css: '[class*=single] [class*=ounces] [class*=down]'))
          end

          def weigh
            @weigh ||= StampsField.new(driver.span(css: '[class*=single] div[id^=weightview] a>span[id$=btnWrap][class*=secondary]'))
          end
        end

        class Dimensions < WebApps::Base
          def present?
            length.present? && width.present? && height.present? && checkbox.present?
          end

          def length
            @length ||= StampsNumberField.new(
                driver.text_field(css: '[class*=single] [name=Length]'),
                driver.div(css: '[class*=single] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=up]'),
                driver.div(css: '[class*=single] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=down]'))
          end

          def width
            @width ||= StampsNumberField.new(
                driver.text_field(css: '[class*=single] [name=Width]'),
                driver.div(css: '[class*=single] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=up]'),
                driver.div(css: '[class*=single] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=down]'))
          end

          def height
            @height ||= StampsNumberField.new(
                driver.text_field(css: '[class*=single] [name=Height]'),
                driver.div(css: '[class*=single] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=up]'),
                driver.div(css: '[class*=single] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=down]'))
          end
        end

        class SingleFormShipFrom < WebApps::Base
          def initialize(param)
            super(param)
          end

          def textbox
            if cache[:textbox].nil? || !cache[:textbox].present?
              cache[:textbox] = StampsTextbox.new(driver.text_fields(name: "ShipFrom").first)
            end
            cache[:textbox]
          end

          def drop_down
            if cache[:drop_down].nil? || !cache[:drop_down].present?
              cache[:drop_down] = StampsTextbox.new(driver.divs(css: "div[id^=shipfromdroplist][id$=trigger-picker]").first)
            end
            cache[:drop_down]
          end

          def select(str)
            drop_down.click
            sleep(0.5)
            window_title = Object.const_get('WebApps::Base').new(param).extend(Stamps::Orders::ShipFrom::WindowTitle)
            selection = StampsField.new((str.downcase.include?('default')) ? driver.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']").first : driver.lis(visible_text: /#{str}/).first)
            if str.downcase.include?("manage shipping")
              20.times do
                sleep(0.35)
                drop_down.click unless selection.present?
                selection.scroll_into_view.click
                return window_title.window_title.text if window_title.present?
              end

              raise "Failed to open Manage Shipping Addresses modal"
            else
              15.times do
                sleep(0.35)
                drop_down.click unless selection.present?
                selection.scroll_into_view.click
                sleep(0.35)
                return textbox.text if textbox.text.size > 2
              end
            end
            textbox.text
          end
        end
      end

      ##
      # Single Order Details Form
      class OrderDetails < WebApps::Base

        include Fields::BlurOutField

        def toolbar
          cache[:toolbar] = Fields::Toolbar.new(param) if cache[:toolbar].nil?
          cache[:toolbar]
        end

        def single_ship_from
          cache[:single_ship_from] = Fields::SingleFormShipFrom.new(param) if cache[:single_ship_from].nil?
          cache[:single_ship_from]
        end

        def ship_to
          cache[:ship_to] = Fields::ShipTo.new(param) if cache[:ship_to].nil?
          cache[:ship_to]
        end

        def weight
          cache[:weight] = Fields::Weight.new(param) if cache[:weight].nil?
          cache[:weight]
        end

        def insure_for
          cache[:insure_for] = Fields::InsureFor.new(param) if cache[:insure_for].nil?
          cache[:insure_for]
        end

        def tracking
          cache[:tracking] = Fields::Tracking.new(param) if cache[:tracking].nil?
          cache[:tracking]
        end

        def reference_no
          if cache[:reference_no].nil? || !cache[:reference_no].present?
            cache[:reference_no] = StampsTextbox.new(driver.text_field(css: "[id^=single][id$=-targetEl]>div:nth-child(10) input"))
          end
          cache[:reference_no]
        end

        def dimensions
          cache[:dimensions] = Fields::Dimensions.new(param) if cache[:dimensions].nil?
          cache[:dimensions]
        end

        def items_ordered
          cache[:items_ordered] = Fields::ItemsOrderedSection.new(param) if cache[:items_ordered].nil?
          cache[:items_ordered]
        end

        def body
          if cache[:body].nil? || !cache[:body].present?
            cache[:body] = StampsField.new(driver.div(css: "[id^=single][id$=body]"))
          end
          cache[:body]
        end

        def collapsed_details
          cache[:collapsed_details] = Fields::Collapsible.new(param) if cache[:collapsed_details].nil?
          cache[:collapsed_details]
        end

        def footer
          cache[:footer] = Fields::Footer.new(param) if cache[:footer].nil?
          cache[:footer]
        end

        def contents
          cache[:contents] = Fields::Contents.new(param) if cache[:contents].nil?
          cache[:contents]
        end

        def present?
          body.present?
        end

        def service
          cache[:service] = Fields::Service.new(param) if cache[:service].nil?
          cache[:service]
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