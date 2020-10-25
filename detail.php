<?php 
    include_once 'connector.php';
    include_once 'validate-auth.php'; 
    include_once 'accdetail.php';

    if (!isset($_GET['itemID'])) {
        header('Location: /dashboard.php');
    }
    /* $query = "SELECT * FROM chocolate WHERE id = " . $_GET['itemID']; */
    $query = "
        SELECT chocolate.id AS chocoID, name, price, image, description, chocolate.amount AS amount,
            COALESCE(SUM(transaction.amount), 0) AS amountSold
        FROM chocolate LEFT OUTER JOIN transaction
        ON transaction.chocolate_id = chocolate.id
        WHERE chocolate.id = " . $_GET['itemID']; 
    $connector = new Connector();
    $result = $connector->getAllData($query); 
    if (count($result) == 0) {
        header('Location: /dashboard.php');
    }

    $connector->close();

?>

<!DOCTYPE HTML>
<html lang="en" dir="lttr">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="assets/styles/DetailUserAdmin.css">
        <link rel="stylesheet" href="/assets/styles/common.css">
        <link rel="stylesheet" href="/assets/styles/common-navbar.css">
        
    </head>
    <body>
        <?php include 'get-header.php';?>
        <div class="opacity-layer">
            <div class="main-container">
                <div class="label-title">
                    <label id="LabelTitle"><?php echo $result[0]['name'];?></label>
                </div>
                <div class="secondary-container">
                    <div class="image-container">
                        <img src="image/<?php echo $result[0]['image'];?>">
                    </div>
                    <div class="text-container">
                        <div class="content-label">
                            <label><b>Amount sold : </b></label>
                            <label id="Sold"><?php echo $result[0]['amountSold'];?></label>
                        </div>
                        <div class="content-label">
                            <label><b>Price : </b></label>
                            <label id="Price">Rp<?php echo $result[0]['price'];?></label>
                        </div>
                        <div class="content-label">
                            <label><b>Amount : </b></label>
                            <label id="Amount"><?php echo $result[0]['amount'];?></label>
                        </div>
                        <div class="content-label">
                            <label><b>id : </b></label>
                            <label id="Amount"><?php echo $result[0]['chocoID'];?></label>
                        </div>
                        <div class="content-label">
                            <label><b>Description</b></label>
                        </div>
                        <label id="Description"><?php echo $result[0]['description'];?></label>
                    </div>
                </div>
                <div id="detail-form" style= "display:none">
                    <div class="secondary-container">
                        <form action="/detail-handler.php" method = "post" >
                                <div class="content-label">
                                    <label for="amount">Amount: </label>
                                </div>    
                            <input type="number" id="amount" name="amount"><br><br>
                            <input type="hidden" id="test" name="test" value = "stringtest">
                            <input type="hidden" id="choco_id" name="choco_id" value= "<?php echo $result[0]['chocoID'] ?>" />
                            <div class="button-container">
                            <input type="submit" value="Submit">
                            <input type="button" onclick="cancelAddStock()" value="Cancel"></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="button-container">
                    <?php
                        
                        if (isSuperuser($_COOKIE['username'])) {
                            echo "
                            <script src='detail-button.js'></script>
                            <button id = 'detail-add-stock-button' onClick='detailAddStock()'>Add Stock</button>
                            ";
                        } else {
                            echo "
                            <script src='detail-button.js'></script>
                            <button id = 'detail-buy-button' onClick='detailBuy()'>Buy Now</button>
                            ";
                        }
                    ?>
                </div>
            </div>
        </div>
    </body>
</html>
