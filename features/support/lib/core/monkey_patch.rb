class String
  def parse_orders_service
    /.+(?= \(.*\)$)/.match(self).to_s
  end

  # str=$34.68 returns 34.68
  def dollar_amount_str
    self.delete('$').delete(',')
  end
end
