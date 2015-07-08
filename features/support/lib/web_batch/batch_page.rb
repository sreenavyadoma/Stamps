module Batch
  class BatchPage < BrowserObject
    public
    def navigation_bar
      NavigationBar.new(@browser)
    end

    def toolbar
      Toolbar.new(@browser)
    end

    protected
    def batch_helper
      BatchHelper.instance
    end

  end
end