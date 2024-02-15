<?php 

include_once "database.php";
include_once "databaseOperation.php";

class product extends database implements operation {

private $id;
private $subcategory_id;
private $name_en;
private $name_ar;
private $details_ar;
private $details_en;
private $status;
private $code;
private $stock;
private $price;
private $photo;
private $created_at;
private $updated_at;


    //////// getters
    public function getid()
    {
        return $this->id;
    }
    public function subcategory_id()
    {
        return $this->subcategory_id;
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

    public function details_ar()
    {
        return $this->details_ar;
    }
    public function details_en()
    {
        return $this->details_en;
    }
    public function code()
    {
        return $this->code;
    }
    public function stock()
    {
        return $this->stock;
    }
    public function price()
    {
        return $this->price;
    }
    public function photo()
    {
        return $this->photo;
    }




    // setters

    public function setsubcategory_id($subcategory_id)
    {
        $this->subcategory_id = $subcategory_id;
    }
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
    public function setdetails_ar($details_ar)
    {
        $this->details_ar = $details_ar;
    }
    public function setcode($code)
    {
        $this->code = $code;
    }
    public function setstock($stock)
    {
        $this->stock = $stock;
    }
    public function setprice($price)
    {
        $this->price = $price;
    }
    public function setphoto($photo)
    {
        $this->photo = $photo;
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


    public function selectAllData(){
       $query = "SELECT `products`.* FROM `products`";
       return $this->runDQL($query);
   }

   public function selectAlldatabycat_id(){
    $query = "SELECT `products`.* FROM `products` WHERE  `products`.`subcategory_id`=$this->subcategory_id " ;
    return $this->runDQL($query);
   }

   

   public function productDetails_bYid()
   {
      $query = "SELECT * FROM `products_reviwes` WHERE `products_reviwes`.`id` = $this->id";
      return $this->runDQL($query);

   }
   public function productDetails()
   {
      $query = "SELECT * FROM `products_reviwes` ORDER BY `products_reviwes`.`reviewsAvg` DESC";
      return $this->runDQL($query);

   }
   public function productMostOrderd()
   {
   $query="SELECT * FROM `products_orders` ORDER BY `products_orders`.`quntity` DESC";
   return $this->runDQL($query);
   }
   public function productMostRecent()
   {
   $query="SELECT * FROM `products` ORDER BY `products`.`created_id` DESC";
   return $this->runDQL($query);
   }

   public function selectOffers()
   {
   $query="SELECT * FROM `offers`";
   return $this->runDQL($query);
   }

}
 


?>