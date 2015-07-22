module Batch
  class BatchPage < BrowserObject
    public
    def navigation_bar
      @navigation ||= NavigationBar.new(@browser)
    end

    def toolbar
      @toolbar ||= Toolbar.new(@browser)
    end

    protected
    def batch_helper
      BatchHelper.instance
    end

  end
end