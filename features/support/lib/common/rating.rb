module Stamps
  class Rating
    def spreadsheet
      @spreadsheet ||= SpreadSheet.new
    end
  end

  class SpreadSheet
    def source_file
      "#{data_for(:rates_test, {})['source_dir']}\\#{data_for(:rates_test, {})['rate_file']}"
    end

    def test_file
      "#{data_for(:rates_test, {})['test_dir']}\\#{data_for(:rates_test, {})['rate_file']}"
    end

    def update
      update_file unless updated?
      updated?
    end

    def updated?
      return false unless File.file?(test_file)
      FileUtils.compare_file(source_file, test_file)
    end

    def update_file
      begin
        FileUtils.copy_file(source_file, test_file)
        SdcLogger.debug "#{"-"*40}"
        SdcLogger.debug "Rate File was Updated"
        SdcLogger.debug "#{"-"*40}"
      rescue
        false
      end
      true
    end
  end
end
