<?php
// Opening connection
function openConnect(){
    $servername = "localhost";
    $database = "bibliotheque_pointeclair";
    $username = "root"; 
    $password = "";   
    try {
        $conn = new mysqli($servername, $username, $password, $database);
        return $conn;
    }
    catch(mysqliException $e){
        return null; 
    }       
}

// Cleaning for prediction Code injection
function mysql_entities_fix_string($conn, $string)
{
    return htmlentities(mysql_fix_string($conn, $string));
}    

function mysql_fix_string($conn, $string)
{
    if (get_magic_quotes_gpc()) 
        $string = stripslashes($string);
        return $conn->real_escape_string($string);
}

//display Members 
function aff_members()
{
    $conn = openConnect(); 
    $query = "SELECT * FROM membres";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<hr>";
    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $content .= "<tr><td><form action=\"portail_employes.php\" method=\"post\"><td><input type=\"text\"  name=\"idMember\" class=\"id-input\" 
        value=".$row['IdMembre']." readonly=\"readonly\"></td></td>"
        ." - ". $row['Prenom'] ."  ". $row['Nom'] ."</td><td><button type=\"submit\" 
        name=\"member-transac\" class=\"btn btn-link\">View</button></td></form></tr>";        
    }
    ;
    $conn->close();
    return $content;
}

//Search member
function search_member($name)
{ 
    $conn = openConnect();
    $name_fstname = str_word_count($name,1);
    $query = "SELECT * FROM membres";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<hr>";

    if(count($name_fstname) >= 2)
    {
        for($j=0 ; $j < $rows ; ++$j)
        {
            $query->data_seek($j);
            $row = $query->fetch_array(MYSQLI_BOTH);
            if((strtolower($name_fstname[0])== strtolower($row['Nom']) && strtolower($name_fstname[1]) == strtolower($row['Prenom']))
                || (strtolower($name_fstname[1])== strtolower($row['Nom']) && strtolower($name_fstname[0]) == strtolower($row['Prenom'])))
            {
                $content .= "<tr><td><form action=\"portail_employes.php\" method=\"post\"><td><input type=\"text\"  name=\"idMember\" class=\"id-input\" 
                value=".$row['IdMembre']." readonly=\"readonly\"></td></td>"
                ." - ". $row['Prenom'] ."  ". $row['Nom'] ."</td><td><button type=\"submit\" 
                name=\"member-transac\" class=\"btn btn-link\">View</button></td></form></tr>";  
            }
            else if((strstr(strtolower($row['Nom']),strtolower($name_fstname[0])))&&(strstr(strtolower($row['Prenom']),strtolower($name_fstname[1])))
                || (strstr(strtolower($row['Prenom']),strtolower($name_fstname[0])))&&(strstr(strtolower($row['Nom']),strtolower($name_fstname[1]))))
            {
                $content .= "<tr><td><form action=\"portail_employes.php\" method=\"post\"><td><input type=\"text\"  name=\"idMember\" class=\"id-input\" 
                value=".$row['IdMembre']." readonly=\"readonly\"></td></td>"
                ." - ". $row['Prenom'] ."  ". $row['Nom'] ."</td><td><button type=\"submit\" 
                name=\"member-transac\" class=\"btn btn-link\">View</button></td></form></tr>"; 
            }
        }
    }
    else if(count($name_fstname) == 1)
    {
        for($j=0 ; $j < $rows ; ++$j)
        {
            $query->data_seek($j);
            $row = $query->fetch_array(MYSQLI_BOTH);
            if((strstr(strtolower($row['Nom']),strtolower($name_fstname[0])))
            || (strstr(strtolower($row['Prenom']),strtolower($name_fstname[0]))))
            {
                $content .= "<tr><td><form action=\"portail_employes.php\" method=\"post\"><td><input type=\"text\"  name=\"idMember\" class=\"id-input\" 
                value=".$row['IdMembre']." readonly=\"readonly\"></td></td>"
                ." - ". $row['Prenom'] ."  ". $row['Nom'] ."</td><td><button type=\"submit\" 
                name=\"member-transac\" class=\"btn btn-link\">View</button></td></form></tr>";
            }
        }
    }
    return $content;     
    $conn->close();
}

