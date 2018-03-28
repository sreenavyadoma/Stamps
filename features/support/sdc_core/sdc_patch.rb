Object.class_eval do
  ##
  # set_instance_variables(binding, *local_variables)
  def set_instance_variables(binding, *variables)
    variables.each do |var|
      instance_variable_set(:"@#{var}", eval(var.to_s, binding))
    end
  end
end

String.class_eval do
  ##
  # Strips garbage proceeding service selection.
  # "PMI Flat Rate Envelope (6 - 10 Days)".parse_service_name returns 'PMI Flat Rate Envelope'
  def parse_service_name
    /.+(?= \(.*\)$)/.match(self).to_s
  end

  ##
  # "PMI Flat Rate Envelope (6 - 10 Days)".parse_service_name returns '(6 - 10 Days)'
  def parse_service_delivery_days
    /\((.+)\)/.match(self).to_s
  end

  ##
  # str=$34.68 returns 34.68
  def dollar_amount_str
    self.delete('$').delete(',')
  end

  ##
  # Extracts numbers from string.
  #   "Order #1516802121794".extract_numbers returns 1516802121794
  def extract_numbers
    /\d+/.match(self).to_s
  end
end
