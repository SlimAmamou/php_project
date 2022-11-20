<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">    
    <link rel="stylesheet" href="CSS/style.css">
    <script src="./JS/script1.js"></script>
    <script src="./lib/anime.min.js"></script>
    <title>Portail employes</title>
</head>
<?php
    @ob_start();
    session_start();
    //Matriclule connected employee        
    $matricule = $_SESSION['matricule'];
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
                                <h3>Employee Portal</h3>
                                <h3>Port Cartier</h3> 
                            </div>                                                   
                        </article>
                        <article class="col-xs-0 col-sm-3 col-md-6 col-lg-6" align-items="flex-end">                     
                        </article>
                    </div>
                </div>         
            </div>
        </div>       
    </header>    
    
    <div id="membreDiv">
        <form class="form-inline" method="post" action="portail_employes.php">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="memberName" placeholder="Name" pattern="^[a-zA-Z ]+$" required>
            </div>
            <div class="form-group">
                <label>First name</label>
                <input type="text" class="form-control" name="memberFstName" placeholder="First name" pattern="^[a-zA-Z ]+$" required>
            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" name="memberAdress" placeholder="unit, #app, street, postal code" required>
            </div>
            <div class="form-group">
                <label>Telephone</label>
                <input type="tel" name="memberTelphone" placeholder="000 000 0000" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" class="form-control"
                maxlength="12" minLength="12" required/>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="memberEmail" placeholder="firstname@bibliotheque.ca" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <div class="divPass">(use minimum one lower case, one upper case, one number, and one of these characters !@#$%^&*_=+-.,?) </div>
                <input type="text" class="form-control" placeholder="Password" required maxlength="24" minLength="8"
                pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-.,?]).{8,24}$" name="memberPw">
            </div>
            <input type="submit" class="btn btn-primary" name="addMemderBtn" id="addMemderBtn" value="Add Member">
            <button type="button" class="btn btn-danger" onclick="quitFormMembers()">Cancel</button>
        </form>
    </div>
    <div id="employeDiv">
        <form class="form-inline" method="post" action="portail_employes.php">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="employeName" placeholder="Name" pattern="^[a-zA-Z ]+$" required>
            </div>
            <div class="form-group">
                <label>First name</label>
                <input type="text" class="form-control" name="employeFstName" placeholder="First name" pattern="^[a-zA-Z ]+$" required>
            </div>
            <div class="form-group">
                <label>Address</label>
                <input type="text" class="form-control" name="employeAdress" placeholder="unit, #app, street" required>
            </div>
            <div class="form-group">
                <label>Postal Code</label>
                <input type="text" name="employePC" class="form-control" placeholder="A1A1A1" pattern="^[a-zA-Z0-9]+$"  required maxlength="6" minLength="6">
            </div>
            <div class="form-group">
                <label>City</label>
                <input type="text" class="form-control" name="employeCity" placeholder="City" required>
            </div>
            <div class="form-group">
                <label>Province</label>
                <input type="text" class="form-control" placeholder="Province" name="employeState" required>
            </div>
            <div class="form-group">
                <label>Telephone</label>
                <input type="tel"  placeholder="000 000 0000" name="employeTelphone" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" class="form-control"
                maxlength="12" minLength="12" required/>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="employeEmail" placeholder="firstname@bibliotheque.ca" required>
            </div>
            <div class="form-group">
                <label>Date of packing</label>
                <input type="date" class="form-control" name="employeRecrutmentDate" required>
            </div>
            <div class="form-group">
                <label>Type</label>
                <select class="form-control" type="number" required name="employeStatut">
                    <option value="2">employe</option>
                    <option value="1">administrator</option>
                </select>
            </div>
            <div class="form-group">
                <label>Password</label>
                <div class="divPass">(use minimum one lower case, one upper case, one number, and one of these characters !@#$%^&*_=+-.,?) </div>
                <input type="text" class="form-control"placeholder="Password" maxlength="24" minLength="8" 
                pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-.,?]).{8,24}$" required name="employePW">
            </div>
            <input type="submit" class="btn btn-primary" name="addEmployeBtn" id="addEmpolyeBtn" value="Add Employee">
            <button type="button" class="btn btn-danger" onclick="quitFormEmploye()">Cancel</button>
        </form>
    </div>
    
    <div class="div-body">
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <article class="col-xs-12 col-sm-12 col-md-7 col-lg-7"> 
                        <div class="design-general">                                              
                            <table>
                                <tr>
                                    <td class="search-td"><h4>Our Members</h4></td>
                                    <td class="search-td">
                                        <div class="search-div">
                                            <form action="portail_employes.php" method="post">
                                                <table>
                                                    <tr>
                                                        <td><div class="search-bar"><input class="input-search" class="form-control" name="inputMember" type="text"></div></td>
                                                        <td><button class="btn_search" name="btn_search_member" type="submit"><img src="Images/loupe-search.png" height=100%></button></td>
                                                    </tr>
                                                </table>        
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <form action="portail_employes.php" method="post"><input type="submit" class="btn btn-info btn-diplay" 
                                        name="lstMembres" value="Display members"></form>                              
                            <div id="message-box"></div>                                                                                             
                            <div id="members-div"><?php
                                require_once 'fonctions.php'; 
                                echo $_SESSION['espace_membre'];
                                if(isset($_POST['lstMembres'])) 
                                {
                                    echo "<script>document.getElementById('members-div').textContent='';</script>";
                                    $content = aff_members();
                                    $_SESSION['espace_membre'] = $content;
                                    echo $_SESSION['espace_membre'];                                     
                                }
                                
                                if (isset($_POST['btn_search_member']))
                                { 
                                    $conn = openConnect(); 
                                    echo "<script>document.getElementById('members-div').textContent='';</script>";                                    
                                    $name = mysql_entities_fix_string($conn, $_POST['inputMember']);
                                    $content = search_member($name);
                                    $_SESSION['espace_membre'] = $content;
                                    echo $_SESSION['espace_membre']; 
                                }
                            ?></div>                 
                        </div>                        
                            <div class="design-general">
                            <table>
                                <tr>
                                    <td class="search-td"><h4>Display by:</h4></td>
                                    <td class="search-td">
                                        <div class="search-div">
                                            <form action="portail_employes.php" method="post">
                                                <table>
                                                    <tr>
                                                        <td><div class="search-bar"><input class="input-search" name="inputDoc" type="text"></div></td>
                                                        <td><button class="btn_search" name="btn_search_doc" type="submit"><img src="Images/loupe-search.png" height=100%></button></td>
                                                    </tr>
                                                </table>        
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                                <form action="portail_employes.php" method="post">                                    
                                    <input type="radio" name="selected_doc"  checked  value="documents"> library   
                                    <input type="radio" name="selected_doc" value="loaned"> borrowed          
                                    <input type="radio" name="selected_doc" value="reserved"> reserved             
                                    <input type="radio" name="selected_doc" value="late"> late <br>
                                    <input type="submit" class="btn btn-info btn-diplay" name="lstDocuments" value="Display documents">
                                </form>
                                <div id="documents-div"><?php
                                    require_once 'fonctions.php'; 
                                    echo $_SESSION['espace_document'] ;
                                    // btns display by radio btns
                                    if(isset($_POST['lstDocuments'])) 
                                    {
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        switch($_POST['selected_doc'])
                                        {
                                            case "documents":
                                                $_SESSION['espace_document'] = aff_documents();
                                                break;
                                            case "loaned":
                                                $_SESSION['espace_document'] = aff_loned_docs();
                                                break;
                                            case "reserved":
                                                $_SESSION['espace_document'] = aff_reserveded_docs();
                                                break;
                                            case "late":
                                                $_SESSION['espace_document'] = aff_late_docs();
                                                break;
                                        }
                                        echo $_SESSION['espace_document'] ;
                                    }
                                    //Display searched documents
                                    if (isset($_POST['btn_search_doc']))
                                    { 
                                        $conn = openConnect(); 
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";                                    
                                        $document = mysql_entities_fix_string($conn, $_POST['inputDoc']);
                                        if($document != "")
                                        {
                                            $content = search_document($document);
                                            $_SESSION['espace_document'] = $content;
                                        }                                        
                                        echo $_SESSION['espace_document']; 
                                    }
                                    // display report by member
                                    if(isset($_POST['member-transac'])) 
                                    {
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        $_SESSION['Member'] = $_POST['idMember'];
                                        $_SESSION['espace_document'] = aff_transaction($_SESSION['Member']);
                                        echo $_SESSION['espace_document'];
                                    } 
                                    // delete reservation from member
                                    if(isset($_POST['btn-cancel-resrv-unic']))
                                    {
                                        $idTransaction = $_POST['idTransactionReserve'];
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        delete_reservation($idTransaction);
                                        $_SESSION['espace_document'] = aff_transaction($_SESSION['Member']);
                                        echo $_SESSION['espace_document'];
                                    }        
                                    // delete reservation from list
                                    if(isset($_POST['btn-cancel-resrv-list']))
                                    {
                                        $idTransaction = $_POST['idTransactionReserve'];
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        delete_reservation($idTransaction);
                                        $_SESSION['espace_document'] = aff_reserveded_docs();
                                        echo $_SESSION['espace_document'];
                                    }
                                    // delete rental from member
                                    if(isset($_POST['btn-cancel-loan-unic']))
                                    {
                                        $idDocument = $_POST['idDocumentLoan'];
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        $idTransaction = $_POST['idTransactionLoan'];                                        
                                        delete_rental($idTransaction, $idDocument);
                                        $_SESSION['espace_document'] = aff_transaction($_SESSION['Member']);
                                        echo $_SESSION['espace_document'];                                        
                                    }
                                    // delete rental from list
                                    if(isset($_POST['btn-cancel-loan-list']))
                                    {
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        $idTransaction = $_POST['idTransactionLoan'];
                                        $idDocument = $_POST['idDocumentLoan'];
                                        delete_rental($idTransaction, $idDocument);
                                        $_SESSION['espace_document'] = aff_loned_docs();
                                        echo $_SESSION['espace_document'];
                                    }
                                    //return documents from member
                                    if(isset($_POST['btn-return-loan-unic']))
                                    {
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        $idTransaction = $_POST['idTransactionLoan'];
                                        $idDocument = $_POST['idDocumentLoan'];
                                        documents_return($idTransaction, $idDocument);
                                        $_SESSION['espace_document'] = aff_transaction($_SESSION['Member']);
                                        echo $_SESSION['espace_document']; 
                                    }
                                    //return documents from list
                                    if(isset($_POST['btn-return-loan-list']))
                                    {
                                        echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                        $idTransaction = $_POST['idTransactionLoan'];
                                        $idDocument = $_POST['idDocumentLoan'];
                                        documents_return($idTransaction, $idDocument);
                                        $_SESSION['espace_document'] = aff_loned_docs();
                                        echo $_SESSION['espace_document'];
                                    }
                                    
                                ?></div>
                            </div>
                    </article>
                    <article class="col-xs-12 col-sm-10 col-md-5 col-lg-5">
                        <div class="design-general">
                            <h4>Messages and Transactions</h4>
                            <div id="transaction-box"></div>                            
                            <div>
                                <?php  
                                require_once 'fonctions.php'; 
                                $conn = openConnect();                              
                                    if(isset($_POST['btnReserve']))
                                    {
                                        $idDocument = $_POST['idDocument'];
                                        $title = documents_title($idDocument);
                                        $form = reserve_form();
                                        echo $form;
                                        echo "<script>document.getElementById(\"reseve-title\").textContent=\"Reservation: ".$title."\";</script>";
                                        $_SESSION['idDocument'] = $idDocument;
                                    }
                                    if(isset($_POST['btnRent']))
                                    {
                                        $idDocument = $_POST['idDocument'];
                                        $title = documents_title($idDocument);
                                        $form = loan_form();
                                        echo $form;
                                        echo "<script>document.getElementById(\"loan-title\").textContent=\"Rental: ".$title."\";</script>";
                                        $datetime = new DateTime('now');
                                        $datetime->modify('+1 day');
                                        $date = $datetime->format('Y-m-d');
                                        echo "<script>document.getElementById(\"returnDate\").setAttribute(\"min\", \"".$date."\");</script>";
                                        $_SESSION['idDocument'] = $idDocument;
                                        $_SESSION['qtityAvail'] = $_POST['available'];
                                    }
                                    //reserve document:
                                    if(isset($_POST['btn-valid-reservation']))
                                    {
                                        $idDocument = $_SESSION['idDocument'];
                                        $idMember = $_POST['reserve-IdMember'];
                                        if(check_reservation($idMember, $idDocument))
                                        {
                                            echo "<script>document.getElementById('transaction-box').textContent='there is already a reservation of this document on behalf of the selected member';</script>";
                                            echo "<script>document.getElementById('transaction-box').style.color = \"rgb(29, 94, 233)\";</script>";
                                            echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(29, 94, 233)\";</script>";
                                        }
                                        else
                                        {
                                            if(check_member($idMember))
                                            {
                                                reservation($idDocument, $idMember, $matricule);
                                            }
                                            else{
                                                echo "<script>document.getElementById('transaction-box').textContent='unknown member';</script>";
                                                echo "<script>document.getElementById('transaction-box').style.color = \"rgb(236, 12, 12)\";</script>";
                                                echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(236, 12, 12)\";</script>";
                                            }
                                        }                                       
                                    }
                                    //loan document:
                                    if(isset($_POST['btn-valid-rental']))
                                    {
                                        $idMember = $_POST['rent-IdMember'];
                                        if(check_member($idMember))
                                        {
                                            echo "<script>document.getElementById('documents-div').textContent='';</script>";
                                            $idDocument = $_SESSION['idDocument'];
                                            $returnDate = $_POST['returnDate'];
                                            $quantity = $_SESSION['qtityAvail'];
                                            rental($idDocument, $idMember, $matricule, $quantity, $returnDate);
                                            $display = aff_documents();
                                            $test = "<table><tr> <th>Id</th> <th>Title</th><th>Author</th><th>total</th><th>available</th></tr>";
                                            $_SESSION['espace_document'] = aff_documents();?>
                                            <script>document.getElementById('documents-div').textContent  = "<?PHP echo $display;?>";</script>
                                            <?php  
                                        }
                                        else{
                                            echo "<script>document.getElementById('transaction-box').textContent='unknown member';</script>";
                                            echo "<script>document.getElementById('transaction-box').style.color = \"rgb(236, 12, 12)\";</script>";
                                            echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(236, 12, 12)\";</script>";
                                        }                                        
                                    }
                                    $conn->close();
                                ?>
                            </div>
                            <br>                         
                            <form action="portail_employes.php" method="post"><input type="submit" class="btn btn-info btn_formdeploy"  
                                id="btnAddMember" name="btnAddMember" value="Add  new  Member"></form>
                            <br>
                            <form action="portail_employes.php" method="post"><input type="submit" class="btn btn-info btn_formdeploy" 
                                id="btnAddEmploye" name="btnAddEmploye" value="Add new Employee"></form>
                            <br>
                            <div ><img src="Images/bibliotheque.png" width=100%></div>                                                  
                        </div>                        
                    </article>
                </div>
            </div>         
        </div>
    </div>
    <?php           
        require_once 'fonctions.php';       
        $conn = openConnect();       
        //Recuperate connected employee
        $queryemploye = "SELECT * from employes WHERE Matricule='$matricule'";
        $queryemploye = $conn->query($queryemploye);  
        $queryemploye->data_seek(0);
        $employe = $queryemploye->fetch_array(MYSQLI_ASSOC);
        
        //disable forms buttons for librarians
        if($employe['Type'] == 2) 
        {
            echo "<script>desableForm()</script>";
        }

        // deploy member form
        if (isset($_POST['btnAddMember']))
        {
            echo "<style>
                #membreDiv{
                    transform: translateY(5008px);
                }
                </style>";            
        }
        // deploy employee form
        if (isset($_POST['btnAddEmploye']))
        {
            echo "<style>
                #employeDiv{
                    transform: translateY(5008px);
                }
                </style>";
        }
        //add new member
        if (isset($_POST['addMemderBtn']))
        {
            $name = mysql_entities_fix_string($conn, $_POST['memberName']);
            $fstname = mysql_entities_fix_string($conn, $_POST['memberFstName']);
            $adress = mysql_entities_fix_string($conn, $_POST['memberAdress']);
            $telephone = mysql_entities_fix_string($conn, $_POST['memberTelphone']);
            $email = mysql_entities_fix_string($conn, $_POST['memberEmail']);
            $password = mysql_entities_fix_string($conn, $_POST['memberPw']);
            add_member($name, $fstname, $adress, $telephone, $email, $password);
        }
        //add new employe
        if(isset($_POST['addEmployeBtn']))
        {
            $name = mysql_entities_fix_string($conn, $_POST['employeName']);
            $fstname = mysql_entities_fix_string($conn, $_POST['employeFstName']);
            $telephone = mysql_entities_fix_string($conn, $_POST['employeTelphone']);
            $email = mysql_entities_fix_string($conn, $_POST['employeEmail']);
            $province = mysql_entities_fix_string($conn, $_POST['employeState']);
            $adress = mysql_entities_fix_string($conn, $_POST['employeAdress']);
            $city = mysql_entities_fix_string($conn, $_POST['employeCity']);
            $postalCode = mysql_entities_fix_string($conn, $_POST['employePC']);
            $date =  mysql_entities_fix_string($conn, $_POST['employeRecrutmentDate']);
            $type = mysql_entities_fix_string($conn, $_POST['employeStatut']);
            $password = mysql_entities_fix_string($conn, $_POST['employePW']); 
            add_employe($name, $fstname, $telephone, $email, $province, $adress, $city, $postalCode, $date, $type, $password);             
        }
        $conn->close();
    ?>
    
    <footer> 
        <div class="div-footer">
            <div class="sign-page">Municipalitée Port-Cartier</div>            
        </div>
    </footer>
    
</body>
</html>