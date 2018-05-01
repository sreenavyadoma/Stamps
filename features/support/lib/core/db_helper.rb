module Stamps
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