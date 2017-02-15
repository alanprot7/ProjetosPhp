<?php
session_start();
   
if ($_POST) {
    // Salva duas variáveis com o que foi digitado no formulário
	$username = strip_tags($_POST["username"]);
	$username = strtolower($username);
	$password = strip_tags($_POST["password"]);
 
	if (!empty($_POST['username']) && !empty($_POST['password'])){
	    // Monta uma consulta SQL (query) para procurar um usuário
	    include 'mysql.php';
	    $sql =  mysql_safe_query("SELECT * FROM usuarios WHERE username = '$username' AND password = '$password'");
        $login = mysql_fetch_assoc($sql);
	  
		// Verifica os dados digitados com os do bd
        if ($username == $login['username'] && $password == $login['password']) {
            $_SESSION['username'] = $username;
		    header('Location: logado.php');
		    // se estiver errado ou não existir
		}else {
	  	    echo "Usuário ou Senha inválidos";
		}
		mysql_close(); 
   }else
	   echo "Preencha todos os campos";
}
   
?>



<html>

<head>
    <meta charset="utf-8">
    <title>Login</title>
</head>

<body>
    <form action='login.php' method='post'>
        Usuário:<br> <input type='text' name='username' maxlength="50" /><br /> 
		Senha: <br><input type='password' name='password' maxlength="50" /><br />
        <input type='submit' name='submit' value='Login' />
    </form>
</body>

</html>