//search Documents to employes
function search_document($document)
{
    $conn = openConnect();
    $query = "SELECT * FROM documents";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<table><tr> <th>Id</th> <th>Title</th><th>Author</th><th>total</th><th>available</th></tr>";

    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        if((strstr(strtolower($row['Titre']),strtolower($document))))
        {
            $content .= "<tr><form action=\"portail_employes.php\" method=\"post\">
            <td><input type=\"text\" class=\"id-input\"   name=\"idDocument\" value=". $row[0] . " readonly=\"readonly\"></td>
            <td>" . $row['Titre'] ."</td><td>" . $row['Auteur'] ."</td>
            <td><input class=\"id-input\"  type=\"text\" name=\"total\" value=". $row['DocumentTotal'] ." readonly=\"readonly\"></td>
            <td><input class=\"id-input\"  type=\"text\" name=\"available\" value=". $row['DocumentDisponible'] ." readonly=\"readonly\"></td>
            <td><button type=\"submit\" name=\"btnRent\" class=\"btn btn-link\">Rent</button></td><td>
            <button type=\"submit\" name=\"btnReserve\" class=\"btn btn-link\">Reserve</button></td></form></tr>";
        }
    }
    $content .= "</table>";     
    $conn->close();
    return $content;
}
//search Documents to members
function search_document_member($document)
{
    $conn = openConnect();
    $query = "SELECT * FROM documents";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "";

    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        if((strstr(strtolower($row['Titre']),strtolower($document))))
        {
            $content .= "<div class=\"div-by-document\"><form action=\"portail_client.php\" method=\"post\">
            <table><tr><td><input type=\"hidden\"  name=\"idDocument\" value=". $row[0] ."></td><td>" .documents_title($row[0])."  </td><td>/ De: ".$row['Auteur']."</td></tr></table>
            <table><tr><td>".return_category($row['Categorie'])."</td><td>".return_kind($row['Genre'])."</td><td>pour ".return_type($row['Type'])."</td><td>".$row['AnneeDePublication']."</td></tr></table>
            <button type=\"submit\" name=\"btnReserve\" class=\"btn btn-link\">Reserve</button></td>            
            <p class=\"p-resume\">Resume :  ".$row['Description']."</p></form></div>";
        }
    }     
    $conn->close();
    return $content;
}

//display Documents to employes
function aff_documents()
{
    $conn = openConnect(); 
    $query = "SELECT * FROM documents";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<table><tr> <th>Id</th> <th>Title</th><th>Author</th><th>total</th><th>available</th></tr>";
    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $content .= "<tr><form action=\"portail_employes.php\" method=\"post\">
            <td><input type=\"text\" class=\"id-input\"   name=\"idDocument\" value=". $row[0] . " readonly=\"readonly\"></td>
            <td>" . $row['Titre'] ."</td><td>" . $row['Auteur'] ."</td>
            <td><input class=\"id-input\"  type=\"text\" name=\"total\" value=". $row['DocumentTotal'] ." readonly=\"readonly\"></td>
            <td><input class=\"id-input\"  type=\"text\" name=\"available\" value=". $row['DocumentDisponible'] ." readonly=\"readonly\"></td>
            <td><button type=\"submit\" name=\"btnRent\" class=\"btn btn-link\">Rent</button></td>
            <td><button type=\"submit\" name=\"btnReserve\" class=\"btn btn-link\">Reserve</button></td></form></tr>";
    }
    $content .= "</table>";
    return $content;
    $conn->close();
}

//display Documents to members
function display_new_documents()
{
    $conn = openConnect(); 
    $query = "SELECT * FROM documents WHERE AnneeDePublication=2022";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<h4>Our novelties</h4>";
    for($j=$rows-1 ; $j >=0 ; --$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $content .= "<div class=\"div-by-document\"><form action=\"portail_client.php\" method=\"post\">
            <table><tr><td><input type=\"hidden\"  name=\"idDocument\" value=". $row[0] ."></td><td>" .documents_title($row[0])."  </td><td>/ De: ".$row['Auteur']."</td></tr></table>
            <table><tr><td>".return_category($row['Categorie'])."</td><td>".return_kind($row['Genre'])."</td><td>pour ".return_type($row['Type'])."</td><td>".$row['AnneeDePublication']."</td></tr></table>
            <button type=\"submit\" name=\"btnReserve\" class=\"btn btn-link\">Reserve</button></td>            
            <p class=\"p-resume\">Resume :  ".$row['Description']."</p></form></div>";
    }    
    $conn->close();
    return $content;
}

