module Batch
  class MultiOrder < BatchPage
    private
    def order_count_label
      ps = @browser.ps :css => 'b'
      p = ps.last
      present = p.present?
      p
    end

    public
    def order_count
      raise "" unless browser_helper.field_present? order_count_label
      text = browser_helper.text order_count_label
      text = text.gsub(/\d+/).first
      text
    end

  end
end