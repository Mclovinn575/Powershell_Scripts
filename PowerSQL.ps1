# This requires that you have SimplySQL for Powershell && MySQL on the system.                                                                                                                                                                                                                                                                                                                                                    # Open mysql connection
$isConnected = test-sqlconnection                                                                                                                                                                                                                                                                                                                                                                                                 # Check to see if users already have an Open DB connection
if(!$isConnected){
    write-host "Unauthenticated, please provide credentials:"
    $credentials = Get-Credential
    open-MySqlConnection -Server localhost -Database testdb -Credential $credentials
    write-host "Connection Successful."
}else{
    "AUTHENTICATED. Proceeding..."
}                                                                                                                                                                                                                                                                                                                                                                                                                                 # Change the database name as needed
invoke-SqlQuery -Query "select * from users"