//display Loaned Documents
function aff_loned_docs()
{
    $conn = openConnect(); 
    $query = "SELECT * FROM transactions WHERE Type=1 ";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<table><tr> <th>Id</th> <th>Member</th><th>Doc:</th><th>Title</th><th>Planned return</th></tr>";
    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $idMember = $row['IdMembre'];
        $idDocument = $row['IdDocument'];
        if(!$row['RetourReel'])
        {
            $titre = documents_title($idDocument);
            $content .= "<tr><form action=\"portail_employes.php\" method=\"post\">
                    <td><input type=\"text\" class=\"id-input\"   name=\"idTransactionLoan\" value=". $row[0] . " readonly=\"readonly\"></td>
                    <td>" . member_name($idMember) ." </td>
                    <td><input type=\"text\" class=\"id-input\" name=\"idDocumentLoan\" value=" . $idDocument ." readonly=\"readonly\"</td>                    
                    <td>" . documents_title($idDocument) ."</td>
                    <td>" . $row['DateRetour'] ."</td>
                    <td><button type=\"submit\" name=\"btn-cancel-loan-list\" class=\"btn btn-link\" onclick=\"return  confirm('do you want to delete transction N°: ". $row[0] . " .')\">Delete</button></td>
                    <td><button type=\"submit\" name=\"btn-return-loan-list\" class=\"btn btn-link\" onclick=\"return  confirm('do you want to return Document: ". documents_title($idDocument) . " .')\">Return</button></td></form></tr>" ;
        }
    }
    $content .= "</table>";
    $conn->close();
    return $content;
}

//display reserved Documents
function aff_reserveded_docs()
{
    $conn = openConnect(); 
    $query = "SELECT * FROM transactions WHERE Type=2 ";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<table><tr> <th>Id</th> <th>Member</th><th>Title</th><th>Reservation date</th></tr>";
    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $idMember = $row['IdMembre'];
        $idDocument = $row['IdDocument'];
        if($row['DateRetour'] == null)
        {
            $content .= "<tr><form action=\"portail_employes.php\" method=\"post\">
                    <td><input type=\"text\" class=\"id-input\"   name=\"idTransactionReserve\" value=". $row[0] . " readonly=\"readonly\"></td>
                    <td>" . member_name($idMember) ."</td>
                    <td>" . documents_title($idDocument) ."</td>
                    <td>" . $row['DateReservation'] ."</td>
                    <td><button type=\"submit\" name=\"btn-cancel-resrv-list\" class=\"btn btn-link\" onclick=\"return  confirm('do you want to delete transction N°: ". $row[0] . " .')\">Delete</button></td></form></tr>" ;                    
        }
    }
    $content .= "</table>";
    $conn->close();
    return $content;
}

//display overdue documents
function aff_late_docs()
{
    $date = date('Y-m-d');
    $conn = openConnect(); 
    $query = "SELECT * FROM transactions WHERE Type=1 ";
    $query = $conn->query($query);
    $rows = $query->num_rows;
    $content = "<table><tr> <th>Id</th> <th>Member</th><th>Title</th><th>Planned return</th></tr>";
    for($j=0 ; $j < $rows ; ++$j)
    {
        $query->data_seek($j);
        $row = $query->fetch_array(MYSQLI_BOTH);
        if($row['DateRetour'] < $date && $row['RetourReel'] == null)
        {
            $idMember = $row['IdMembre'];
            $idDocument = $row['IdDocument'];
            $content .= "<tr><td>" . $row[0] . " </td><td width=\"25%\">" . member_name($idMember) ."</td>
                <td>" . documents_title($idDocument) ."</td><td>" . $row['DateRetour'] ."</td>";
        }
    }
    $content .= "</table>";
    $conn->close();
    return $content;
}

