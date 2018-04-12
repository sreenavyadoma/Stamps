module Stamps

  def user_credentials
    @user_credentials ||= StampsUserCredentials.new(mysql_conn)
    @user_credentials.test_scenario = SdcTest.test_scenario
    @user_credentials
  end

  def mysql_conn
    if @db_connection.nil?
      host = data_for(:database, {})['mysql']['host']
      username = data_for(:database, {})['mysql']['username']
      password = data_for(:database, {})['mysql']['password']
      @db_connection = Stamps::Database::MySql::Connection.new(host, username, password)
      @db_connection.connect
      @db_connection.select_db('stamps')
    end
    @db_connection
  end

  def sql_server
    if @sql_server.nil?
      server = data_for(:sql_server, {})['server']
      database = data_for(:sql_server, {})['database']
      port = data_for(:sql_server, {})['port']
      username = data_for(:sql_server, {})['username']
      password = data_for(:sql_server, {})['password']
      azure = data_for(:sql_server, {})['azure']
      @sql_server = Stamps::Database::SQLServer::Client.new(server, database, port, username, password, azure, SdcTest.log)
    end
    @sql_server
  end

end