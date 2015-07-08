module Batch
  class PrintingError < StandardError
    attr_reader :object

    def initialize(object)
      @object = object
    end
  end
end