//display transaction by IdMember
function aff_transaction($idMember)
{
    $conn = openConnect(); 
    $queryl = "SELECT * FROM transactions WHERE IdMembre='$idMember' AND Type=1";
    $queryr = "SELECT * FROM transactions WHERE IdMembre='$idMember' AND Type=2 ";
    $queryl = $conn->query($queryl);
    $rowsl = $queryl->num_rows;
    $queryr = $conn->query($queryr);
    $rowsr = $queryr->num_rows;
    $content = "<h4>Transactions M ".member_name($idMember)."</h4>
        <table><tr><th>Id</th><th>Type</th><th>Doc:</th><th>Title</th><th>planned return</th></tr>";
    for($j=0 ; $j < $rowsl ; ++$j)
    {
        $queryl->data_seek($j);
        $row = $queryl->fetch_array(MYSQLI_BOTH);
        $idDocument = $row['IdDocument']; 
        if($row['RetourReel'] == null)
        {
            $content .= "<tr><form action=\"portail_employes.php\" method=\"post\"> 
                <td><input type=\"text\" class=\"id-input\"   name=\"idTransactionLoan\" value=". $row[0] . " readonly=\"readonly\"></td>
                <td>rental</td>
                <td><input type=\"text\" class=\"id-input\" name=\"idDocumentLoan\" value=" . $idDocument ." readonly=\"readonly\"</td> 
                <td>" . documents_title($idDocument) ."</td>
                <td>". $row['DateRetour']."</td>
                <td><button type=\"submit\" name=\"btn-cancel-loan-unic\" class=\"btn btn-link\" onclick=\"return  confirm('do you want to delete transction N°: ". $row[0] . " .')\">Delete</button></td>
                <td><button type=\"submit\" name=\"btn-return-loan-unic\" class=\"btn btn-link\" onclick=\"return  confirm('do you want to return Document: ". documents_title($idDocument) . " .')\">Return</button></td>
                </form></tr>" ; 
        }    
    }
    for($j=0 ; $j < $rowsr ; ++$j)
    {
        $queryr->data_seek($j);
        $row = $queryr->fetch_array(MYSQLI_BOTH);
        $idDocument = $row['IdDocument']; 
        if($row['RetourReel'] == null)
        { 
            $content .= "<tr><form action=\"portail_employes.php\" method=\"post\"> 
                <td><input type=\"text\" class=\"id-input\"   name=\"idTransactionReserve\" value=". $row[0] . " readonly=\"readonly\"></td>
                <td>reservation</td>                 
                <td>".$idDocument."</td>
                <td>" . documents_title($idDocument) ."</td>
                <td>  yyyy-mm-dd  </td>
                <td><button type=\"submit\" name=\"btn-cancel-resrv-unic\" class=\"btn btn-link\" onclick=\"return  confirm('do you want to delete transction N°: ". $row[0] . " .')\">Delete</button></td>
                </form></tr>";
        }       
    }
    $content .= "</table>";
    $conn->close();
    return $content;
}

// add Member
function add_member($name, $fstname, $adress, $telephone, $email, $password)
{  
    $conn = openConnect();   
    try
    {
        $query = "INSERT INTO membres (IdMembre, Nom, Prenom, Adresse, Telephone, Courriel, Password)
        VALUES(null, '$name', '$fstname', '$adress', '$telephone', '$email', '$password')";
        if ($conn->query($query)) {
            echo "<script>window.confirm('successfully registered member');</script>;";
        } else {
            echo "<script>alert('Wrong data!');</script>";
        }                
    }
    catch(mysqliException $e)
    {
        echo "<script>alert('Access to the database failed');</script>";
    }
    $conn->close();
}

// add Employe
function add_employe($name, $fstname, $telephone, $email, $province, $adress, $city, $postalCode, $date, $type, $password)
{
    $conn = openConnect(); 
    try
    {
        $query = "INSERT INTO employes (Matricule, Nom, Prenom, Telephone, Courriel, Province, Adresse, Ville, CodePostal, DateEmboche, Type, Password)
         VALUES(null, '$name', '$fstname', '$telephone', '$email', '$province', '$adress', '$city', '$postalCode', '$date', '$type', '$password')";
        if ($conn->query($query)) {
            echo "<script>window.confirm('successfully registered employe');</script>;";
        } else {
            echo "<script>alert('Wrong data!');</script>";
        }                
    }
    catch(mysqliException $e)
    {
        echo "<script>alert('Access to the database failed');</script>";
    }
    $conn->close();
}

//return name member
function member_name($idMember)
{
    $conn = openConnect(); 
    $query = "SELECT * FROM membres  WHERE IdMembre='$idMember' ";
    $query = $conn->query($query);
    if($query)
    {
        $query->data_seek(0);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $name = $row['Prenom']. " " .$row['Nom'];
    }
    else{
        Die ("failure to access");
    }    
    $conn->close();
    return $name;
}

