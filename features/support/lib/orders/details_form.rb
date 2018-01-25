module Stamps
  module Orders
    module SingleOrder
      class InsuranceTermsConditions < Browser::Base
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

        class ShipToInternational < Browser::BaseCache
          include BlurOutField

          assign({})

          def present?
            name.present?
          end

          def auto_suggest
            cache[:auto_suggest].nil? ? cache[:auto_suggest] = AutoSuggestInternational.new(param) : cache[:auto_suggest]
          end

          def name
            cache[:name].nil? || !cache[:name].present? ? cache[:name] = StampsTextbox.new(browser.text_field(name: "ShipName")) : cache[:name]
          end

          def company
            cache[:company].nil? || !cache[:company].present? ? cache[:company] = StampsTextbox.new(browser.text_field(name: "ShipCompany")) : cache[:company]
          end

          def address_1
            cache[:address_1] = StampsTextbox.new(browser.text_field(name: "ShipStreet1")) if cache[:address_1].nil? || !cache[:address_1].present?
            cache[:address_1]
          end

          def address_2
            cache[:address_2] = StampsTextbox.new(browser.text_field(name: "ShipStreet2")) if cache[:address_2].nil? || !cache[:address_2].present?
            cache[:address_2]
          end

          def email
            if cache[:email].nil? || !cache[:email].present?
              cache[:email] = StampsTextbox.new(browser.text_field(css: "[id*=shiptoview-international] [name=BuyerEmail]"))
            end
            cache[:email]
          end

          def city
            cache[:city].nil? || !cache[:city].present? ? cache[:city] = StampsTextbox.new(browser.text_field(name: "ShipCity")) : cache[:city]
          end

          def phone
            if cache[:phone].nil? || !cache[:phone].present?
              cache[:phone] = StampsTextbox.new(browser.text_field(css: "[id*=shiptoview-international] [name=ShipPhone]"))
            end
            cache[:phone]
          end

          def postal_code
            # @postal_code = StampsTextbox.new(browser.text_field(name: "ShipPostalCode")) if @xxxx.nil? || !@xxxx.present?
            cache[:postal_code] = StampsTextbox.new(browser.text_field(name: "ShipPostalCode")) if cache[:postal_code].nil? || cache[:postal_code].present?
            cache[:postal_code]
          end

          def province
            # @province = StampsTextbox.new(browser.text_field(name: "ShipState")) if @xxxx.nil? || !@xxxx.present?
            cache[:province] = StampsTextbox.new(browser.text_field(name: "ShipState")) if cache[:province].nil? || cache[:province].present?
            cache[:province]
          end

          def less_link
            if cache[:less_link].nil? || !cache[:less_link].present?
              cache[:less_link] = StampsField.new(browser.span(css: "[id*=shiptoview-international] [class*=sdc-icon-up-arrow]"))
            end
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

        #todo-rob refactor auto-suggest internatinal
        class AutoSuggestInternational < Browser::BaseCache
          assign({})

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
                #ignore
              end
            }
          end
        end

        class AutoSuggestPopUp < Browser::BaseCache
          assign({})

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

        class AddressNotFound < Browser::BaseCache
          assign({})

          def window_title
            if cache[:window_title].nil? || !cache[:window_title].present?
                cache[:window_title] = StampsField.new(browser.div(text: 'Exact Address Not Found'))
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

        class AmbiguousAddress < Browser::BaseCache
          assign({})

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
          def show_ship_to_details_link
            if cache[:show_ship_to_details_link].nil? || !cache[:show_ship_to_details_link].present?
              cache[:show_ship_to_details_link] = StampsField.new(browser.span(css: "[id*=shipto] [class*=down]"))
            end
            cache[:show_ship_to_details_link]
          end

          def show_ship_to_details
            15.times do
              break unless show_ship_to_details_link.present?
              show_ship_to_details_link.click
              sleep(0.05)
            end
          end
        end

        class ShipToCountry < Browser::BaseCache
          include ShowShipToDetails

          assign({})

          def dropdown
            cache[:dropdown].nil? || !cache[:dropdown].present? ? cache[:dropdown] = StampsField.new(dd) : cache[:dropdown]
          end

          def textbox
            cache[:textbox].nil? || !cache[:textbox].present? ? cache[:textbox] = StampsTextbox.new(txtbox) : cache[:textbox]
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

        class ShipToDomestic < Browser::BaseCache
          include ShowShipToDetails, BlurOutField

          assign({})

          def ambiguous
            cache[:ambiguous].nil? ? cache[:ambiguous] = AmbiguousAddress.new(param) : cache[:ambiguous]
          end

          def auto_suggest
            cache[:auto_suggest].nil? ? cache[:auto_suggest] = AutoSuggestDomestic.new(param, textarea) : cache[:auto_suggest]
          end

          def address_not_found
            cache[:address_not_found].nil? ? cache[:address_not_found] = AddressNotFound.new(param) : cache[:address_not_found]
          end

          def present?
            dom_textarea.present?
          end

          def less_link
            if cache[:less_link].nil? || !cache[:less_link].present?
              cache[:less_link] = StampsField.new(browser.span(css: "[id=shiptoview-domestic-targetEl] [class*=sdc-icon-up-arrow]"))
            end
            cache[:less_link]
          end

          def hide_ship_to_details
            10.times do
              break unless less_link.present?
              less_link.click
              sleep(0.05)
            end
          end

          def textarea
            cache[:textarea].nil? || !cache[:textarea].present? ? cache[:textarea] = ShipToTextArea.new(browser.textarea(name: "freeFormAddress")) : cache[:textarea]
          end

          def email
            cache[:email].nil? || !cache[:email].present? ? cache[:email] = StampsTextbox.new(browser.text_field(name: 'BuyerEmail')) : cache[:email]
          end

          def phone
            cache[:phone].nil? || !cache[:phone].present? ? cache[:phone] = StampsTextbox.new(browser.text_field(name: "ShipPhone")) : cache[:phone]
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

        class AutoSuggestDomestic < Browser::BaseCache
          assign({})

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
              rescue Exception => e
                logger.error e.message
                logger.error e.backtrace.join("\n")
              end
            }
          end
        end

        class ShipTo < Browser::BaseCache
          assign({})

          def country
            cache[:country].nil? ? cache[:country] = ShipToCountry.new(param) : cache[:country]
          end

          def international
            cache[:international].nil? ? cache[:international] = Fields::ShipToInternational.new(param) : cache[:international]
          end

          def domestic
            cache[:domestic].nil? ? cache[:domestic] = ShipToDomestic.new(param) : cache[:domestic]
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
          def cache
            self.class.cache
          end

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
          def cache
            self.class.cache
          end

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

        class ItemsOrderedSection < Browser::BaseCache
          assign({})

          def add_btn
            cache[:add_btn] = StampsField.new(browser.span(css: "span[class*=sdc-icon-add]")) if cache[:add_btn].nil? || !cache[:add_btn].present?
            cache[:add_btn]
          end

          def dropdown
            if cache[:dropdown].nil? || cache[:dropdown].present?
              cache[:dropdown] = StampsField.new(browser.img(css: "div[id^=associatedorderitems-][id$=_header-targetEl]>div>img"))
            end
            cache[:dropdown]
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

        class SingleOrderDetailsOrderId < Browser::BaseCache
          assign({})

          def present?
            order_id_field.present?
          end

          def wait_until_present(*args)
            order_id_field.wait_until_present(*args)
          end

          def order_id_field
            if cache[:order_id_field].nil? || !cache[:order_id_field].present?
              cache[:order_id_field] = StampsField.new(browser.b(css: "div[id^=singleOrderDetailsForm][class*=singleorder-detailsform]>div[id^=toolbar]>div[id^=toolbar]>div[id^=toolbar]>label>b"))
              end
            cache[:order_id_field]
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

        class Toolbar < Browser::BaseCache
          assign({})
          def menu
            cache[:menu].nil? ? cache[:menu] = ToolbarMenu.new(param) : cache[:menu]
          end

          def order
            cache[:order].nil? ? cache[:order] = SingleOrderDetailsOrderId.new(param) : cache[:order]
          end

          def order_id
            order.details_order_id #todo-Rob fix this. UPD - Fixed ©Alex
          end
        end

        class Footer < Browser::BaseCache
          assign({})

          def label
            cache[:label].nil? || !cache[:label].present? ? cache[:label] = StampsField.new(browser.strong(text: 'Total Ship Cost:')) : cache[:label]
          end

          def total_ship_cost
            if cache[:total_ship_cost].nil? || !cache[:total_ship_cost].present?
                cache[:total_ship_cost] = StampsField.new(browser.strong(css: '[class*=singleorder-detailsform] [class*=total_cost] strong'))
            end
            cache[:total_ship_cost]
          end

          def cost_label
            cache[:cost_label] = StampsField.new(browser.labels(css: "label[class*=total_cost]")[1]) if cache[:cost_label].nil? || !cache[:cost_label].present?
            cache[:cost_label]
          end

          def multiple_order_cost
            # cost_label = StampsField.new(browser.labels(css: "label[class*=total_cost]")[1])
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

        class OrdersCustomsFields < Browser::Base
          attr_reader :customs_form, :view_restrictions, :browser_restrictions_button, :custom_form_btn, :restrictions_btn

          def initialize(param)
            super
            @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
            @view_restrictions = Orders::SingleOrder::Fields::ViewRestrictions.new(param)
            @custom_form_btn = StampsField.new browser.span text: 'Customs Form...'
            @restrictions_btn = StampsField.new browser.span text: 'Restrictions...'
          end

          def customs_form
            cache[:customs_form].nil? ? cache[:customs_form] = Stamps::Common::Customs::CustomsInformation.new(param) : cache[:customs_form]
          end

          def view_restrictions
            cache[:view_restrictions].nil? ? cache[:view_restrictions] = Orders::SingleOrder::Fields::ViewRestrictions.new(param) : cache[:view_restrictions]
          end

          def custom_form_btn
            if cache[:custom_form_btn].nil? || ! cache[:custom_form_btn].present?
              cache[:custom_form_btn] = StampsField.new(browser.span(text: 'Customs Form...'))
            end
            cache[:custom_form_btn]
          end

          def restrictions_btn
            if cache[:restrictions_btn].nil? || cache[:restrictions_btn].present?
              cache[:restrictions_btn] = StampsField.new(browser.span(text: 'Restrictions...'))
            end
            cache[:restrictions_btn]
          end


          def edit_customs_form
            10.times do
              return customs_form if customs_form.present?
              custom_form_btn.scroll_into_view
              custom_form_btn.click
              customs_form.wait_until_present(2)
            end
            expect(customs_form).to be_present
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
          def cache
            self.class.cache
          end

          def selection_field(order_form, str)
            ::Common::ServiceSelection::FloatingServiceTracker.new(param).selection_field(order_form, str)
          end

          def textbox
            cache[:textbox] = StampsTextbox.new(browser.text_field(css: "[id^=singleOrder] [name=Service]")) if cache[:textbox].nil? || !cache[:textbox].present?
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

        # attr_reader :toolbar, :single_ship_from, :ship_to, :weight, :body, :insure_for, :service, :tracking,
        #             :dimensions, :footer, :customs, :items_ordered, :reference_no, :collapsed_details
        # def initialize(param)
        #   super
        #   @toolbar = Fields::Toolbar.new(param)
        #   @single_ship_from = Stamps::Orders::DetailsFormCommon::DetailsFormShipFrom.new(param, :single_order)
        #   @ship_to = Fields::ShipTo.new(param)
        #   @weight = Stamps::Orders::DetailsFormCommon::OrderDetailsWeight.new(param, :single_order)
        #   @insure_for = Fields::InsureFor.new(param)
        #   @tracking = Fields::Tracking.new(param)
        #   @reference_no = StampsTextbox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(10)>div>div>div>div>div>div>input"))
        #   @dimensions = Stamps::Orders::DetailsFormCommon::DetailsFormDimensions.new(param, :single_order)
        #   @items_ordered = Fields::ItemsOrderedSection.new(param)
        #   @customs = Fields::OrdersCustomsFields.new(param)
        #   @body = StampsField.new(browser.div(css: "div[id^=singleOrderDetailsForm][id$=body]"))
        #   @collapsed_details = Fields::Collapsible.new(param)
        #   @footer = Fields::Footer.new(param)
        # end

        def toolbar
          cache[:toolbar].nil? ? cache[:toolbar] = Fields::Toolbar.new(param) : cache[:toolbar]
        end

        def single_ship_from
          cache[:single_ship_from] = Stamps::Orders::DetailsFormCommon::DetailsFormShipFrom.new(param, :single_order) if cache[:single_ship_from].nil?
          cache[:single_ship_from]
        end

        def ship_to
          cache[:ship_to].nil? ? cache[:ship_to] = Fields::ShipTo.new(param) : cache[:ship_to]
        end

        def weight
          cache[:weight].nil? ? cache[:weight] = Stamps::Orders::DetailsFormCommon::OrderDetailsWeight.new(param, :single_order) : cache[:weight]
        end

        def body
          cache[:body] = StampsField.new(browser.div(css: "div[id^=singleOrderDetailsForm][id$=body]")) if cache[:body].nil? || !cache[:body].present?
          cache[:body]
        end

        def insure_for
          cache[:insure_for].nil? ? cache[:insure_for] = Fields::InsureFor.new(param) : cache[:insure_for]
        end

        def tracking
          cache[:tracking].nil? ? cache[:tracking] = Fields::Tracking.new(param) : cache[:tracking]
        end

        def dimensions
          cache[:dimensions] = Stamps::Orders::DetailsFormCommon::DetailsFormDimensions.new(param, :single_order) if cache[:dimensions].nil?
          cache[:dimensions]
        end

        def footer
          cache[:footer].nil? ? cache[:footer] = Fields::Footer.new(param) : cache[:footer]
        end

        def customs
          cache[:customs].nil? ? cache[:customs] = Fields::OrdersCustomsFields.new(param) : cache[:customs]
        end

        def items_ordered
          cache[:items_ordered].nil? ? cache[:items_ordered] = Fields::ItemsOrderedSection.new(param) : cache[:items_ordered]
        end

        def reference_no
          if cache[:reference_no].nil? || !cache[:reference_no].present?
            cache[:reference_no] = StampsTextbox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div:nth-child(10)>div>div>div>div>div>div>input"))
          end
          cache[:reference_no]
        end

        def collapsed_details
          cache[:collapsed_details].nil? ? cache[:collapsed_details] = Fields::Collapsible.new(param) : cache[:collapsed_details]
        end

        def present?
          body.present?
        end

        def service
          cache[:service].nil? ? cache[:service] = Fields::Service.new(param) : cache[:service]
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