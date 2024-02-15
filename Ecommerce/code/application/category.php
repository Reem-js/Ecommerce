
<?php 

include_once "database.php";
include_once "databaseOperation.php";

class category extends database implements operation {

private $id;
private $name_en;
private $name_ar;
private $status;
private $created_at;
private $updated_at;


    //////// getters
    public function getid()
    {
        return $this->id;
    }
  

    public function getname_en()
    {
        return $this->name_en;
    }
    public function getname_ar()
    {
        return $this->name_ar;
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
    

    public function setname_ar($name_ar)
    {
        $this->name_ar = $name_ar;
    }
    public function setname_en($name_en)
    {
        $this->name_en = $name_en;
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
      
    }
    public function deleteData()
    {
    }
    public function selectAllData()
    {
        $query = "SELECT `categories`.* FROM `categories` WHERE `categories`.`status` = 1 ORDER BY `categories`.`name_en` ASC";
       return $this->runDQL($query);
    }

    



 

}
 


?>