//return document title
function documents_title($idDocument)
{
    $conn = openConnect(); 
    $query = "SELECT * FROM documents  WHERE IdDocument='$idDocument' ";
    $query = $conn->query($query);
    if($query)
    {
        $query->data_seek(0);
        $row = $query->fetch_array(MYSQLI_BOTH);
        $title = $row['Titre'];
    }
    else{
        Die ("failure to access");
    }    
    $conn->close();
    return $title;
}

//Delete reservation
function delete_reservation($idTransaction)
{
    $conn = openConnect();
    $query = "DELETE FROM transactions  WHERE IdTransaction =$idTransaction ";
    $query = $conn->query($query);
    if($query)
    {
        echo "<script>document.getElementById('message-box').textContent='success deletion reservation';</script>";
        echo "<script>document.getElementById('message-box').style.color = \"rgb(5, 204, 48)\";</script>";
        echo "<script>document.getElementById('message-box').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
    }
    $conn->close(); 
}

//Delete rental
function delete_rental($idTransaction, $idDocument)
{
    $conn = openConnect();
    $querytransac = "DELETE FROM transactions  WHERE IdTransaction =$idTransaction ";
    $querytransac = $conn->query($querytransac);
    if($querytransac)
    {
        $querydoc = "SELECT * FROM documents  WHERE IdDocument=$idDocument ";
        $querydoc =$conn->query($querydoc);
        if($querydoc)
        {
            $querydoc->data_seek(0);
            $row = $querydoc->fetch_array(MYSQLI_BOTH);
            $returnStock = $row['DocumentDisponible'] + 1 ;        
            $queryreturn = "UPDATE documents SET DocumentDisponible=$returnStock WHERE IdDocument=$idDocument" ;
            $queryreturn = $conn->query($queryreturn);
            if(!$queryreturn)
            {
                Die ("failure 3 to access");
            }
            else
            {                
                echo "<script>document.getElementById('message-box').textContent='success deletion rental';</script>";
                echo "<script>document.getElementById('message-box').style.color = \"rgb(5, 204, 48)\";</script>";
                echo "<script>document.getElementById('message-box').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
            }
        }
        else{
            Die ("failure 2 to access");
        }  
    }
    else{
        Die ("failure 1 to access");
    } 
    $conn->close(); 
}

//return documents
function documents_return($idTransaction, $idDocument)
{
    $conn = openConnect();
    $date = date('Y-m-d');
    $querytransac = "SELECT * FROM transactions  WHERE IdTransaction =$idTransaction ";    
    $querytransac = $conn->query($querytransac);
    if($querytransac)
    {
        $queryreturn = "UPDATE transactions SET RetourReel='$date' WHERE IdTransaction =$idTransaction" ;
        $queryreturn = $conn->query($queryreturn);
        if($queryreturn)
        {            
            $querydoc = "SELECT * FROM documents  WHERE IdDocument=$idDocument ";
            $querydoc =$conn->query($querydoc);
            if($querydoc)
            {
                $querydoc->data_seek(0);
                $row = $querydoc->fetch_array(MYSQLI_BOTH);
                $returnStock = $row['DocumentDisponible'] + 1 ;        
                $queryreturn = "UPDATE documents SET DocumentDisponible=$returnStock WHERE IdDocument=$idDocument" ;
                $queryreturn = $conn->query($queryreturn);
                $queryreserv = "SELECT * FROM transactions  WHERE IdDocument =$idDocument AND Type=2 ";
                $queryreserv = $conn->query($queryreserv);
            
                $row = $queryreserv->num_rows;
                if($row == 0)
                {
                    echo "<script>document.getElementById('message-box').textContent='success return document';</script>";
                    echo "<script>document.getElementById('message-box').style.color = \"rgb(5, 204, 48)\";</script>";
                    echo "<script>document.getElementById('message-box').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
                }
                else
                {
                    echo "<script>document.getElementById('message-box').textContent='success return document. This document is reserved';</script>";
                    echo "<script>document.getElementById('message-box').style.color = \"rgb(29, 94, 233)\";</script>";
                    echo "<script>document.getElementById('message-box').style.border = \"solid 1.5px rgb(29, 94, 233)\";</script>";
                }
            }
            else
            {
                Die ("failure 3 to access");
            }            
        }
        else{
            Die ("failure 2 to access");
        }
    }
    else{
        Die ("failure 1 to access");
    }
    $conn->close();
}

