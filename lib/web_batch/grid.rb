module Batch
  #
  # Orders Grid
  #
  class Grid < BatchPage
    include GridCommon

    public
    def ship_cost(order_id)
      value = grid_text(:ship_cost, row_number(order_id))
      arr = value.scan(/[^$]*$/)
      arr[0]
    end

    def age(order_id)
      grid_text(:age, row_number(order_id))
    end

    def order_date(order_id)
      grid_text(:order_date, row_number(order_id))
    end

    def recipient(order_id)
      grid_text(:recipient, row_number(order_id))
    end

    def company(order_id)
      grid_text(:company, row_number(order_id))
    end

    def street_address(order_id)
      grid_text(:street_address, row_number(order_id))
    end

    def city(order_id)
      grid_text(:city, row_number(order_id))
    end

    def state(order_id)
      grid_text(:state, row_number(order_id))
    end

    def zip(order_id)
      grid_text(:zip, row_number(order_id))
    end

    def phone(order_id)
      grid_text(:phone, row_number(order_id))
    end

    def email(order_id)
      grid_text(:email, row_number(order_id))
    end

    def qty(order_id)
      grid_text(:qty, row_number(order_id))
    end

    def item_sku(order_id)
      grid_text(:item_sku, row_number(order_id))
    end

    def item_name(order_id)
      grid_text(:item_name, row_number(order_id))
    end

    def ship_from(order_id)
      grid_text(:ship_from, row_number(order_id))
    end

    def service(order_id)
      grid_text(:service, row_number(order_id))
    end

    def weight(order_id)
      grid_text(:weight, row_number(order_id))
    end

    # 5 lbs. 10 oz.
    def pounds(order_id)
      weight(order_id).scan(/\d+ lbs./).first.scan(/\d/).first
    end

    def ounces(order_id)
      weight(order_id).scan(/\d+ oz./).first.scan(/\d/).first
    end

    def reference_no(order_id)
      grid_text(:reference_no, row_number(order_id))
    end

    def cost_code(order_id)
      grid_text(:cost_code, row_number(order_id))
    end

    def order_status(order_id)
      grid_text(:order_status, row_number(order_id))
    end

    def ship_date(order_id)
      grid_text(:ship_date, row_number(order_id))
    end

    def tracking_number(order_id)
      grid_text(:tracking_number, row_number(order_id))
    end

    def order_total(order_id)
      grid_text(:order_total, row_number(order_id))
    end

    def insured_value(order_id)
      grid_text(:insured_value, row_number(order_id)).gsub('$', '')
    end

    def list_all_fields(order_id)
      GRID_COLUMNS.keys.each {|key| send(key, row_number(order_id))}
    end

  end

end