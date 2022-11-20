<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/style.css">
    <title>library Port Cartier</title>
</head>
<?php
    @ob_start();
    session_start();
    $idMember = $_SESSION['membreId'];
?>
<body>
    <header>
        <div class="div-header">
            <div class="container-fluid">
                <div class="container">
                    <div class="row">
                        <article class="col-xs-3 col-sm-3 col-md-2 col-lg-2">
                            <div class="logo-div"><img src="Images/PortCartier.png" height=75%></div>
                        </article>                        
                        <article class="col-xs-9 col-sm-6 col-md-4 col-lg-4">
                            <div class="title-div">
                                <h3>public library</h3>
                                <h3>Port Cartier</h3> 
                            </div>                                                   
                        </article>
                        <article class="col-xs-0 col-sm-3 col-md-6 col-lg-6">                       
                        </article>
                    </div>
                </div>         
            </div>
        </div>       
    </header>


    <div class="div-body">
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <article class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                        <div class="design-general">
                            <table>
                                <tr><td><h4>Our Documents</h4></td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td class="search-td">
                                                    <div class="search-div">
                                                        <form action="portail_client.php" method="post">
                                                            <table>
                                                                <tr>
                                                                    <td><div class="search-bar"><input class="input-search" name="inputDoc" type="text" required></div></td>
                                                                    <td><button class="btn_search" name="btn_search_doc" type="submit"><img src="Images/loupe-search.png" height=100%></button></td>
                                                                </tr>
                                                            </table>        
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <div id="message-box-reservation"></div>
                            <div id="search-doc-div">
                                <?php
                                require_once 'fonctions.php';
                                echo $_SESSION['DisplayWindow']; 
                                if (isset($_POST['btn_search_doc']))
                                { 
                                    $conn = openConnect(); 
                                    echo "<script>document.getElementById('search-doc-div').textContent='';</script>";                                    
                                    $document = mysql_entities_fix_string($conn, $_POST['inputDoc']);                                        
                                    $content = search_document_member($document);
                                    $_SESSION['DisplayWindow'] = $content;
                                                                        
                                    echo $_SESSION['DisplayWindow']; 
                                }
                                
                                if(isset($_POST['btnReserve']))
                                {
                                    $idDocument = $_POST['idDocument'];
                                    if(check_reservation($idMember, $idDocument))
                                    {
                                        echo "<script>document.getElementById('message-box-reservation').textContent='you have already reserved this document, a message will be sent to you as soon as it becomes available';</script>";
                                        echo "<script>document.getElementById('message-box-reservation').style.color = \"rgb(29, 94, 233)\";</script>";
                                        echo "<script>document.getElementById('message-box-reservation').style.border = \"solid 1.5px rgb(29, 94, 233)\";</script>";
                                    }
                                    else{
                                        mobile_booking($idDocument, $idMember);
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    </article>
                    <article class="col-xs-12 col-sm-10 col-md-5 col-lg-5">
                        <div class="design-general">
                            <br>
                            <h4>Your satisfaction is our priority</h4>
                            <br>
                            <div class="article-div"><p>our library tries to offer you in addition to your books, a great panoply of articles.</p></div> 
                            <br>                           
                            <div ><img src="Images/public_library.png" width=100%></div>
                            <br>
                            <div class="article-div"><p>Our building are designed to give you the space you need for your reading and projects.</p></div>
                            <div class="article-div"><p>You can pick up your reserved items every day of the week 
                                from 7:00 am to 11:00 pm, and on weekends from 8:00 am to midnight.</p></div>
                            <br>                            
                        </div>
                    </article>
                </div>
            </div>         
        </div>
    </div><?php
    echo $idMember;
    ?>

    <footer> 
        <div class="div-footer">
            <div class="sign-page">Municipalitée Port-Cartier</div>            
        </div>
    </footer>
    
</body>
</html>