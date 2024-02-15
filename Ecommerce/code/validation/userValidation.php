<?php
include_once "application/user.php";

class userValidation
{
    private $email;
    private $password;
    private $passConfirmation;

    // getters//////
    public function getemail()
    {
        return $this->email;
    }

    public function getpassword()
    {
        return $this->password;
    }

    public function getpassConfimation()
    {
        return $this->passConfirmation;
    }

    // setters//////

    public function setemail($email)
    {
        $this->email= $email;
    }

    public function setpassConfimation($passConfirmation)
    {
        $this->passConfirmation = $passConfirmation;
    }

    public function setpassword($password)
    {
        $this->password = $password;
    }



    public function passwordValidation()
    {

        $error = [];
        $pattern='/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/';

        if (!$this->password) {
            $error['password'] = "<div class='alert alert-danger'> Password  is Requiered </div>";
        }

        if (!$this->passConfirmation) {
            $error['passwordconfirmation'] = "<div class='alert alert-danger'> Password confirm is Requiered </div>";
        }
        if(empty($error)){
            if(!preg_match($pattern,$this->password)){
                $error['pattern'] = "<div class='alert alert-danger'> Password must contain Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character </div>";
            }
            if($this->password!=$this->passConfirmation){
                $error['match'] = "<div class='alert alert-danger'> Password confirm not equal password </div>";
            }
        }
        return $error;
    }

    public function emailValidation()
    {
        $pattern = "/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/";
        $error = [];

        if (!$this->email) {
            $error['email'] = "<div class='alert alert-danger'> Email  is Requiered </div>";
        } else {
            if (!preg_match($pattern, $this->email)) {
                $error['pattern'] = "<div class='alert alert-danger'> Email Format is wrong </div>";
            }
        }
        return $error;
    }

    public function emailUrlCheck($url)
    {
        if ($url) {

            if (isset($url['email'])) {

                if ($url['email']) {
                    
                    $checkemailUser=new User;
                    $checkemailUser->setemail($url['email']);
                    $verifyEmail= $checkemailUser->emailcheck();

                    if($verifyEmail){
                        $user=$verifyEmail->fetch_object();
                        return $user;
                    }
                    else{
                        header('location:404.php');
                    }



                } else {
                    header('location:404.php');
                }
            } else {
                header('location:404.php');
            }
        } else {
            header('location:404.php');
        }
    }
}






?>