// forms reserve and loan
function reserve_form()
{
    $form = "<div class=\"rent-rsv-div\"><form method=\"post\" action=\"portail_employes.php\">
                <div><p class=\"form-rent-reserve-title\" id=\"reseve-title\"></p></div>
                <table>
                <tr>
                    <td ><label>Id Member:</label></td>
                    <td></td>
                </tr>
                <tr>
                    <td width=\"90%\"><input type=\"text\" class=\"form-control\" pattern=\"^[0-9]+$\" name=\"reserve-IdMember\" required></td>
                    <td width=\"10%\"><button type=\"submit\" name=\"btn-valid-reservation\" class=\"btn btn-success\" required>Valid</button></td>
                </tr> 
                </table>       
            </form> </div>";
    return $form;
}

function loan_form()
{
    $form = "<div class=\"rent-rsv-div\">
        <form method=\"post\" action=\"portail_employes.php\">
            <div><p class=\"form-rent-reserve-title\" id=\"loan-title\"></p></div>
            <table>
            <tr>
                <td><label>Return date:</label></td>
                <td><input type=\"date\" class=\"form-control\"  id=\"returnDate\" 
                 name=\"returnDate\" required></td>
                <td></td>
            </tr>
            <tr>
                <td ><label width=\"30%\">Id Member:</label></td>
                <td width=\"60%\"><input type=\"text\" class=\"form-control\" pattern=\"^[0-9]+$\" name=\"rent-IdMember\" required></td>
                <td width=\"10%\"><button type=\"submit\" name=\"btn-valid-rental\" class=\"btn btn-success\">Valid</button></td>
            </tr> 
            </table>       
        </form>        
    </div>";
    return $form;
}

// Reservation by employe 
function reservation($idDocument, $idMember, $matricule)
{
    $conn = openConnect();
    $type = 2;
    $date = date('Y-m-d');
    $query = "INSERT INTO transactions (IdDocument, IdMembre, MatriculeEmploye, Type, DateReservation) 
              VALUES ($idDocument, $idMember, $matricule, $type, '$date')";
    $query = $conn->query($query);

    if($query)
    {
        echo "<script>document.getElementById('transaction-box').textContent='reservation made with success';</script>";
        echo "<script>document.getElementById('transaction-box').style.color = \"rgb(5, 204, 48)\";</script>";
        echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
    }
    $conn->close();
}

// Reservation by member 
function mobile_booking($idDocument, $idMember)
{
    $conn = openConnect();
    $type = 2;
    $date = date('Y-m-d');
    $query = "INSERT INTO transactions (IdDocument, IdMembre,  Type, DateReservation) 
              VALUES ($idDocument, $idMember, $type, '$date')";
    $query = $conn->query($query);

    if($query)
    {
        $queryDoc = "SELECT * FROM documents WHERE IdDocument=$idDocument";
        $queryDoc = $conn->query($queryDoc);
        $queryDoc->data_seek(0);
        $row = $queryDoc->fetch_array(MYSQLI_ASSOC);
        if($row['DocumentDisponible'] > 0)
        {
            echo "<script>document.getElementById('message-box-reservation').textContent='Reservation made with success. You can pick it up during our opening hours';</script>";
            echo "<script>document.getElementById('message-box-reservation').style.color = \"rgb(5, 204, 48)\";</script>";
            echo "<script>document.getElementById('message-box-reservation').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
        }
        else{
            echo "<script>document.getElementById('message-box-reservation').textContent='Reservation made with success, a message will be sent to you as soon as it becomes available';</script>";
            echo "<script>document.getElementById('message-box-reservation').style.color = \"rgb(29, 94, 233)\";</script>";
            echo "<script>document.getElementById('message-box-reservation').style.border = \"solid 1.5px rgb(29, 94, 233)\";</script>";
        }
        
    }
    $conn->close();
}

