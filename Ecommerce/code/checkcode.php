<?php
 include_once "layouts/header.php";
include_once "layouts/header.php" ;
include_once "validation/userValidation.php";



$validation=new userValidation;
$user=$validation-> emailUrlCheck($_GET);

if (isset($_POST['submit'])) {
    $error = [];
    $emailcheck = new User;
    $emailcheck->setcode($_POST['checkCode']);
    $emailcheck->setemail($user->email);
    $result = $emailcheck->codecheck();


    if ($result) {

        if (isset($_GET['forget']) && $_GET['forget'] == 1) {
            // forget password
            header('Location:changpassword.php?email='. $user->email);
        } elseif (isset($_GET['forget']) && $_GET['forget'] == 2) {

            $emailcheck->setstatus(1);
            $status = $emailcheck->updateStatus();

            if ($status) {
                $_SESSION['user'] = $user;
                header('location:index.php');
            } else {
                $error['update'] = "<div class='alert alert-danger'>some thing wrong </div>";
            }
        } else {
            header('Location:404.php');
        }
    } else {
        $error['code'] = "<div class='alert alert-danger'>wrong code </div>";
    }
}

?>



        <!-- Breadcrumb Area Start -->
        <div class="breadcrumb-area bg-image-3 ptb-150">
            <div class="container">
                <div class="breadcrumb-content text-center">
					<h3>check-code</h3>
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li class="active">check-code</li>
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
                                    <h4> check-code </h4>
                                </a>
                               
                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-register-form">
                                            <form  method="post">
                                                <input type="text" name="checkCode" placeholder="Enter verification code">
                                                <?php if(!empty($error)){
                                                    foreach($error as $key=>$value){
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