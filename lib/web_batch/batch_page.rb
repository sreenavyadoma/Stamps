module Batch
  # require_relative 'toolbar'
  # require_relative '../common/stamps'
  # require_relative 'parameter_helper'

  class BatchPage < Stamps::Page
    include NavigationBar
    include Toolbar

    protected
    def helper
      ParameterHelper.instance #todo refactor to BatchHelper
    end
  end
end