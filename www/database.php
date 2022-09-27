<?php 
	abstract class Database
	{
		private static $serverName = "10.10.20.15";
		private static $username = "vagrant";
		private static $password = "vagrantpass";
		private static $dbName = "vagrant";
		private static $con = null;
		private function __construct()
		{

		}
		public static function getConnection(){
			if (self::$con != null) {
				self::$con;
			}
			else{self::$con = new mysqli(self::$serverName, self::$username, self::$password, self::$dbName);
				if (self::$con->connect_error) {
					die('Errore di connessione (' . self::$con->connect_errno . ') '
					. self::$con->connect_error);
				} 
			}
			return self::$con;
		}
	}
	$connection = Database::getConnection();
	echo "connesso";
?>