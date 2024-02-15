
<?php 

include_once "database.php";
include_once "databaseOperation.php";

class User extends database implements operation {

private $id;
private $name;
private $password;
private $phone;
private $email;
private $photo;
private $code;
private $status;
private $gender;
private $created_at;
private $updated_at;


    //////// getters
    public function getid()
    {
        return $this->id;
    }
    public function getgender()
    {
        return $this->gender;
    }

    public function getname()
    {
        return $this->name;
    }
    public function getpassword()
    {
        return $this->password;
    }
    public function getphone()
    {
        return $this->tphone;
    }
    public function getemail()
    {
        return $this->email;
    }
    public function getphoto()
    {
        return $this->photo;
    }
    public function getcode()
    {
        return $this->code;
    }
    public function getstatus()
    {
        return $this->status;
    }
    public function getupdated_at()
    {
        return $this->updated_at;
    }
    public function getcreated_at()
    {
        return $this->created_at;
    }



    // setters

    public function setid($id)
    {
        $this->id = $id;
    }
    public function setgender($gender)
    {
        $this->gender = $gender;
    }

    public function setname($name)
    {
        $this->name = $name;
    }

    public function setemail($email)
    {
        $this->email = $email;
    }
    public function setpassword($password)
    {
        $this->password =sha1($password) ;
    }
    public function setphone($phone)
    {
        $this->phone = $phone;
    }
    public function setphoto($photo)
    {
        $this->photo = $photo;
    }
    public function setcode($code)
    {
        $this->code = $code;
    }

    public function setstatus($status)
    {
        $this->status = $status;
    }

    public function setcreated_at($created_at)
    {
        $this->created_at = $created_at;
    }

    public function setupdated_at($updated_at)
    {
        $this->updated_at = $updated_at;
    }



    // operation from interface operation
    public function updateData()
    {
    }
    public function insertData()
    {
        $query = "INSERT INTO `users`(`users`.`name`,`users`.`email`,`users`.`password`,`users`.`phone`,`users`.`gender`,`users`.`code`) VALUES('$this->name' , '$this->email' , '$this->password' , '$this->phone' , '$this->gender' ,'$this->code') ";
        return $this->runDML($query);
    }
    public function deleteData()
    {
    }
    public function selectAllData()
    {
    }

    public function emailcheck()
    {
        $query= "SELECT `users`.* FROM `users` WHERE `users`.`email`='$this->email'";
        return $this->runDQL($query);
    }

    public function codecheck()
    {
        $query= "SELECT `users`.* FROM `users` WHERE `users`.`code`='$this->code' AND `users`.`email`='$this->email'";
        return $this->runDQL($query);
    }

    public function updateStatus()
    {
        $query= "UPDATE`users` SET `users`.`status`='$this->status'  WHERE `users`.`email`='$this->email' ";
        return $this->runDML($query);
    }

    public function updateCode()
    {
        $query= "UPDATE`users` SET `users`.`code`='$this->code'  WHERE `users`.`email`='$this->email' ";
        return $this->runDML($query);
    }

}
 


?>