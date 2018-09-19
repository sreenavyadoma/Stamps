Class.class_eval do
  def sdc_accessor(name)
    delegate_to_class name
    singleton_class.instance_eval do
      attr_accessor name
    end
  end

  def delegate_to_class(name)
    define_method name do |*args, &block|
      self.class.send name, *args, &block
    end
  end
end

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
  # str=$34.68 returns 34.68 | str = "Total: $123.3" -> "123.3"
  #   "Order #1516802121794" returns 1516802121794
  # 'Total: $8,245.01' returns 8245.01
  def parse_digits
    /\d+[.\d+]*/.match(self.gsub(',','')).to_s
  end

  def alpha_numeric
    self.gsub(/[^0-9A-Za-z]/, '')
  end
end
