<?php 
include_once "layouts/header.php";
include_once "validation/userValidation.php";
include_once "application/user.php";
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
//Load Composer's autoloader
require 'vendor/autoload.php';

// 1- chech submit
// 2- validate data
// 3- do query 
// 4- check query if(error){print some thing error} 
//else if(no error){send email to user & header to the check code page}

// 1- chech submit
if(isset($_POST['submit'])){
$errors=[];
    // 2- validate data
//1)validate on data from post
//2)take instanse from validation class 
$validation=new userValidation;
//3)set password & email value to class
//4)call password validation method
$validation->setpassword($_POST['password']);
$validation->setpassConfimation($_POST['confirmPassword']);
$validationPassword=$validation->passwordValidation();
////
$validation->setemail($_POST['email']);
$validationEmail=$validation->emailValidation();

    //5)check on return validation method 
    //    if (empty array of errors){sucsess validation , insert new user in database ,check on query,
    //             if(query return error ){somthing error ,}
    //             if(query return no error ){send verifacation code to user email&header user to verifacation code}    }
    //     if (array of error has data ){validation is failed and print error to user}
    if (empty($validationPassword) && empty($validationEmail)) {

        $newUser = new User;
        $newUser->setemail($_POST['email']);
        $newUser->setname($_POST['name']);
        $newUser->setpassword($_POST['password']);
        $newUser->setphone($_POST['phone']);
        $newUser->setgender($_POST['gender']);
        $code = rand(10000, 99999);
        $newUser->setcode($code);

        $emailcheck = $newUser->emailcheck();
        if (empty($emailcheck)) {
            $result = $newUser->insertData();

            if ($result) {
                //send email 


               
                    // if there is no error (SEND MAIL  WIth CODE && header on checkCode page)
                    // send mail
    
                        
    
                        //Instantiation and passing `true` enables exceptions
                        $mail = new PHPMailer(true);
                        $msg = "<h5>Hello <b>" . $_POST['name'] . "</b></h5>
                                <p>Your Verification Code:<b>$code</b></p>
                                <h5>Best Wishes</h5>";
                        try {
                            //Server settings
                            // $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
                            $mail->isSMTP();                                            //Send using SMTP
                            $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                            $mail->Username   = 'ntiecommerce67@gmail.com';                     //SMTP username
                            $mail->Password   = 'NTI@123456';                               //SMTP password
                            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         //Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
                            $mail->Port       = 587;                                    //TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above
    
                            //Recipients
                            $mail->setFrom('ntiecommerce67@gmail.com', 'Ecommerce');
                            $mail->addAddress($_POST['email']);     //Add a recipient
                        
    
                            //Content
                            $mail->isHTML(true);                                  //Set email format to HTML
                            $mail->Subject = 'Email Verification';
                            $mail->Body    = $msg;
    
                            $mail->send();
                            header("Location:checkcode.php?email=".$_POST['email']. '&forget=2');
    
                            // echo 'Message has been sent';
                        } catch (Exception $e) {
                            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                        }
    
                        // header check code;
                
            } else {

                $error['database'] = "<div class='alert alert-danger text-center'>something wrong</div>";
            }
        } else {
            $error['emailExists'] = "<div class='alert alert-danger text-center'>email already exists </div>";
        }
    }
}
?>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-image-3 ptb-150">
    <div class="container">
        <div class="breadcrumb-content text-center">
            <h3>LOGIN</h3>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li class="active">Login</li>
            </ul>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->
<div class="active login-register-area ptb-100">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                <div class="login-register-wrapper">
                    <div class="login-register-tab-list nav">

                        <a class="active" data-toggle="tab" href="#lg2">
                            <h4> register </h4>
                        </a>
                    </div>
                    <div class="tab-content">

                        <div id="lg2" class="tab-pane active">
                            <div class="login-form-container">
                                <div class="login-register-form">
                                    <form method="post">
                                    <?php  if(isset($error['database'])){
                                            echo  $error['database'];
                                        }?>
                                        <input type="text" name="name" placeholder="Username" value="<?php if(isset($_POST['name'])){echo $_POST['name'];} ?>">
                                        <input type="password" name="password" placeholder="Password" value="<?php if(isset($_POST['password'])){echo $_POST['password'];} ?>">
                                        <input type="password" name="confirmPassword" placeholder="confirm Password" value="<?php if(isset($_POST['confirmPassword'])){echo $_POST['confirmPassword'];} ?>">
                                       <?php if(!empty($validationPassword)){
                                            foreach($validationPassword as $key =>$value){
                                                echo $value;
                                            }

                                        
                                        }
                                        ?>
                                        <input name="email" placeholder="Email" type="email" value="<?php if(isset($_POST['email'])){echo $_POST['email'];} ?>">
                                        <?php 
                                        if(!empty($validationEmail)){
                                            foreach($validationEmail as $key =>$value){
                                                echo $value;
                                            }
                                        }
                                        if(isset($error['emailExists'])){
                                            echo  $error['emailExists'];
                                        }
                                        ?>
                                        <input name="phone" placeholder="phone" type="tel" value="<?php if(isset($_POST['phone'])){echo $_POST['phone'];} ?>" >
                                        <select name="gender" class="form-control" id="" value="<?php if(isset($_POST['phone'])){echo $_POST['phone'];} ?>">
                                            <option <?php echo ((isset($_POST['gender'])&& $_POST['gender']=='m') ? 'selected' :'' )?> value="m">male</option>
                                            <option <?php echo ((isset($_POST['gender'])&& $_POST['gender']=='f') ? 'selected' :'' )?> value="f">female</option>

                                        </select>
                                        <div class="button-box">
                                            <button class="my-4" type="submit" name="submit"><span>Register</span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include_once "layouts/footer.php" ?>