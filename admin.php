<?php
session_start();
include 'mysql.php';
	
if (isset($_SESSION['username'])){
	$username = ucfirst($_SESSION['username']);
		
	if(!empty($_POST)) {
        if(mysql_safe_query('INSERT INTO posts (title,body,date) VALUES (%s,%s,%s)', $_POST['title'], $_POST['body'], time()))
            echo '<h3>Post com sucesso.</h3>';
	    else{
            if (empty($_POST['title']))
			    echo "Campo Titulo não pode ser vazio";
		    else if (empty($_POST['body']))
			    echo "Campo da Mensagem não pode ser vazio";
	    }
	}   
	
}
else{
	header('Location: login.php');
	die();
}

mysql_close();

?>


<html>

<head>
    <meta charset="utf-8">
    <title>Status Postagem</title>
</head>

<body>
    <meta http-equiv="refresh" content=1;url="index.php">
</body>

</html>


