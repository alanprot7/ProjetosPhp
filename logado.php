<html>

<head>
    <meta charset="utf-8">
    <title>Página do Administrador</title>
</head>

<body>
    
	<?php
    session_start();
    $username = ucfirst($_SESSION['username']);
    ?>
        
	<h1>Bem Vindo, <?php echo $username; ?>!</h1>
    <meta http-equiv="refresh" content=2;url="index.php">
</body>

</html>