// Borrowing
function rental($idDocument, $idMember, $matricule, $quantity, $returnDate)
{
    $conn = openConnect();
    $type = 1;
    $date = date('Y-m-d');
    $queryreserv = "SELECT * FROM transactions WHERE Type=2 AND IdDocument=$idDocument";
    $queryreserv = $conn->query($queryreserv);
    $row = $queryreserv->num_rows;
    if($quantity == 0)
    {
        echo "<script>document.getElementById('transaction-box').textContent='document not available in stock';</script>";
        echo "<script>document.getElementById('transaction-box').style.color = \"rgb(236, 12, 12)\";</script>";
        echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(236, 12, 12)\";</script>";
    }
    else if($row < $quantity)
    {
        $query = "INSERT INTO transactions (IdDocument, IdMembre, MatriculeEmploye, Type, DatePret, DateRetour) 
              VALUES ($idDocument, $idMember, $matricule, $type, '$date', '$returnDate')";        
        $query = $conn->query($query);

        $newQtity = $quantity - 1 ;
        $queryreturn = "UPDATE documents SET DocumentDisponible=$newQtity WHERE IdDocument=$idDocument" ;
                $queryreturn = $conn->query($queryreturn);
        echo "<script>document.getElementById('transaction-box').textContent='rental made with success';</script>";
        echo "<script>document.getElementById('transaction-box').style.color = \"rgb(5, 204, 48)\";</script>";
        echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
    }
    else
    {
        $queryreserv->data_seek(0);
        $reservation = $queryreserv->fetch_array(MYSQLI_BOTH);
        $idTransaction = $reservation['IdTransaction']; 
        if($reservation['IdMembre'] == $idMember)
        {
            $query = "INSERT INTO transactions (IdDocument, IdMembre, MatriculeEmploye, Type, DatePret, DateRetour) 
                VALUES ($idDocument, $idMember, $matricule, $type, '$date', '$returnDate')";        
            $query = $conn->query($query);

            $newQtity = $quantity - 1 ;
            $queryreturn = "UPDATE documents SET DocumentDisponible=$newQtity WHERE IdDocument=$idDocument" ;
            $queryreturn = $conn->query($queryreturn);
            
            $querydelete = "DELETE FROM transactions  WHERE IdTransaction = $idTransaction";
            $querydelete = $conn->query($querydelete);

            echo "<script>document.getElementById('transaction-box').textContent='rental made with success';</script>";
            echo "<script>document.getElementById('transaction-box').style.color = \"rgb(5, 204, 48)\";</script>";
            echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(5, 204, 48)\";</script>";
        }
        else
        {
            $name = member_name($reservation['IdMembre']);
            echo "<script>document.getElementById('transaction-box').textContent='this document can only be rent to M ".$name."';</script>";
            echo "<script>document.getElementById('transaction-box').style.color = \"rgb(29, 94, 233)\";</script>";
            echo "<script>document.getElementById('transaction-box').style.border = \"solid 1.5px rgb(29, 94, 233)\";</script>";
        }
    }
    $conn->close();
}
//check if the member id is valid
function check_member($idMember)
{
    $conn = openConnect();
    $query = "SELECT * FROM membres WHERE IdMembre=$idMember";
    $query = $conn->query($query);
    $row = $query->num_rows;
    if($row == 1) return true;
    else return false;
    $conn->close();
}

//check if the reservation has already been made
function check_reservation($idMember, $idDocument)
{
    $conn = openConnect();
    $query = "SELECT * FROM transactions WHERE IdMembre=$idMember AND IdDocument=$idDocument AND Type=2";
    $query = $conn->query($query);
    $row = $query->num_rows;
    if($row == 0) return false;
    else return true;
    $conn->close();
}

//return category of document
function return_category($id)
{
    $conn = openConnect(); 
    $query = "SELECT * FROM categories_documents WHERE IdCategorie=$id";
    $query = $conn->query($query);
    if($query)
    {
        $query->data_seek(0);
        $row = $query->fetch_array(MYSQLI_BOTH);
        return $row[1];
    }
    else{
        Die ("failure to access"); 
    }
    $conn->close();
}
//return Type of document
function return_type($id)
{
    $conn = openConnect(); 
    $query = "SELECT * FROM types_documents WHERE IdType=$id";
    $query = $conn->query($query);
    if($query)
    {
        $query->data_seek(0);
        $row = $query->fetch_array(MYSQLI_BOTH);
        return $row[1];
    }
    else{
        Die ("failure to access"); 
    }
    $conn->close();
}
//return document kind
function return_kind($id)
{
    $conn = openConnect(); 
    $query = "SELECT * FROM genre_documents WHERE IdGenre=$id";
    $query = $conn->query($query);
    if($query)
    {
        $query->data_seek(0);
        $row = $query->fetch_array(MYSQLI_BOTH);
        return $row[1];
    }
    else{
        Die ("failure to access"); 
    }
    $conn->close();
}
