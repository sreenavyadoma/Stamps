module DatabaseHelper
  def db_connection
    if @db_connection.nil?
      @db_connection = Stamps::Database::MySql::StampsMySqlConnection.new(data_for(:database, {})['mysql']['host'], data_for(:database, {})['mysql']['username'], data_for(:database, {})['mysql']['password'],test_config.logger)
      @db_connection.connect
      @db_connection.select_db('stamps')
    end
    @db_connection
  end
end


