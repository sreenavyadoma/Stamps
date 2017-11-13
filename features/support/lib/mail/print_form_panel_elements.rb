module Stamps
  module Mail
    module PrintFormPanel

      class UpgradePlan < Browser::StampsModal
        attr_reader :window_title, :close_btn, :upgrade_now_btn, :not_yet_btn, :paragraph_field

        def initialize(param)
          super
          @window_title=StampsField.new(browser.div(text: "Upgrade Plan"))
          @close_btn=StampsField.new(browser.img(text: "img[class*=close]"))
          @upgrade_now_btn=StampsField.new(browser.span(text: "Upgrade Now"))
          @not_yet_btn=StampsField.new(browser.span(text: "Not Yet"))
          @paragraph_field=StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]"))
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
              return :certified_mails
            when /Certified Mail Label - SDC-3710/
              return :certified_mails
            when /Certified Mail Label - SDC-3910/
              return :certified_mails_3910_3930
            when /Certified Mail Label - SDC-3930/
              return :certified_mails_3910_3930
            when /Certified Mail Label - SDC-3810/
              return :certified_mails_3810
            when /Certified Mail Label - SDC-3830/
              return :certified_mails_3830
            when /Shipping Label/
              return :labels
            when /Envelope/
              return :envelopes
            when /Roll/
              return :rolls
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
              return 'Certified Mail Label - Stamps.com SDC-3610'
            when /Certified Mail Label - SDC-3710/
              return 'Certified Mail Label - Stamps.com SDC-3710'
            when /Certified Mail Label - SDC-3910/
              return 'Certified Mail Label - Stamps.com SDC-3910'
            when /Certified Mail Label - SDC-3930/
              return 'Certified Mail Label - Stamps.com SDC-3930'
            when /Certified Mail Label - SDC-3810/
              return 'Certified Mail #11 Envelope - Stamps.com SDC-3810'
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

      class ManagePrintOptionsModal < Browser::StampsModal
        include PrintMediaHelper
        def search_field
          (cache[:search_field].nil?||!cache[:search_field].present?)?cache[:search_field]=StampsTextbox.new(browser.text_field(css: "[placeholder='Search']")):cache[:search_field]
        end

        def save_button
          (cache[:save_button].nil?||!cache[:save_button].present?)?cache[:save_button]=StampsField.new(browser.span(text: "Save")):cache[:save_button]
        end

        def close_button
          (cache[:close_button].nil?||!cache[:close_button].present?)?cache[:close_button]=StampsField.new(browser.img(class: "x-tool-img x-tool-close")):cache[:close_button]
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
            break if browser.divs(css: "[class=x-grid-row-checker]").size==1
          end
          search_result_count=browser.divs(css: "[class=x-grid-row-checker]").size
          expect(search_result_count).to eql(1), "Search Results yield more than 1. Got #{search_result_count}"

          clickable_field=browser.div(css: "[class=x-grid-row-checker]")
          verify=browser.div(css: "[class=x-grid-row-checker]").parent.parent.parent.parent.parent
          @search_result=Stamps::Browser::StampsCheckbox.new(clickable_field, verify, "class", "selected")
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

      class PrintOn < Browser::StampsModal
        include PrintFormBlurOut
        include PrintMediaHelper
        def textbox
          (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsTextbox.new(browser.text_field(css: "[name=PrintMedia]")):cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsField.new(browser.div(css: "[id^=printmediadroplist][id$=trigger-picker]")):cache[:dropdown]
        end

        def upgrade_plan
          (cache[:upgrade_plan].nil?||!cache[:upgrade_plan].present?)?cache[:upgrade_plan]=UpgradePlan.new(param):cache[:upgrade_plan]
        end

        def manage_printing_options_lov
          (cache[:manage_printing_options_lov].nil?||!cache[:manage_printing_options_lov].present?)?cache[:manage_printing_options_lov]=StampsField.new(browser.li(text: 'Manage Printing Options...')):cache[:manage_printing_options_lov]
        end

        def manage_printing_options
          (cache[:manage_printing_options].nil?||!cache[:manage_printing_options].present?)?cache[:manage_printing_options]=ManagePrintOptionsModal.new(param):cache[:manage_printing_options]
        end

        def present?
          textbox.present?
        end

        def wait_until_present(*args)
          textbox.wait_until_present(*args)
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
            break if browser.lis(css: "li[class*=x-boundlist-item]").size==20
          end
          manage_printing_options_modal.show_all if browser.lis(css: "li[class*=x-boundlist-item]").size < 20
        end

        def select_print_on(str)
          dropdown.wait_until_present(4)
          dropdown.click
          param.print_media=print_media(str)
          selected_sub_str=selected_sub_str(str)
          mpo_search_str=mpo_search_str(str)

          10.times do
            begin
              if textbox.text.include?(selected_sub_str)
                dropdown.click if manage_printing_options_lov.present?
                return param.print_media
              end

              selection=StampsField.new(browser.li(css: "li[class^=#{(data_for(:mail_print_media, {})[str]).split(',').first}][data-recordindex='#{(data_for(:mail_print_media, {})[str]).split(',').last}']"))
              dropdown.click unless manage_printing_options_lov.present?
              if selection.present?
                selection.scroll_into_view
                selection.click
                selection.click
              elsif manage_printing_options_lov.present? && !selection.present?
                show_all_print_media
              end
            rescue
              #ignore
            end
            sleep(0.15)
          end
          dropdown.click unless manage_printing_options_lov.present?
          expect(textbox.text).to include(selected_sub_str), "Print On media selection failed. Expected textbox.text to include #{selected_sub_str}, got \"#{textbox.text}\""
        end

        def tooltip(str)
          10.times do
            selection=StampsField.new(browser.div(text: str))
            dropdown.click unless selection.present?
            return selection.attribute_value "data-qtip" if selection.present?
          end
        end
      end

      class MailToCountry < Browser::StampsModal
        include PrintFormBlurOut
        def dom_dd
          (cache[:dom_dd].nil?||!cache[:dom_dd].present?)?cache[:dom_dd]=StampsTextbox.new(browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker")):cache[:dom_dd]
        end

        def int_dd
          (cache[:int_dd].nil?||!cache[:int_dd].present?)?cache[:int_dd]=StampsTextbox.new(browser.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div[id^=combo]>div>div>div[id$=trigger-picker]")):cache[:int_dd]
        end

        def dom_textbox
          (cache[:dom_textbox].nil?||!cache[:dom_textbox].present?)?cache[:dom_textbox]=StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-matltocountrydroplist-inputEl")):cache[:dom_textbox]
        end

        def int_textbox
          (cache[:int_textbox].nil?||!cache[:int_textbox].present?)?cache[:int_textbox]=StampsTextbox.new(browser.inputs(name: "ShipCountryCode")[1]):cache[:int_textbox]
        end

        def domestic?
          30.times do
            return true if dom_dd.present?
            sleep(0.1)
            return false if int_dd.present?
            sleep(0.1)
          end
          raise "Unable to determine if MailToCountry is domestic or international"
        end

        def dropdown
          (cache[:dropdown].nil?||!cache[:dropdown].present?)?(cache[:dropdown]=((domestic?)? dom_dd : int_dd)):cache[:dropdown]
        end

        def textbox
          (cache[:upgrade_plan].nil?||!cache[:upgrade_plan].present?)?cache[:upgrade_plan]=((domestic?)? dom_textbox : int_textbox):cache[:upgrade_plan]
        end

        def select(str)
          begin
            dropdown.click
            selection=StampsField.new(browser.lis(text: str)[(domestic?)?0:1])
            30.times do
              begin
                dropdown.click unless selection.present?
                sleep(0.5)
                selection.scroll_into_view
                selection.click
                blur_out
                break if textbox.text==str
              rescue
                #ignore
              end
            end
          end unless textbox.text==str
          expect(textbox.text).to eql(str)
          blur_out
        end
      end

      class MailToInt < Browser::StampsModal
        include PrintFormBlurOut
        def name
          (cache[:name].nil?||!cache[:name].present?)?cache[:name]=StampsTextbox.new(browser.text_field(name: "ShipName")):cache[:name]
        end

        def company
          (cache[:company].nil?||!cache[:company].present?)?cache[:company]=StampsTextbox.new(browser.text_field(name: "ShipCompany")):cache[:company]
        end

        def address_1
          (cache[:address_1].nil?||!cache[:address_1].present?)?cache[:address_1]=StampsTextbox.new(browser.text_field(name: "ShipStreet1")):cache[:address_1]
        end

        def address_2
          (cache[:address_2].nil?||!cache[:address_2].present?)?cache[:address_2]=StampsTextbox.new(browser.text_field(name: "ShipStreet2")):cache[:address_2]
        end

        def city
          (cache[:city].nil?||!cache[:city].present?)?cache[:city]=StampsTextbox.new(browser.text_field(name: "ShipCity")):cache[:city]
        end

        def province
          (cache[:province].nil?||!cache[:province].present?)?cache[:province]=StampsTextbox.new(browser.text_field(name: "ShipState")):cache[:province]
        end

        def postal_code
          (cache[:postal_code].nil?||!cache[:postal_code].present?)?cache[:postal_code]=StampsTextbox.new(browser.text_field(name: "ShipPostalCode")):cache[:postal_code]
        end

        def phone
          (cache[:phone].nil?||!cache[:phone].present?)?cache[:phone]=StampsTextbox.new(browser.text_field(css: "[id=shiptoview-international-targetEl] [name=ShipPhone]")):cache[:phone]
        end
      end

      module MailDomTextArea
        def textarea
          (cache[:textarea].nil?||!cache[:textarea].present?)?cache[:textarea]=StampsTextbox.new(browser.textarea(id: "sdc-mainpanel-shiptotextarea-inputEl")):cache[:textarea]
        end
      end

      class MailToDom < Browser::StampsModal
        include MailDomTextArea
        attr_reader :country
        include PrintFormBlurOut

        def set(address)
          textarea.click
          textarea.set(address)
          textarea.click
          textarea.double_click
          textarea.click
          textarea.double_click
          blur_out
          blur_out
          blur_out
        end
      end

      class PrintFormEmail < Browser::StampsModal
      end

      class PrintFormWeight < Browser::StampsModal
        include PrintFormBlurOut
        def auto_weigh
          (cache[:auto_weigh].nil?||!cache[:auto_weigh].present?)?cache[:auto_weigh]=StampsCheckbox.new(
              browser.input(id: "div[class*=autoweight-checkbox]>div>div>input[id^=checkbox]"),
              browser.table(id: "sdc-mainpanel-autoweightcheckbox"),
              "class",
              "checked"):cache[:auto_weigh]
        end

        def mail_pounds
          (cache[:mail_pounds].nil?||!cache[:mail_pounds].present?)?cache[:mail_pounds]=StampsNumberField.new(
              browser.text_field(name: "WeightLbs"),
              browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-up]"),
              browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-down]")):cache[:mail_pounds]
        end

        def mail_ounces
          (cache[:mail_ounces].nil?||!cache[:mail_ounces].present?)?cache[:mail_ounces]=StampsNumberField.new(
              browser.text_field(name: "WeightOz"),
              browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-up]"),
              browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-down]")):cache[:mail_ounces]
        end

        def present?
          mail_pounds.present? && mail_ounces.present?
        end
      end

      class PrintFormDimensions < Browser::StampsModal
        def length
          (cache[:length].nil?||!cache[:length].present?)?cache[:length]=StampsNumberField.new(
              browser.text_field(css: "[class*=sdc-mainpanel-lengthnumberfield]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(1) [id$=-trigger-spinner] [class*=up]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(1) [id$=-trigger-spinner] [class*=down]")):cache[:length]
        end

        def width
          (cache[:width].nil?||!cache[:width].present?)?cache[:width]=StampsNumberField.new(
              browser.text_field(css: "[class*=sdc-mainpanel-widthnumberfield]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(3) [id$=-trigger-spinner] [class*=up]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(3) [id$=-trigger-spinner] [class*=down]")):cache[:width]
        end

        def height
          (cache[:height].nil?||!cache[:height].present?)?cache[:height]=StampsNumberField.new(
              browser.text_field(css: "[class*=sdc-mainpanel-heightnumberfield]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(5) [id$=-trigger-spinner] [class*=up]"),
              browser.div(css: "[id^=dimensionsview-][id$=-targetEl]>div>div>div>div:nth-child(5) [id$=-trigger-spinner] [class*=down]")):cache[:height]
        end
      end

      class PrintFormMailFrom < Browser::StampsModal
        include PrintFormBlurOut
        def textbox
          (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-shipfromdroplist-inputEl")):cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsField.new(browser.div(id: "sdc-mainpanel-shipfromdroplist-trigger-picker")):cache[:dropdown]
        end


        def manage_shipping_address
          (cache[:manage_shipping_address].nil?||!cache[:manage_shipping_address].present?)?cache[:manage_shipping_address]=MailManageShippingAddresses.new(param):cache[:manage_shipping_address]
        end

        def present?
          textbox.present?
        end

        def selection_field(str)
          if str.downcase.include?('default')
            selection=StampsField.new(browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0])
          else
            # verify str is in Ship-From drop-down list of values
            lovs=[]
            browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*='x-boundlist-item']").each_with_index { |field, index| lovs[index]=field.text }
            expect(lovs).to include(/#{str}/), "Ship From drop-down list of values: #{lovs} does not include #{str}"
            selection=StampsField.new(browser.li(text: /#{str}/))
          end
          StampsField.new(selection)
        end

        def select(str)
          dropdown.click
          if str.downcase.include? "manage shipping"
            10.times do
              begin
                selection=selection_field(str)
                selection.click
                return manage_shipping_address if manage_shipping_address.present?
                dropdown.click unless selection.present?
              rescue
                #ignore
              end
            end
          else
            10.times do
              selection=selection_field(str)
              selection.click
              break if textbox.text.length > 0
              dropdown.click unless selection.present?
            end
          end
        end
      end

      class MailServiceSelection < Browser::StampsModal
        include ParameterHelper
        attr_accessor :browser, :service_str, :service_field, :cost_field

        def service(str)
          @service_str=str
          @service_field=StampsField.new(browser.td(css: "li[id='#{data_for(:mail_services, {})[service_str]}']>table>tbody>tr>td[class*=text]"))
          @cost_field=StampsField.new(browser.td(css: "li[id='#{data_for(:mail_services, {})[service_str]}']>table>tbody>tr>td[class*=amount]"))
          self
        end

        def cost_str
          dollar_amount_str(cost_field.text)
        end

        def selection_is_numeric?
          is_numeric?(cost_str)
        end

        def service_cost
          (selection_is_numeric?)?cost_field.text.to_f: 0
        end
      end

      class PrintFormService < Browser::StampsModal
        attr_reader :textbox, :dropdown, :service_selection
        include PrintFormBlurOut

        def initialize(param)
          super
          @textbox=StampsTextbox.new browser.text_field(id: "sdc-mainpanel-servicedroplist-inputEl")
          @dropdown=StampsField.new browser.div(id: "sdc-mainpanel-servicedroplist-trigger-picker")
          @service_selection=MailServiceSelection.new(param)
        end

        def has_rates?
          case(param.print_media)
            when :certified_mails
              default_service='FCMI Package'
            when :labels
              default_service='PM Flat Rate Envelope'
              default_int_service='PMI Flat Rate Envelope'
            when :envelopes
              default_service='FCM Letter'
            when :rolls
              default_service='PME Flat Rate Envelope'
              default_int_service='PMI Flat Rate Envelope'
            when :stamps
              default_service='FCM Letter'
            else
              #do nothing
          end
          has_rates=false
          5.times do
            if service_selection.service(default_service).service_field.present?||service_selection.service(default_int_service).service_field.present?
              has_rates=service_selection.service(default_service).selection_is_numeric?||service_selection.service(default_int_service).selection_is_numeric?
              dropdown.click if service_selection.service(default_service).service_field.present?||service_selection.service(default_int_service).service_field.present?
              break
            else
              dropdown.click
            end
          end
          has_rates
        end

        def select(str)
          logger.info "Select service #{str}"
          service_selection.service(str)
          service_field=service_selection.service_field
          15.times do
            break if (textbox.text).include?(str)
            dropdown.click unless service_field.present?
            begin
              dropdown.click
              browser.refresh
            end unless service_selection.selection_is_numeric?
            sleep(2)
            dropdown.wait_until_present(4)
            blur_out
            dropdown.click unless service_field.present?
            service_field.scroll_into_view
            service_field.click
            blur_out
          end
          dropdown.click unless service_field.present?



          if service_field.present?
            specify_field=browser.span(id: 'sdc-mainpanel-specifypostageradio-displayEl')
            specify_verify_field=browser.div(id: 'sdc-mainpanel-specifypostageradio')
            specify_postage_amount=StampsRadio.new(specify_field, specify_verify_field, "class", "checked")
            if !specify_postage_amount.selected?
              expect(service_selection.cost_str).to include("."), "Unable to get rates for Mail Service #{str} selection in #{param.test_env.upcase}.  #{param.test_env.upcase} might be having rating problems. Got rate #{service_selection.cost_str}"
              dropdown.click
            end
          end
          expect(textbox.text).to include(str), "Unable to select Mail Service #{str}. Expected Service textbox to contain #{str}, got #{textbox.text}"
          logger.info "#{textbox.text} service selected."
          textbox.text
        end

        def cost(selection)
          cost_label=StampsField.new browser.td css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"
          20.times do
            begin
              dropdown.click unless cost_label.present?
              if cost_label.present?
                service_cost=test_helper.dollar_amount_str(cost_label.text).to_f.round(2)
                logger.info "Service Cost for \"#{selection}\" is #{service_cost}"
                return service_cost
              end
            rescue
              #ignore
            end
          end
          blur_out
        end

        def tooltip(selection)
          button=dropdown
          selection_label=StampsField.new browser.tr css: "tr[data-qtip*='#{selection}']"
          10.times {
            begin
              button.click unless selection_label.present?
              if selection_label.present?
                tooltip=selection_label.attribute_value "data-qtip"
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def price
          StampsField.new(browser.label(id: "sdc-mainpanel-servicepricelabel"))
        end

      end

      class StampAmount < Browser::StampsModal
        def textbox
          StampsTextbox.new(browser.text_field name: "stampAmount")
        end

        def set(value)
          text_field=textbox
          text_field.set(value)
          logger.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button=StampsField.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button=StampsField.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
          value.to_i.times do
            button.click
          end
        end
      end

      class PrintFormEmail < Browser::StampsModal
        attr_reader :checkbox, :textbox
        def initialize(param)
          super
          @checkbox=StampsCheckbox.new browser.input(id: "sdc-mainpanel-emailcheckbox-inputEl"), browser.table(id: "sdc-mainpanel-emailcheckbox"), "class", "checked"
          @textbox=StampsTextbox.new browser.text_field(id: "sdc-mainpanel-emailtextfield-inputEl")
        end

        def set(value)
          checkbox.check
          textbox.set(value)
        end
      end

      class MailTracking < Browser::StampsModal

        def textbox
          StampsTextbox.new browser.text_field name: "tracking"
        end

        def dropdown
          StampsField.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[7])
        end

        def select(selection)
          logger.info "Select Tracking #{selection}"
          box=textbox
          button=dropdown
          selection_label=StampsField.new browser.div text: selection
          10.times {
            begin
              button.click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.click
              selected_tracking=box.text
              logger.info "Selected Tracking #{selected_tracking} - #{(selected_tracking.include? selection)?"done": "tracking not selected"}"
              break if selected_tracking.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Tracking selected: #{selection}"
          selection_label
        end

        def price
          StampsField.new browser.label id: "sdc-mainpanel-trackingpricelabel"
        end
      end

      class PrintFormInsureFor < Browser::StampsModal
        def checkbox

        end

        def textbox
          StampsTextbox.new browser.text_field id: "sdc-mainpanel-insureamtnumberfield-inputEl"
        end

        def increment value

        end

        def decrement value

        end

        def price
          StampsField.new browser.label id: "sdc-mainpanel-insurancepricelabel"
        end
      end

      class PrintFormCostCode < Browser::StampsModal
        def textbox
          StampsTextbox.new browser.text_field name: "costCodeId"
        end

        def dropdown
          buttons=browser.divs css: "div[class*=x-form-arrow-trigger]"
          button=StampsField.new(buttons.last)
        end

        def select(selection)
          logger.info "Select Cost Code #{selection}"

          box=textbox
          button=dropdown
          selection_label=StampsField.new browser.div text: selection
          sleep(0.35)
          10.times {
            begin
              button.click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.click
              selected_cost_code=box.text
              logger.info "Selected Cost Code #{selected_cost_code} - #{(selected_cost_code.include? selection)?"done": "cost code not selected"}"
              break if selected_cost_code.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Origin Country selected: #{selection}"
          selection_label
        end

      end

      class PrintFormQuantity < Browser::StampsModal
        def textbox
          StampsTextbox.new(browser.text_field css: "input[class*='sdc-previewpanel-quantitynumberfield']")
        end

        def set(value)
          text_field=textbox
          text_field.set(value)
          logger.info "Quantity set to #{text_field.text}"
        end

        def increment value
          button=StampsField.new(browser.divs(css: "div[class*=x-form-spinner-up]")[7])
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button=StampsField.new(browser.divs(css: "div[class*=x-form-spinner-down]")[7])
          value.to_i.times do
            button.click
          end
        end
      end

      class PrintFormMailToLink < Browser::StampsModal
        attr_accessor :link, :contacts_modal

        def initialize(param)
          super
          @link=StampsField.new(browser.span(css: "label[class*=sdc-mainpanel-shiptolinkbtn]>span>span>span[id$=btnInnerEl]"))
          @contacts_modal=MailSearchContactsModal.new(param)
        end

        def click
          15.times do
            sleep(0.35)
            return contacts_modal if contacts_modal.present?
            link.click
          end
          expect(contacts_modal).to be_present
        end
      end

      class PrintFormMailTo < Browser::StampsModal
        attr_reader :mail_to_link, :mail_to_country
        include PrintFormBlurOut

        def initialize(param)
          super
          @mail_to_country=MailToCountry.new(param)
          @mail_to_link=PrintFormMailToLink.new(param)
        end

        def address
          blur_out
          if mail_to_country.domestic?
            @address=MailToDom.new(param)
          else
            @address=MailToInt.new(param)
          end
        end

        def country(str)
          expect(mail_to_country).to be_present
          blur_out
          mail_to_country.select(str)
          address
        end
      end

      class PrintFormCustoms < Browser::StampsModal
        attr_reader :button, :customs_form

        def initialize(param)
          super
          @button=StampsField.new(browser.span(id: "sdc-mainpanel-editcustombtn-btnInnerEl"))
          @customs_form=Stamps::Common::Customs::CustomsInformation.new(param)
        end

        def edit_form
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