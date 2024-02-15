<?php include_once "layouts/header.php";
include_once "application/product.php";

$products=new product;
$result=$products->productDetails();
$products_details=$result->fetch_all(MYSQLI_ASSOC);
print_r($products_details[0]['id']);
?>

        
		


		<!-- News Area Start -->
		<div class="blog-area bg-image-1 pt-90 pb-70">
            <div class="container">
                <div class="product-top-bar section-border mb-55">
                    <div class="section-title-wrap text-center">
                        <h3 class="section-title">Products have most rated</h3>
                    </div>
                </div>
			</div>
			<div class="container">
				<div class="row">
				<?php
		$products = new product;
		$result = $products->productDetails();
		$products_details = $result->fetch_all(MYSQLI_ASSOC);
		for($i=0;$i<=2;$i++){
		//print_r($products_details[0]['id']);
?>
					<div class="col-lg-4 col-md-6">
						<div class="blog-single mb-10">
							<div class="blog-thumb">
								<a href="#"><img width="75%" src="assets/img/product/<?php echo $products_details[$i]['photo']; ?>" alt="" /></a>
							</div>
							<div class="blog-content pt-25 text-center">
								<span class="blog-date text-center">Averge Rate = <?php echo $products_details[$i]['reviewsAvg']; ?></span>
								<h3 class="text-center"><a href="#" ><?php echo $products_details[$i]['name_en']; ?></a></h3>
								
							</div>
						</div>
					</div>
					<?php }?>
				</div>
			</div>
		</div>


		<div class="blog-area bg-image-1 pt-90 pb-70">
            <div class="container">
                <div class="product-top-bar section-border mb-55">
                    <div class="section-title-wrap text-center">
                        <h3 class="section-title">Products have most ordered</h3>
                    </div>
                </div>
			</div>
			<div class="container">
				<div class="row">
				<?php

		$productresult = $products->productMostOrderd();
		$productOrderTable = $productresult->fetch_all(MYSQLI_ASSOC);

		for ($j = 0; $j <= 2; $j++) {
			$products->setid($productOrderTable[$j]['product_id']);
			$resultproduct = $products->productDetails_bYid();
			$mostOrderd = $resultproduct->fetch_all(MYSQLI_ASSOC);
?>
					<div class="col-lg-4 col-md-6">
						<div class="blog-single mb-30">
							<div class="blog-thumb">
								<a href="#"><img width="75%" src="assets/img/product/<?php echo $mostOrderd[0]['photo']; ?>" alt="" /></a>
							</div>
							<div class="blog-content pt-25">
								<span class="blog-date"></span>
								<h3 class="text-center"><a href="#"><?php echo $mostOrderd[0]['name_en']; ?></a></h3>
								
							</div>
						</div>
					</div>
					<?php }?>
				</div>
			</div>
		</div>

		<div class="blog-area bg-image-1 pt-90 pb-70">
            <div class="container">
                <div class="product-top-bar section-border mb-55">
                    <div class="section-title-wrap text-center">
                        <h3 class="section-title">most recent products</h3>
                    </div>
                </div>
			</div>
			<div class="container">
				<div class="row">
				<?php
				$productDetails=$products->productMostRecent();
				$product_Details=$productDetails->fetch_all(MYSQLI_ASSOC);
				for($r=0;$r<=2;$r++){

				?>
					<div class="col-lg-4 col-md-6">
						<div class="blog-single mb-30">
							<div class="blog-thumb">
								<a href="#"><img width="75%" src="assets/img/product/<?php echo $product_Details[$r]['photo'];?>" alt="" /></a>
							</div>
							<div class="blog-content pt-25">
								<span class="blog-date"></span>
								<h3 class="text-center"><a href="#"><?php echo $product_Details[$r]['name_en'] ;?></a></h3>
								
							</div>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>

		
		<!-- News Area End -->
	
		<!-- Banner Start -->
        <div class="banner-area pt-100 pb-70">
            <div class="container">
			<div class="product-top-bar section-border mb-55">
                    <div class="section-title-wrap text-center">
                        <h3 class="section-title"> New Offers</h3>
                    </div>
                </div>
                <div class="banner-wrap">
                    <div class="row">
					<?php 
					$offer=$products->selectOffers();
					$offers=$offer->fetch_all(MYSQLI_ASSOC);
					for($i=0;$i<=1;$i++){
					?>
                        <div class="col-lg-6 col-md-6">
                            <div class="single-banner img-zoom mb-30">
                                <a href="#">
                                    <img src="assets/img/banner/<?php echo $offers[$i]['photo']; ?>" alt="">
                                </a>
                                <div class="banner-content">
                                    <h4><?php echo $offers[$i]['discount']; ?> %</h4>
                                    <h5><?php echo $offers[$i]['title']; ?></h5>
                                </div>
                            </div>
                        </div>
						<?php }?>
                    </div>
                </div>
            </div>
        </div>
		<!-- Banner End -->
	
		
		
	
        <?php include_once"layouts/footer.php" ?>

