module SdcMail
  class SdcManagePrintOptions < SdcPage
    page_object(:search, tag: :text_field) { {xpath: ''} }
    page_object(:save) { {xpath: ''} }
    page_object(:close) { {xpath: ''} }
    page_object(:xxxxx) { {xpath: ''} }
    page_object(:xxxxx) { {xpath: ''} }
    page_object(:xxxxx) { {xpath: ''} }

    page_object(:chooser) { {xpath: ''} }
    page_object(:verify) { {xpath: ''} }
    chooser(:result_checkbox, :chooser, :verify,'class', 'selected' )


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
      search_field.set(PrintMediaHelper.mpo_search_str(str))
      30.times do
        sleep(0.05)
        break if driver.divs(css: "[class=x-grid-row-checker]").size == 1
      end
      search_result_count = driver.divs(css: "[class=x-grid-row-checker]").size
      expect(search_result_count).to eql(1), "Search Results yield more than 1. Got #{search_result_count}"

      clickable_field = driver.div(css: "[class=x-grid-row-checker]")
      verify = driver.div(css: "[class=x-grid-row-checker]").parent.parent.parent.parent.parent
      @search_result = Stamps::WebApps::StampsCheckbox.new(clickable_field, verify, 'class', "selected")
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

  module SdcMailFloatingModals
    def manage_print_options
      SdcManagePrintOptions.new
    end

  end
end