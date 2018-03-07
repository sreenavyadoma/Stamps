module Stamps
  module Mail
    module PrintFormPanel
      module PrintFormBlurOut
        def blur_out_field
          (cache[:blur_out_field].nil? || !cache[:blur_out_field].present?) ? cache[:blur_out_field] = StampsField.new(browser.label(text: 'Print On:')) : cache[:blur_out_field]
        end

        def blur_out(count = 2)
          expect(blur_out_field).to be_present, "Blur out field is not present."
          count.to_i.times do
            blur_out_field.double_click
            blur_out_field.click
          end
        end
      end

      class UpgradePlan < Browser::Base
        attr_reader :window_title, :close_btn, :upgrade_now_btn, :not_yet_btn, :paragraph_field

        def initialize(param)
          super
          @window_title = StampsField.new(browser.div(text: "Upgrade Plan"))
          @close_btn = StampsField.new(browser.img(text: "img[class*=close]"))
          @upgrade_now_btn = StampsField.new(browser.span(text: "Upgrade Now"))
          @not_yet_btn = StampsField.new(browser.span(text: "Not Yet"))
          @paragraph_field = StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]"))
        end

        def present?
          window_title.present?
        end

        def close
          close_btn.click_while_present
        end

        def paragraph
          paragraph_field.text
        end

        def not_yet
          not_yet_btn.click_while_present
        end

        def upgrade_now
          upgrade_now_btn.click_while_present
          expect(browser.url).to include(param.test_env), "User rerouted to an external URL. You are no longer in #{param.test_env}. Check URL #{browser.url}"
        end
      end

      module PrintMediaHelper
        def print_media(str)
          case(str)
            when /Certified Mail Label - SDC-3610/
              #return :certified_mail
              return :cm3610
            when /Certified Mail Label - SDC-3710/
              #return :certified_mail
              return :cm3710
            when /Certified Mail Label - SDC-3910/
              #return :certified_mail_3910_3930
              return :cm3910
            when /Certified Mail Label - SDC-3930/
              #return :certified_mail_3910_3930
              return :cm3930
            when /Certified Mail Label - SDC-3810/
              #eturn :certified_mail_3810
              return :cm3810
            when /Certified Mail Label - SDC-3830/
              #return :certified_mail_3830
              return :cm3830
            when /Shipping Label/
              return :label
            when /Envelope/
              return :envelope
            when /Roll/
              return :roll
            when /Manage Printing Options/
              return :manage_printing_options
            when /Stamps/
              return :stamps
            else
              raise "#{str} is not a valid print_media"
          end
        end

        def selected_sub_str(str)
          case(str)
            when /Shipping Label - Paper/
              return 'Paper'
            when /Shipping Label - SDC-1200/
              return 'SDC-1200'
            when /Shipping Label - 5x8/
              return 'Shipping Label - 5 '
            when /Envelope - 10/
              return 'Envelope - #10'
            when /Envelope - 9/
              return 'Envelope - #9'
            when /Envelope - A9/
              return 'Envelope - #A9'
            when /Envelope - 6/
              return 'Envelope - #6'
            when /Envelope - A2/
              return 'Envelope - #A2'
            when /Envelope - 7/
              return 'Envelope - #7'
            when /Envelope - 11/
              return 'Envelope - #11'
            when /Envelope - 12/
              return 'Envelope - #12'
            when /Certified Mail Label - SDC-3610/
              return 'SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'SDC-3810'
            when /Certified Mail Label - SDC-3830/
              return 'SDC-3830'
            when /Roll 4x6/
              return 'Roll - 4'
            when /Roll 418x614/
              return 'Roll - 4 '
            when /Manage Printing Options/
              return 'Manage Printing Option...'
            when /Stamps/
              return 'Stamps'
            else
              raise "#{str} is not a valid print_media"
          end
        end

        def mpo_search_str(str)
          case(str)
            when /Stamps/
              return 'stamps'
            when /Shipping Label - Paper/
              return 'Shipping Label - 8 '
            when /Shipping Label - SDC-1200/
              return 'Shipping Label - SDC-1200'
            when /Shipping Label - 5x8/
              return 'Shipping Label - 5 '
            when /Envelope - 10/
              return 'Envelope - #10'
            when /Envelope - 9/
              return 'Envelope - #9'
            when /Envelope - A9/
              return 'Envelope - #A9'
            when /Envelope - 6/
              return 'Envelope - #6'
            when /Envelope - A2/
              return 'Envelope - #A2'
            when /Envelope - 7/
              return 'Envelope - #7'
            when /Envelope - 11/
              return 'Envelope - #11'
            when /Envelope - 12/
              return 'Envelope - #12'
            when /Certified Mail Label - SDC-3610/
              return 'Certified Mail Label - SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'Certified Mail Label - SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'Certified Mail Label - SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'Certified Mail Label - SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'Certified Mail #11 Envelope - SDC-3810'
            when /Certified Mail Label - SDC-3830/
              return 'Certified Mail #11 Envelope - SDC-3830'
            when /Roll 4x6/
              return 'Roll - 4" x 6" Shipping Label'
            when /Roll 418x614/
              return 'Roll - 4 '
            else
              raise "#{str} is not a valid print_media"
          end
        end

        def selection_field(str)
          case(str)
            when /Shipping Label - Paper/
              return 'Shipping Label - 8 '
            when /Shipping Label - SDC-1200/
              return 'Shipping Label - SDC-1200'
            when /Shipping Label - 5x8/
              return 'Shipping Label - 5 '
            when /Envelope - 10/
              return 'Envelope - #10'
            when /Envelope - 9/
              return 'Envelope - #9'
            when /Envelope - A9/
              return 'Envelope - #A9'
            when /Envelope - 6/
              return 'Envelope - #6'
            when /Envelope - A2/
              return 'Envelope - #A2'
            when /Envelope - 7/
              return 'Envelope - #7'
            when /Envelope - 11/
              return 'Envelope - #11'
            when /Envelope - 12/
              return 'Envelope - #12'
            when /Certified Mail Label - SDC-3610/
              return 'Certified Mail Label - SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'Certified Mail Label - SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'Certified Mail Label - SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'Certified Mail Label - SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'Certified Mail #11 Envelope - SDC-3810'
            when /Roll 4x6/
              return 'Roll - 4" x 6" Shipping Label'
            when /Roll 418x614/
              return 'Roll - 4 '
            when /Stamps/
              return 'stamps'
            else
              raise "#{str} is not a valid print_media"
          end
        end
      end

      class ManagePrintOptionsModal < Browser::Base
        include PrintMediaHelper



        def search_field
          (cache[:search_field].nil? || !cache[:search_field].present?) ? cache[:search_field] = StampsTextbox.new(
              browser.text_field(css: "[placeholder='Search']")) : cache[:search_field]
        end

        def save_button
          (cache[:save_button].nil? || !cache[:save_button].present?) ? cache[:save_button] = StampsField.new(
              browser.span(text: "Save")) : cache[:save_button]
        end

        def close_button
          (cache[:close_button].nil? || !cache[:close_button].present?) ? cache[:close_button] = StampsField.new(
              browser.img(class: "x-tool-img x-tool-close")) : cache[:close_button]
        end

        def present?
          search_field.present?
        end

        def wait_until_present(*args)
          search_field.wait_until_present(*args)
        end

        def show_all
          show(:stamps)
          show(:shipping_label_paper)
          show(:shipping_label_sdc1200)
          show(:shipping_label_5x8)
          show(:envelope_10)
          show(:envelope_9)
          show(:envelope_a9)
          show(:envelope_6)
          show(:envelope_a2)
          show(:envelope_7)
          show(:envelope_11)
          show(:envelope_12)
          show(:certified_mail_sdc3610)
          show(:certified_mail_sdc3710)
          show(:certified_mail_sdc3910)
          show(:certified_mail_sdc3930)
          show(:certified_mail_sdc3810)
          show(:certified_mail_sdc3830)
          show(:roll_4x6)
          show(:roll_418x614)
          save
        end

        def show(sym)
          case(sym)
            when :stamps
              search("Stamps").check
            when :shipping_label_paper
              search("Shipping Label - Paper").check
            when :shipping_label_sdc1200
              search("Shipping Label - SDC-1200").check
            when :shipping_label_5x8
              search("Shipping Label - 5x8").check
            when :envelope_9
              search("Envelope - 9").check
            when :envelope_10
              search("Envelope - 10").check
            when :envelope_a9
              search("Envelope - A9").check
            when :envelope_6
              search("Envelope - 6").check
            when :envelope_a2
              search("Envelope - A2").check
            when :envelope_7
              search("Envelope - 7").check
            when :envelope_11
              search("Envelope - 11").check
            when :envelope_12
              search("Envelope - 12").check
            when :certified_mail_sdc3610
              search("Certified Mail Label - SDC-3610").check
            when :certified_mail_sdc3710
              search("Certified Mail Label - SDC-3710").check
            when :certified_mail_sdc3910
              search("Certified Mail Label - SDC-3910").check
            when :certified_mail_sdc3930
              search("Certified Mail Label - SDC-3930").check
            when :certified_mail_sdc3810
              search("Certified Mail Label - SDC-3810").check
            when :certified_mail_sdc3830
              search("Certified Mail Label - SDC-3830").check
            when :roll_4x6
              search("Roll 4x6").check
            when :roll_418x614
              search("Roll 418x614").check
            else
              raise "Invalid print-on selection symbol: #{sym}"
          end
        end

        def search(str)
          search_field.set(mpo_search_str(str))
          30.times do
            sleep(0.05)
            break if browser.divs(css: "[class=x-grid-row-checker]").size == 1
          end
          search_result_count = browser.divs(css: "[class=x-grid-row-checker]").size
          expect(search_result_count).to eql(1), "Search Results yield more than 1. Got #{search_result_count}"

          clickable_field = browser.div(css: "[class=x-grid-row-checker]")
          verify = browser.div(css: "[class=x-grid-row-checker]").parent.parent.parent.parent.parent
          @search_result = Stamps::Browser::StampsCheckbox.new(clickable_field, verify, "class", "selected")
        end

        def save
          save_button.click_while_present
          sleep(1)
          expect(save_button.present?).to be(false), "Failed to save Manage Print Options, modal might still be open. Check your test."
        end

        def close
          close_button.click_while_present
          sleep(1)
          expect(close_button.present?).to be(false), "Failed to close Manage Print Options, modal might still be open. Check your test."
        end
      end

      module PrintOnTextbox
        def print_on_textbox
          if cache[:print_on_textbox].nil? || !cache[:print_on_textbox].present?
              cache[:print_on_textbox] = StampsTextbox.new(browser.text_field(css: "[name=PrintMedia]"))
          end
          cache[:print_on_textbox]
        end
      end

      class PrintOn < Browser::Base
        include PrintFormBlurOut
        include PrintMediaHelper
        include PrintOnTextbox



        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
              browser.div(css: "[id^=printmediadroplist][id$=trigger-picker]")) : cache[:dropdown]
        end

        def upgrade_plan
          (cache[:upgrade_plan].nil? || !cache[:upgrade_plan].present?) ? cache[:upgrade_plan] = UpgradePlan.new(param) : cache[:upgrade_plan]
        end

        def manage_printing_options_lov
          (cache[:manage_printing_options_lov].nil? || !cache[:manage_printing_options_lov].present?) ? cache[:manage_printing_options_lov] = StampsField.new(
              browser.li(text: 'Manage Printing Options...')) : cache[:manage_printing_options_lov]
        end

        def manage_printing_options
          (cache[:manage_printing_options].nil? || !cache[:manage_printing_options].present?) ? cache[:manage_printing_options] = ManagePrintOptionsModal.new(param) : cache[:manage_printing_options]
        end

        def present?
          print_on_textbox.present?
        end

        def wait_until_present(*args)
          print_on_textbox.wait_until_present(*args)
        end

        def manage_printing_options_modal
          # Open Mange Print Options modal
          begin
            10.times do
              break if manage_printing_options.present?
              dropdown.click unless manage_printing_options_lov.present?
              manage_printing_options_lov.click
              sleep(0.25)
            end
            expect(manage_printing_options).to be_present, "Unable to open Manage Printing Options modal"
          end unless manage_printing_options.present?
          manage_printing_options
        end

        def show_all_print_media
          dropdown.click unless manage_printing_options_lov.present?
          5.times do
            break if browser.lis(css: "li[class*=x-boundlist-item]").size == 20
          end
          manage_printing_options_modal.show_all if browser.lis(css: "li[class*=x-boundlist-item]").size < 20
        end

        def select_print_on(str)
          dropdown.wait_until_present(4)
          dropdown.click
          param.print_media = print_media(str)
          10.times do
            begin
              if print_on_textbox.text.include?(selected_sub_str(str))
                dropdown.click if manage_printing_options_lov.present?
                return param.print_media
              end
              selection = StampsField.new(browser.li(css: "li[class^=#{(data_for(:mail_print_media, {})[str]).split(',').first}][data-recordindex='#{(data_for(:mail_print_media, {})[str]).split(',').last}']"))
              dropdown.click unless manage_printing_options_lov.present?
              if selection.present?
                selection.scroll_into_view
                selection.click
              elsif manage_printing_options_lov.present? && !selection.present?
                show_all_print_media
              end
            rescue
              # ignore
            end
            sleep(0.15)
          end
          dropdown.click unless manage_printing_options_lov.present?
          nil
        end

        def tooltip(str)
          10.times do
            selection = StampsField.new(browser.div(text: str))
            dropdown.click unless selection.present?
            return selection.attribute_value "data-qtip" if selection.present?
          end
        end
      end

      class MailToCountry < Browser::Base
        include PrintFormBlurOut

        def dom_dd
          (cache[:dom_dd].nil? || !cache[:dom_dd].present?) ? cache[:dom_dd] = StampsTextbox.new(
              browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker")) : cache[:dom_dd]
        end

        def int_dd
          (cache[:int_dd].nil? || !cache[:int_dd].present?) ? cache[:int_dd] = StampsTextbox.new(
              browser.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div[id^=combo]>div>div>div[id$=trigger-picker]")) : cache[:int_dd]
        end

        def dom_textbox
          (cache[:dom_textbox].nil? || !cache[:dom_textbox].present?) ? cache[:dom_textbox] = StampsTextbox.new(
              browser.text_field(id: "sdc-mainpanel-matltocountrydroplist-inputEl")) : cache[:dom_textbox]
        end

        def int_textbox
          (cache[:int_textbox].nil? || !cache[:int_textbox].present?) ? cache[:int_textbox] = StampsTextbox.new(
              browser.inputs(name: "ShipCountryCode")[1]) : cache[:int_textbox]
        end

        def domestic?
          dom_dd.present? && dom_textbox.present?
        end

        def dropdown
          (domestic?) ? dom_dd : int_dd
        end

        def textbox
          (domestic?) ? dom_textbox : int_textbox
        end

        def select_country(str)
          begin
            dropdown.click
            selection = StampsField.new(browser.lis(text: str)[(domestic?) ? 0 : 1])
            30.times do
              begin
                dropdown.click unless selection.present?
                sleep(0.5)
                selection.scroll_into_view
                selection.click
                blur_out
                break if textbox.text == str
              rescue
                # ignore
              end
            end
          end unless textbox.text == str
          expect(textbox.text).to eql(str)
          blur_out
        end
      end

      class MailToInt < Browser::Base
        include PrintFormBlurOut



        def name
          (cache[:name].nil? || !cache[:name].present?) ? cache[:name] = StampsTextbox.new(
              browser.text_field(name: "ShipName")) : cache[:name]
        end

        def company
          (cache[:company].nil? || !cache[:company].present?) ? cache[:company] = StampsTextbox.new(
              browser.text_field(name: "ShipCompany")) : cache[:company]
        end

        def address_1
          (cache[:address_1].nil? || !cache[:address_1].present?) ? cache[:address_1] = StampsTextbox.new(
              browser.text_field(name: "ShipStreet1")) : cache[:address_1]
        end

        def address_2
          (cache[:address_2].nil? || !cache[:address_2].present?) ? cache[:address_2] = StampsTextbox.new(
              browser.text_field(name: "ShipStreet2")) : cache[:address_2]
        end

        def city
          (cache[:city].nil? || !cache[:city].present?) ? cache[:city] = StampsTextbox.new(
              browser.text_field(name: "ShipCity")) : cache[:city]
        end

        def province
          (cache[:province].nil? || !cache[:province].present?) ? cache[:province] = StampsTextbox.new(
              browser.text_field(name: "ShipState")) : cache[:province]
        end

        def postal_code
          (cache[:postal_code].nil? || !cache[:postal_code].present?) ? cache[:postal_code] = StampsTextbox.new(
              browser.text_field(name: "ShipPostalCode")) : cache[:postal_code]
        end

        def phone
          (cache[:phone].nil? || !cache[:phone].present?) ? cache[:phone] = StampsTextbox.new(
              browser.text_field(css: "[id=shiptoview-international-targetEl] [name=ShipPhone]")) : cache[:phone]
        end
      end

      module MailDomTextArea
        def textarea
          (cache[:textarea].nil? || !cache[:textarea].present?) ? cache[:textarea] = StampsTextbox.new(
              browser.textarea(id: "sdc-mainpanel-shiptotextarea-inputEl")) : cache[:textarea]
        end
      end

      class MailToDom < Browser::Base
        include MailDomTextArea
        include PrintFormBlurOut


        attr_reader :country

        def set(address)
          textarea.click
          textarea.set(address)
          textarea.click
          textarea.double_click
          textarea.click
          textarea.double_click
          blur_out
          blur_out
        end
      end

      class PrintFormEmail < Browser::Base
        include PrintFormBlurOut



        def email_textbox
          (cache[:email_textbox].nil? || !cache[:email_textbox].present?) ? cache[:email_textbox] = StampsTextbox.new(
              browser.text_field(id: "sdc-mainpanel-emailtextfield-webpostage-inputEl")) : cache[:email_textbox]
        end

        def email_checkbox
          (cache[:email_checkbox].nil? || !cache[:email_checkbox].present?) ? cache[:email_checkbox] = StampsField.new(
              browser.input(css: "input[id^='checkbox-'][id$='-inputEl'")) : cache[:email_checkbox]
        end
      end

      class PrintFormWeight < Browser::Base
        include PrintFormBlurOut



        def weigh
          (cache[:weigh].nil? || !cache[:weigh].present?) ? cache[:weigh] = StampsField.new(
              browser.span(text: "Weigh")) : cache[:weigh]
        end

        def auto_weigh
          (cache[:auto_weigh].nil? || !cache[:auto_weigh].present?) ? cache[:auto_weigh] = StampsCheckbox.new(
              browser.span(id: "div[class*=autoweight-checkbox]>div>div>span"),
              browser.div(id: "div[class*=autoweight-checkbox]>div>div:nth-child(2)"),
              "class",
              "checked") : cache[:auto_weigh]
        end

        def pounds
          (cache[:pounds].nil? || !cache[:pounds].present?) ? cache[:pounds] = StampsNumberField.new(
              browser.text_field(name: "WeightLbs"),
              browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-up]"),
              browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-down]")) : cache[:pounds]
        end

        def ounces
          (cache[:ounces].nil? || !cache[:ounces].present?) ? cache[:ounces] = StampsNumberField.new(
              browser.text_field(name: "WeightOz"),
              browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-up]"),
              browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-down]")) : cache[:ounces]
        end

        def present?
          pounds.present? && ounces.present?
        end
      end

      class PrintFormDimensions < Browser::Base


        def length
          (cache[:length].nil? || !cache[:length].present?) ? cache[:length] = StampsNumberField.new(
              browser.text_field(css: "[class*=sdc-mainpanel-lengthnumberfield]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(1) [id$=-trigger-spinner] [class*=up]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(1) [id$=-trigger-spinner] [class*=down]")) : cache[:length]
        end

        def width
          (cache[:width].nil? || !cache[:width].present?) ? cache[:width] = StampsNumberField.new(
              browser.text_field(css: "[class*=sdc-mainpanel-widthnumberfield]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(3) [id$=-trigger-spinner] [class*=up]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(3) [id$=-trigger-spinner] [class*=down]")) : cache[:width]
        end

        def height
          (cache[:height].nil? || !cache[:height].present?) ? cache[:height] = StampsNumberField.new(
              browser.text_field(css: "[class*=sdc-mainpanel-heightnumberfield]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(5) [id$=-trigger-spinner] [class*=up]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(5) [id$=-trigger-spinner] [class*=down]")) : cache[:height]
        end
      end

      class PrintFormMailFrom < Browser::Base
        include PrintFormBlurOut

        def textbox
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
              browser.text_field(id: "sdc-mainpanel-shipfromdroplist-inputEl")) : cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
              browser.div(id: "sdc-mainpanel-shipfromdroplist-trigger-picker")) : cache[:dropdown]
        end

        def manage_shipping_address
          (cache[:manage_shipping_address].nil? || !cache[:manage_shipping_address].present?) ? cache[:manage_shipping_address] = MailManageShippingAddresses.new(param) : cache[:manage_shipping_address]
        end

        def present?
          textbox.present?
        end

        def selection_field(str)
          if str.downcase.to_sym == :default
            (cache[:default].nil? || !cache[:default].present?) ? cache[:default] = StampsField.new(browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0]) : cache[:default]
          else
            (cache[str.to_sym].nil? || !cache[str.to_sym].present?) ? cache[str.to_sym] = StampsField.new(browser.li(text: /#{str}/)) : cache[str.to_sym]
          end
        end

        def select(str)
          dropdown.click
          if str.downcase.include?('manage shipping')
            10.times do
              begin
                selection_field(str).click
                return manage_shipping_address if manage_shipping_address.present?
                dropdown.click unless selection_field(str).present?
              rescue
                # ignore
              end
            end
          else
            10.times do
              selection_field(str).click
              return textbox.text if textbox.text.length > 0
              dropdown.click unless selection_field(str).present?
            end
          end
          nil
        end
      end

      class MailServiceSelection < Browser::Base
        #include ParameterHelper

        def cost_field(str)
          (cache[:cost_field].nil? || !cache[:cost_field].present?) ? cache[:cost_field] = StampsField.new(
              browser.td(css: "li[id='#{data_for(:mail_services, {})[str]}']>table>tbody>tr>td[class*=amount]")) : cache[:cost_field] #sdc-servicedroplist-fcletter
        end

        def service_field(str)
          (cache[:service_field].nil? || !cache[:service_field].present?) ? cache[:service_field] = StampsField.new(
              browser.td(css: "li[id='#{data_for(:mail_services, {})[str]}']>table>tbody>tr>td[class*=text]")) : cache[:service_field]
        end

        def cost_str(str)
          dollar_amount_str(cost_field(str).text)
        end

        def selection_is_numeric?(str)
          is_numeric?(cost_str(str))
        end

        def service_cost(str)
          (selection_is_numeric?) ? cost_field(str).text.to_f : 0
        end

        def has_rates?(str)
          !cost_field(str).text.include?('N/A')
        end
      end

      class PrintFormService < Browser::Base
        include PrintFormBlurOut



        def service_selection
          (cache[:service_selection].nil? || !cache[:service_selection].present?) ? cache[:service_selection] = MailServiceSelection.new(
              param) : cache[:service_selection]
        end

        def textbox
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
              browser.text_field(id: "sdc-mainpanel-servicedroplist-inputEl")) : cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
              browser.div(id: "sdc-mainpanel-servicedroplist-trigger-picker")) : cache[:dropdown]
        end

        def has_rates?
          case(param.print_media)
            when :certified_mail
              default_service = 'FCMI Package/Thick Envelope'
            when :label
              default_service = 'PM Flat Rate Envelope'
              default_int_service = 'PMI Flat Rate Envelope'
            when :envelope
              default_service = 'FCM Letter'
            when :roll
              default_service = 'PME Flat Rate Envelope'
              default_int_service = 'PMI Flat Rate Envelope'
            when :stamps
              default_service = 'FCM Letter'
            else
              #do nothing
          end
          15.times do
            if service_selection.service_field(default_service).present?
              return service_selection.has_rates?(default_service)
            elsif service_selection.service_field(default_int_service).present?
              return service_selection.has_rates?(default_int_service)
            else
              dropdown.click
            end
          end
          false
        end

        def service_cost(str)
          dropdown.wait_until_present(4)
          blur_out
          20.times do
            if service_selection.cost_field(str).present?
              service_selection.cost_field(str).scroll_into_view
              return service_selection.cost_field(str).text
            end
            dropdown.click
          end
          nil
        end

        def select_service(str)
          15.times do
            break if textbox.text.include?(str)
            dropdown.click unless service_selection.service_field(str).present?
            dropdown.wait_until_present(4)
            dropdown.click unless service_selection.service_field(str).present?
            service_selection.service_field(str).scroll_into_view
            service_selection.service_field(str).click
            blur_out
          end
          textbox.text
        end

        def cost(selection)
          cost_label = StampsField.new(browser.td(css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"))
          20.times do
            begin
              dropdown.click unless cost_label.present?
              if cost_label.present?
                service_cost = cost_label.text.dollar_amount_str.to_f.round(2)
                return service_cost
              end
            rescue
              # ignore
            end
          end
          blur_out
        end

        #todo-Rob rework tooltips
        def tooltip(selection)
          button = dropdown
          selection_label = StampsField.new browser.tr css: "tr[data-qtip*='#{selection}']"
          10.times {
            begin
              button.click unless selection_label.present?
              if selection_label.present?
                tooltip = selection_label.attribute_value "data-qtip"
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip
              end
            rescue
              # ignore
            end
          }
          blur_out
        end

        def price
          (cache[:price].nil? || !cache[:price].present?) ? cache[:price] = StampsField.new(
              browser.label(id: "sdc-mainpanel-servicepricelabel")) : cache[:price]
        end

      end

      class PrintFormInsureFor < Browser::Base
        include PrintFormBlurOut



        def price
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsField.new(
              browser.label(id: "sdc-mainpanel-insurancepricelabel")) : cache[:textbox]
        end

        def insure_for_amt
          (cache[:pounds].nil? || !cache[:pounds].present?) ? cache[:pounds] = StampsNumberField.new(
              browser.input(id: "sdc-mainpanel-insureamtnumberfield-inputEl"),
              browser.div(css: "div[id='sdc-mainpanel-insureamtnumberfield-trigger-spinner']>div[class*=spinner-up]"),
              browser.div(css: "div[id='sdc-mainpanel-insureamtnumberfield-trigger-spinner']>div[class*=spinner-down]")) : cache[:pounds]
        end

        def present?
          insure_for_amt.present? && insure_for_amt.present?
        end
      end

      class PrintFormTracking < Browser::Base
        include PrintFormBlurOut



        def textbox
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
              browser.text_field(id: "sdc-mainpanel-trackingdroplist-inputEl")) : cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
              browser.div(id: "sdc-mainpanel-trackingdroplist-trigger-picker")) : cache[:dropdown]
        end

        def selection_field(str)
          (cache[str.to_sym].nil? || !cache[str.to_sym].present?) ? cache[str.to_sym] = StampsField.new(
              browser.div(text: selection)) : cache[str.to_sym]
        end

        def select(str)
          10.times do
            begin
              dropdown.click unless selection_field(str).present?
              selection_field(str).scroll_into_view
              selection_field(str).click
              return selection_field(str) if textbox.text.include?(str)
            rescue
              # ignore
            end
          end
          nil
        end

        def price
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(
              browser.label(id: "sdc-mainpanel-trackingpricelabel")) : cache[:dropdown]
        end
      end

      class PrintFormCostCode < Browser::Base


        def textbox
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(browser.text_field(name: "costCodeId")) : cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(browser.div(css: "[id^=costcodesdroplist-][id$=-trigger-picker]")) : cache[:dropdown]
        end

        def select(selection)
          field = StampsField.new(browser.div(text: selection))
          10.times do
            begin
              dropdown.click unless field.present?
              field.scroll_into_view
              field.click
              return textbox.text if textbox.text.include?(selection)
            rescue
              # ignore
            end
          end
          textbox.text
        end
      end

      #todo-Rob reference http://jira.psisystems.local/browse/ORDERSAUTO-3460
      class PrintFormMailToLink < Browser::Base


        def link
          (cache[:link].nil? || !cache[:link].present?) ? cache[:link] = StampsField.new(browser.span(css: "[class*=sdc-mainpanel-shiptolinkbtn] [id$=btnInnerEl]")) : cache[:link]
        end

        def contacts_modal
          (cache[:contacts_modal].nil? || !cache[:contacts_modal].present?) ? cache[:contacts_modal] = MailSearchContactsModal.new(param) : cache[:contacts_modal]
        end

        def click
          30.times do
            return contacts_modal if contacts_modal.present?
            link.click
          end
          nil
        end
      end

      class PrintFormMailTo < Browser::Base
        include PrintFormBlurOut

        def mail_to_country
          (cache[:mail_to_country].nil? || !cache[:mail_to_country].present?) ? cache[:mail_to_country] = MailToCountry.new(param) : cache[:mail_to_country]
        end

        def mail_to_link
          (cache[:mail_to_link].nil? || !cache[:mail_to_link].present?) ? cache[:mail_to_link] = PrintFormMailToLink.new(param) : cache[:mail_to_link]
        end

        def dom_mail_address
          (cache[:dom_mail_address].nil? || !cache[:dom_mail_address].present?) ? cache[:dom_mail_address] = MailToDom.new(param) : cache[:dom_mail_address]
        end

        def int_mail_address
          (cache[:int_mail_address].nil? || !cache[:int_mail_address].present?) ? cache[:int_mail_address] = MailToInt.new(param) : cache[:int_mail_address]
        end

        def mail_address
          return dom_mail_address if mail_to_country.domestic?
          int_mail_address
        end

        def country(str)
          mail_to_country.select(str)
          mail_to_country.textbox.text
        end
      end

      class PrintFormCustoms < Browser::Base
        attr_reader :button, :customs_form

        def initialize(param)
          super
          @button = StampsField.new(browser.span(id: "sdc-mainpanel-editcustombtn-btnInnerEl"))
          @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
        end

        def edit_customs_form
          30.times do
            return customs_form if customs_form.present?
            button.scroll_into_view
            button.click
            sleep(0.2)
          end
          expect(customs_form).to be_present
        end

        def restrictions

        end

        def i_agree_to_insurance_terms
        end
      end
    end
  end
end