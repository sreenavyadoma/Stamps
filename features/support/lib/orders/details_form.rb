module Stamps
  module Orders
    module SingleOrder
      class InsuranceTermsConditions < Browser::Base #todo-Rob move to Stamps::Common
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
                StampsField.new(button).click
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
                StampsField.new(button).click
              end
            rescue
              #ignore
            end
          end
        end
      end

      module Fields
        module BlurOutField
          def blur_out(count=1)
            @service_blur_out_field = StampsField.new(browser.label(text: 'Service:')) if @service_blur_out_field.nil? || !@service_blur_out_field.present?
            @weight_blur_out_field = StampsField.new(browser.label(text: 'Weight:')) if @weight_blur_out_field.nil? || !@weight_blur_out_field.present?
            ((count.nil?) ? 1 : count.to_i).times do
              @service_blur_out_field.click
              @weight_blur_out_field.double_click
              @weight_blur_out_field.click
              @service_blur_out_field.double_click
            end
          end
        end

        class ShipToInternational < Browser::Base
          include BlurOutField
          def present?
            name.present?
          end

          def auto_suggest
            @auto_suggest = AutoSuggestInternational.new(param) if @auto_suggest.nil? || !@auto_suggest.present?
          end

          def name
            @name = StampsTextbox.new(browser.text_field(name: "ShipName")) if @name.nil? || !@name.present?
            @name
          end

          def company
            @company = StampsTextbox.new(browser.text_field(name: "ShipCompany")) if @company.nil? || !@company.present?
            @company
          end

          def address_1
            @address_1 = StampsTextbox.new(browser.text_field(name: "ShipStreet1")) if @address_1.nil? || !@address_1.present?
            @address_1
          end

          def address_2
            @address_2 = StampsTextbox.new(browser.text_field(name: "ShipStreet2")) if @address_2.nil? || !@address_2.present?
            @address_2
          end

          def email
            @email = StampsTextbox.new(browser.text_field(css: "[id*=shiptoview-international] [name=BuyerEmail]")) if @email.nil? || !@email.present?
            @email
          end

          def city
            @city = StampsTextbox.new(browser.text_field(name: "ShipCity")) if @city.nil? || !@city.present?
            @city
          end

          def phone
            @phone = StampsTextbox.new(browser.text_field(css: "[id*=shiptoview-international] [name=ShipPhone]")) if @phone.nil? || !@phone.present?
            @phone
          end

          def postal_code
            @postal_code = StampsTextbox.new(browser.text_field(name: "ShipPostalCode")) if @xxxx.nil? || !@xxxx.present?
          end

          def province
            @province = StampsTextbox.new(browser.text_field(name: "ShipState")) if @xxxx.nil? || !@xxxx.present?
          end

          def less_link
            @less_link = StampsField.new browser.span(css: "[id*=shiptoview-international] [class*=sdc-icon-up-arrow]") if @less_link.nil? || !@less_link.present?
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

        class AutoSuggestInternational < Browser::Base
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

        class AutoSuggestPopUp < Browser::Base
          def present?
            name_fields[0].present?
          end

          def size
            browser.lis(css: "ul[class*='x-list-plain x-combo-list-ul']>li>div[class*=main]").size
          end

          def select number
            selection = StampsField.new(name_fields[number.to_i - 1])
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

        class AddressNotFound < Browser::Base
          attr_reader :window_title

          def initialize(param)
            super
            @window_title = StampsField.new browser.div(text: 'Exact Address Not Found')
          end

          def present?
            window_title.present?
          end

          def wait_until_present(*args)
            window_title.wait_until_present(*args)
          end

          def row(number)
            row = number.to_i <= 0 ? 0 : number.to_i - 1
            checkbox_field = browser.text_field css: "input[name=addrAmbig][value='#{row}']"

            checkbox = StampsCheckbox.new checkbox_field, checkbox_field, "checked", "checked"
            checkbox.check

            accept_button = StampsField.new browser.span text: "Accept"
            accept_button.click_while_present
          end

          def set partial_address_hash
            exact_address_not_found_field = browser.div text: 'Exact Address Not Found'
            form = DetailsForm.new(param) #todo-Rob this is wrong, change it.
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

        class AmbiguousAddress < Browser::Base
          attr_reader :address_not_found

          def initialize(param)
            super
            @address_not_found = AddressNotFound.new(param)
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
            @show_ship_to_details_link = StampsField.new(browser.span(css: "[id*=shipto] [class*=down]")) if @show_ship_to_details_link.nil? || !@show_ship_to_details_link.present?
            15.times do
              break unless @show_ship_to_details_link.present?
              @show_ship_to_details_link.click
              sleep(0.05)
            end
          end
        end

        class ShipToCountry < Browser::Base
          include ShowShipToDetails

          def dropdown
            (@dropdown.nil? || !@dropdown.present?) ? @dropdown = StampsField.new(dd) : @dropdown
          end

          def textbox
            (@textbox.nil? || !@textbox.present?) ? @textbox = StampsTextbox.new(txtbox) : @textbox
          end

          def present?
            dropdown.present?
          end

          def selected?(country)
            textbox.text == country
          end

          def select(country)
            show_ship_to_details
            selection = nil
            20.times do
              break if textbox.text.include?(country)
              dropdown.click
              sleep(0.4)
              browser.lis(text: country).each {|li| selection = StampsField.new(li) if li.text.size > 0}
              dropdown.click unless selection.present?
              selection.scroll_into_view
              selection.click
            end
            textbox.text
          end

          private
          def dd
            20.times do
              dom_dd = browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker")
              int_dd = browser.div(css: "[id=shiptoview-international-targetEl] [id^=combo][id$=trigger-picker]")
              return dom_dd if dom_dd.present?
              return int_dd if int_dd.present?
            end
            raise "Unable to get a handle on Ship-To country drop-down for either domestic or international single order details form."
          end

          def txtbox
            show_ship_to_details
            20.times {browser.text_fields(name: "ShipCountryCode").each {|field| return field if field.present?}}
            raise "Unable to get a handle on Ship-To country textbox for either domestic or international single order details form.."
          end
        end

        class ShipToDomestic < Browser::Base
          include ShowShipToDetails, BlurOutField

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
            @less_link = StampsField.new browser.span(css: "[id=shiptoview-domestic-targetEl] [class*=sdc-icon-up-arrow]") if @less_link.nil? || !@less_link.present?
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
            @email = StampsTextbox.new browser.text_field(name: 'BuyerEmail') if @email.nil? || !@email.present?
            @email
          end

          def phone
            show_ship_to_details
            @phone = StampsTextbox.new browser.text_field(name: "ShipPhone") if @phone.nil? || !@phone.present?
            @phone
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
              rescue Exception => e
                logger.error e.message
                logger.error e.backtrace.join("\n")
                expect("Unable to Ship-To address to #{address}. Error: #{e.message}").to eql "Set Ship-To Address Failed"
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

        class AutoSuggestDomestic < Browser::Base
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

        class ShipTo < Browser::Base
          attr_reader :country, :international, :domestic
          def initialize(param)
            super
            @country = ShipToCountry.new(param)
            @domestic = ShipToDomestic.new(param)
            @international = Fields::ShipToInternational.new(param)
          end
        end

        class ViewRestrictions < Browser::Base
          def browser_ok_button
            StampsField.new(browser.span(text: "OK"))
          end

          def present?
            browser_ok_button.present?
          end

          def ok
            browser_ok_button.click
          end
        end

        class InsureFor < Browser::BaseCache
          include BlurOutField
          assign({})

          def cost
            cache[:cost] = StampsField.new(browser.div(css: "[class*=single] [class*=insurance-field]").parent.labels[4]) if cache[:cost].nil? || !cache[:cost].present?
            cache[:cost]
          end

          def textbox
            cache[:textbox] = StampsTextbox.new(browser.text_field(css: "[class*=single] [name=InsuredValue]")) if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox]
          end

          def checkbox
            if cache[:checkbox].nil? || !cache[:checkbox].present?
              cache[:checkbox] = StampsCheckbox.new(
                  browser.label(text: "Insure For $:").parent.input,
                  browser.label(text: "Insure For $:").parent.divs[1],
                  "class", "checked")
            end
            cache[:checkbox]
          end

          def increment
            cache[:increment] = StampsField.new(browser.div(css: "[class*=single] [id^=insurance] [class*=up]")) if cache[:increment].nil? || !cache[:increment].present?
            cache[:increment]
          end

          def decrement
            cache[:decrement] = StampsField.new(browser.div(css: "[class*=single] [id^=insurance] [class*=down]")) if cache[:decrement].nil? || !cache[:decrement].present?
            cache[:decrement]
          end
        end

        class Tracking < Browser::BaseCache
          assign({})

          def cost
            cache[:cost] = StampsField.new(browser.label(css: '[class*=single] [class*=tracking_cost]')) if cache[:cost].nil? || !cache[:cost].present?
            cache[:cost]
          end

          def textbox
            cache[:textbox] = StampsTextbox.new(browser.text_field(css: '[class*=single] [name=Tracking]')) if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox]
          end

          def dropdown
            cache[:dropdown] = StampsField.new(browser.div(css: "[class*=single] [id^=tracking][id$=picker]")) if cache[:dropdown].nil? || !cache[:dropdown].present?
            cache[:dropdown]
          end

          def present?
            textbox.present?
          end

          def tracking_selection(selection)
            if selection.downcase.include? "usps"
              StampsField.new(browser.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td"))
            elsif selection.downcase.include? "signature"
              StampsField.new(browser.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td"))
            elsif selection.downcase.include? "none"
              StampsField.new(browser.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td"))
            else
              expect("#{selection} is not a valid selection").to eql "Valid selections are USPS Tracking and Signature Required"
            end
          end

          # todo-rob Details Tracking selection fix
          def select(str)
            expect(dropdown).to be_present
            20.times do
              selection = StampsField.new(tracking_selection(str).first)
              dropdown.click unless selection.present?
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

        class StoreItem < Browser::Base
        end

        class AssociatedOrderItem < Browser::Base
          attr_reader :index, :item_qty, :item_id, :item_description, :delete
          def initialize(param, number)
            super(param)
            @index = number

            textbox = browser.text_fields(name: "Quantity")[@index - 1]
            inc_btn = browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index - 1]
            dec_btn = browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index - 1]
            @item_qty = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)

            @item_id = StampsTextbox.new((browser.text_fields(name: "SKU")[index - 1]))
            @delete = StampsField.new(browser.spans(css: "span[class*=sdc-icon-remove]")[index - 1])
            @item_description = StampsTextbox.new(browser.text_fields(name: "Description")[index - 1])
          end

          def present?
            ((browser.text_fields name: "SKU")[@index - 1]).present?
          end

          def scroll_into_view
            item_description.scroll_into_view
          end
        end

        class ItemsOrderedSection < Browser::Base
          attr_reader :add_btn, :dropdown

          def initialize(param)
            super
            @add_btn = StampsField.new(browser.span(css: "span[class*=sdc-icon-add]"))
            @dropdown = StampsField.new(browser.img(css: "div[id^=associatedorderitems-][id$=_header-targetEl]>div>img"))
          end

          def expand
            5.times do
              dropdown.click
              break if dropdown.field.attribute_value('class').include?('collapse-top')
            end
          end

          def collapse
            5.times do
              dropdown.click
              break if dropdown.field.attribute_value('class').include?('expand-bottom')
            end
          end

          def size
            browser.divs(css: "div[id^=singleorderitem-][id$=-targetEl]").size
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

        class Collapsible < Browser::Base
          attr_reader :field
          def initialize(param)
            super
            @field = StampsField.new(browser.img(class: "x-tool-img x-tool-expand-left"))
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

        class ToolbarMenu < Browser::Base
          attr_reader :dropdown
          def initialize(param)
            super
            @dropdown = StampsField.new(browser.spans(css: "span[class*='sdc-icon-more']").first)
          end

          def collapse
            selection = StampsField.new browser.span(text: "Collapse Panel")
            dd = dropdown
            collapsed_details = Collapsible.new(param)
            10.times do
              dd.click unless selection.present?
              selection.click
              break if collapsed_details.present?
            end
          end

          def tooltip
            tooltip_field = StampsField.new(browser.div id: 'ext-quicktips-tip-innerCt')
            dropdown.field.hover
            dropdown.field.hover
            15.times do
              dropdown.field.hover
              sleep(0.35)
              if tooltip_field.present?
                logger.info tooltip_field.text
                return tooltip_field.text
              end
            end
          end
        end

        class SingleOrderDetailsOrderId < Browser::Base
          def present?
            order_id_field.present?
          end

          def wait_until_present(*args)
            order_id_field.wait_until_present(*args)
          end

          def order_id_field
            @order_id_field = StampsField.new(browser.b(css: "div[id^=singleOrderDetailsForm][class*=singleorder-detailsform]>div[id^=toolbar]>div[id^=toolbar]>div[id^=toolbar]>label>b")) if @order_id_field.nil? || !@order_id_field.present?
            @order_id_field
          end

          def details_order_id
            30.times{
              begin
                return /\d+/.match(order_id_field.text).to_s if present?
                sleep(0.15)
              rescue
                #ignroe
              end
            }
            ""
          end
        end

        class Toolbar < Browser::Base
          def menu
            @menu = ToolbarMenu.new(param) if @menu.nil? || !@menu.present?
            @menu
          end

          def order_id
            SingleOrderDetailsOrderId.new(param).details_order_id #todo-Rob fix this
          end
        end

        class Footer < Browser::Base
          def label
            StampsField.new(browser.strong(text: 'Total Ship Cost:'))
          end

          def total_ship_cost
            StampsField.new(browser.strong(css: '[class*=singleorder-detailsform] [class*=total_cost] strong'))
          end

          def multiple_order_cost
            cost_label = StampsField.new(browser.labels(css: "label[class*=total_cost]")[1])
            10.times do
              begin
                cost = cost_label.text
                logger.info "Cost is #{cost}"
              rescue
                #ignore
              end
              break unless cost.include? "$"
            end
            cost_label.text.dollar_amount_str.to_f.round(2)
          end
        end

        class Contents < Browser::BaseCache
          assign({})
          attr_reader

          def initialize(param)
            super
            @restrictions_btn = StampsField.new(browser.span(text: 'Restrictions...'))
          end

          def restrictions_btn
            cache[:restrictions_btn] = StampsField.new(browser.a(css: '[data-qtip^=View]')) if cache[:restrictions_btn].nil? || !cache[:restrictions_btn].present?
            cache[:restrictions_btn]
          end

          def view_restrictions
            cache[:view_restrictions] = Orders::SingleOrder::Fields::ViewRestrictions.new(param) if cache[:view_restrictions].nil?
            cache[:view_restrictions]
          end

          def customs_form
            cache[:customs_form] = StampsField.new(browser.a(css: '[data-qtip*=Edit]')) if cache[:customs_form].nil? || !cache[:customs_form].present?
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

        class Service < Browser::BaseCache
          assign({})

          def selection_field(order_form, str)
            ::Common::ServiceSelection::FloatingServiceTracker.new(param).selection_field(order_form, str)
          end

          def textbox
            cache[:textbox] = StampsTextbox.new(browser.text_field(css: "[id^=singleOrder] [name=Service]"))  if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox]
          end

          def dropdown
            cache[:dropdown] = StampsField.new(browser.div(css: "[id^=singleOrder] [id^=service][id$=picker]")) if cache[:dropdown].nil? || !cache[:dropdown].present?
            cache[:dropdown]
          end

          def cost
            cache[:cost] = StampsField.new(browser.div(css: "[id^=single] [class*=service-droplist]").parent.labels[2]) if cache[:cost].nil? || !cache[:cost].present?
            cache[:cost]
          end

          def select(str)
            dropdown.click
            selection = selection_field(::Common::ServiceSelection::FloatingServiceTracker::SINGLE_ORDER, str)
            5.times do
              begin
                dropdown.click unless selection.present?
                selection.scroll_into_view.click
                break if textbox.text.include?(str)
              rescue
                #ignore
              end
            end
            textbox.text
          end

          def inline_cost(service_name)
            cost_label=StampsField.new(browser.td(css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"))
            10.times do
              begin
                dropdown.click unless cost_label.present?
                if cost_label.present?
                  service_cost=cost_label.text.dollar_amount_str
                  logger.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                  dropdown.click if cost_label.present?
                  return service_cost.to_f.round(2)
                end
              rescue
                #ignore
              end
            end
          end
        end
      end

      class DetailsForm < Browser::BaseCache
        assign({})
        include Fields::BlurOutField
        attr_reader :toolbar, :single_ship_from, :ship_to, :weight, :body, :insure_for, :service, :tracking,
                    :dimensions, :footer, :items_ordered, :reference_no, :collapsed_details
        def initialize(param)
          super
          @toolbar = Fields::Toolbar.new(param)
          @single_ship_from = Stamps::Orders::DetailsFormCommon::DetailsFormShipFrom.new(param, :single_order)
          @ship_to = Fields::ShipTo.new(param)
          @weight = Stamps::Orders::DetailsFormCommon::OrderDetailsWeight.new(param, :single_order)
          @insure_for = Fields::InsureFor.new(param)
          @tracking = Fields::Tracking.new(param)
          @reference_no = StampsTextbox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(10)>div>div>div>div>div>div>input"))
          @dimensions = Stamps::Orders::DetailsFormCommon::DetailsFormDimensions.new(param, :single_order)
          @items_ordered = Fields::ItemsOrderedSection.new(param)
          @body = StampsField.new(browser.div(css: "div[id^=singleOrderDetailsForm][id$=body]"))
          @collapsed_details = Fields::Collapsible.new(param)
          @footer = Fields::Footer.new(param)
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