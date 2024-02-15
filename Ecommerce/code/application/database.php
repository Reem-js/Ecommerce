<?php
// 1-database connection
// 2-run query on DB
// 3-DML(insert , update , delete ) return true or false 
//4-DQL(selects) return array of data , or empty array

//وبستخدم FUN MYSQLI() :عشان اقدر اكسس داتا بيزمحتاجة 
// name of database
// username 
// password
// host (server )
//
class database
{
    private $dbname = 'e-commerce';
    private $dbpassword = '';
    private $dbusername = 'root';
    private $dbhost = 'localhost';
    private $mysqli;


    function __construct()
    {
        $this->mysqli = new mysqli($this->dbhost, $this->dbusername, $this->dbpassword, $this->dbname);
        
        // mysqli error-connect returns string which show the error in connection
        // or null if is no error 
        //
        
        if ( $this->mysqli->connect_error) {
            die("connection failed :  $this->mysqli->connect_error");
        } else {
         
        }
    }
    public function runDML($query){
        $result=$this->mysqli->query($query);
    if($result){
        return true ;

    }else{
        return false ;
    }

    }

    public function runDQL($query){

    $result=$this->mysqli->query($query);

    if( $result->num_rows > 0){
        return  $result ;

    }else{
        return [];
    }

    }
}



