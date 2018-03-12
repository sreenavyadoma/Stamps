module Stamps




  #----------------------------------------------------------







  #----------------------------------------------------------
  # 

  def user_credentials
    @user_credentials ||= StampsUserCredentials.new(mysql_conn)
    @user_credentials.scenario_name = SdcEnv.scenario_name
    @user_credentials
  end

  def mysql_conn
    if @db_connection.nil?
      host = data_for(:database, {})['mysql']['host']
      username = data_for(:database, {})['mysql']['username']
      password = data_for(:database, {})['mysql']['password']
      @db_connection = Stamps::Database::MySql::Connection.new(host, username, password, SdcTest.log)
      @db_connection.connect
      @db_connection.select_db('stamps')
    end
    @db_connection
  end




end