<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/style.css">
    <title>Bibliotheque Municipale</title>
</head>
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
                            <h1>Connexion</h1>
                            <form class="form-inline" action="index.php" method="post">
                                <div class="form-group">
                                  <label>Email address</label>
                                  <input type="email" class="form-control" name="email" placeholder="Email" required>
                                </div>
                                <div class="form-group">
                                  <label>Password</label>
                                  <input type="password" name="password"  class="form-control" placeholder="Password" required>
                                </div>                                
                                <input type="submit" name="btn_connect" id="btn_connect" class="btn btn-primary" value='Sign in'>
                            </form>
                        </div>
                    </article>
                    <article class="col-xs-12 col-sm-10 col-md-5 col-lg-5">
                        <div class="design-general">
                            <h1>Aticles</h1>
                            <div ><img src="Images/bibliotheque.png" width=100%></div>
                            <div class="div-article"> 
                                <p>  For the well being of our community and a general cultural orientation very evolved,                                 
                                our Municipal Library offers to all  residents of Port-Cartier a wide range of books, records, films... <br>
                                All you have to do is show up with any document that proves you belong to our community to become a member, 
                                and benefit from reduced rates and exceptional service.                                    
                                </p>
                            </div>                          
                        </div>
                    </article>
                </div>
            </div>         
        </div>
    </div>

    
    <?php
        require_once 'fonctions.php';       
        $conn = openConnect();
        // btn Sign in
        if(isset($_POST['btn_connect']))
        {
            $email = mysql_entities_fix_string($conn, $_POST['email']);
            $password = mysql_entities_fix_string($conn, $_POST['password']);
            
            $queryadmin = "SELECT * from employes WHERE Courriel='$email'";
            $queryadmin = $conn->query($queryadmin);  
            $queryadmin->data_seek(0);
            $rowadmin = $queryadmin->fetch_array(MYSQLI_ASSOC);

            $querymembre = "SELECT * from membres WHERE Courriel='$email'";
            $querymembre = $conn->query($querymembre);  
            $querymembre->data_seek(0);
            $rowmembre = $querymembre->fetch_array(MYSQLI_ASSOC);
            
            if(is_null($rowadmin)  && is_null($rowmembre))
            {
                echo '<script>alert("utilisateur inconnu!");</script>';
            }
            elseif(is_null($rowmembre) && $rowadmin['Courriel'] == $email && $rowadmin['Password'] == $password)
            {
                session_start();
                $_SESSION['matricule'] = $rowadmin['Matricule'];
                $_SESSION['espace_membre'] = "<h2> Members Space</h2> ";
                $_SESSION['espace_document'] = "<h2> Document Space</h2> ";
                header('location: portail_employes.php');                               
            }
            elseif(is_null($rowadmin) && $rowmembre['Courriel'] == $email && $rowmembre['Password'] == $password)
            {
                session_start();
                $_SESSION['membreId'] = $rowmembre['IdMembre'];
                $_SESSION['DisplayWindow'] = display_new_documents();
                header('location: portail_client.php');
            }
            else
            {                
                echo '<script>alert("mot de passe érroné!");</script>';
                
            }                       
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