class String
  def parse_orders_service
    /.+(?= \(.*\)$)/.match(self).to_s
  end
end
