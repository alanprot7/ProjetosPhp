<html>

<head>
    <link rel="stylesheet" type="text/css" href="estilo.css">
		<link rel = "icon" href = "favicon.png">
    <meta charset="utf-8">
    <title>Dicas Tecnológicas</title>
</head>

<body>
    <div class="container">
        <div class="topo">
            <h1>Dicas Tecnológicas</h1>
            <br>
        </div>
        <div class="clear"></div>
        <div class="menu">
					<nav>
						<ul>
							<li><a href = "index.php">Página Inicial</a></li>
						</ul>
					</nav>
				</div>
        <br/>
        <div class="corpo">
        <div class="artigo">
    
	    <?php
        include 'mysql.php';
	
        $result = mysql_safe_query('SELECT * FROM posts ORDER BY date DESC');

        if(!mysql_num_rows($result)) {
            echo 'Ainda não existem posts.';
        } 
	    else {
            while($row = mysql_fetch_assoc($result)) {
                echo '<h2>'.$row['title'].'</h2>';
                $body = substr($row['body'], 0, 300);
                echo nl2br($body).'...<br/>';
                echo '<a href="post_view.php?id='.$row['id'].'">Ver mais</a> | ';
                echo '<a href="post_view.php?id='.$row['id'].'#comments">'.$row['num_comments'].' comentarios</a>';    
                echo '<hr/>';
            }
        }
        ?>
        </div>
        </div>
        <div class="lateral">
            <h3>
							Sobre
               <img src = "logo.png" />
							 <p> A equipe amarela criada no dia primeiro de abril de 2016, com o intuito de desenvolver um blog que poste diariamente as melhores dicas de tecnologia e manter os geeks e nerds atualizados. </p>   
            </h3>
            <br>
            <em>Perfil do Administrador</em><hr/>
            <?php
           
            if(!isset($_SESSION["username"]))
                session_start();
        
            if (isset($_SESSION["username"])){
                echo "Nome: ".$_SESSION["username"]."<BR>";
                echo" <form method=\"post\" action=\"admin.php\">
            <table>
                <tr>
                    <td><label for=\"title\">Titulo:</label><br>
                    <input name=\"title\" id=\"title\" /></td>
                </tr>
                <tr>
                    <td><label for=\"body\">Mensagem:</label><br>
                    <textarea name=\"body\" id=\"body\"></textarea></td>
                </tr>
                <tr>
                    <td><input type=\"submit\" value=\"Postar\" /></td>
                </tr>
            </table>
            </form>		

            <a href=\"logout.php\">Logout</a>";
            }
            else
                include 'login.php';
            ?>   
            <!--a href="admin.php">Admin</a-->
            </br>
        </div>
        <div class="clear"></div>
		<!--/footer-->
    </div>
		<footer>
		<p> Desenvolvido por Equipe Amarela </p>
		</footer>
</body>

</html>