<?php
 include_once "layouts/header.php";
 include_once "validation/userValidation.php";

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
//Load Composer's autoloader
require 'vendor/autoload.php';



if (isset($_POST['submit'])) {
    $userValidation = new userValidation;
    $userValidation->setemail($_POST['email']);
    $result = $userValidation->emailValidation();

    if (empty($result)) {
        $emailchecked = new User;
        $emailchecked->setemail($_POST['email']);
        $emailresult = $emailchecked->emailcheck();
        if ($emailresult) {
            $error=[];
            $code = rand(10000, 99999);
            $emailchecked->setcode($code);
            $coderesult = $emailchecked->updateCode();
            if ($coderesult) {

                //Instantiation and passing `true` enables exceptions
                $mail = new PHPMailer(true);
                $msg = "<h5>Hello <b>" . $_POST['email'] . "</b></h5><p>Your Verification Code:<b>$code</b></p><h5>Best Wishes</h5>";
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
                    header("Location:checkcode.php?email=" . $_POST['email'] . '&forget=1');

                    // echo 'Message has been sent';
                } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }
            } else {
                $error['code'] =  "<div class='alert alert-danger'> some thing wrong </div>";
            }
        } else {
            $error['emailexist'] = "<div class='alert alert-danger'> Email  is not EXIST </div>";
        }
    }
}




?>



        <!-- Breadcrumb Area Start -->
        <div class="breadcrumb-area bg-image-3 ptb-150">
            <div class="container">
                <div class="breadcrumb-content text-center">
					<h3>Verify Email</h3>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li class="active">Set Password</li>
                    </ul>
                </div>
            </div>
        </div>
		<!-- Breadcrumb Area End -->
        <div class="login-register-area ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> Verify Email </h4>
                                </a>
                               
                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form  method="post">
                                                <input type="text" name="email" placeholder="Enter your email">
                                                <?php  
                                                if(isset($result)&& $result ){

                                                    foreach($result as $key=>$value){
                                                        echo $value;
                                                    }
                                                }
                                                if(isset($error)&& $error ){

                                                    foreach($$error as $key=>$value){
                                                        echo $value;
                                                    }
                                                }

                                                ?>
                                               
                                                
                                                    <button type="submit" name="submit"><span>Verify</span></button>
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
        <?php include_once"layouts/footer.php" ?>