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
        setlocale(LC_ALL, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
        date_default_timezone_set("America/Fortaleza");

        if(!isset($_SESSION["username"]))
            session_start();
        
        include 'mysql.php';
		//mostra o post, buscando na tabela posts, LIMIT 1 faz com que só retorne 1 resultado
        $result = mysql_safe_query('SELECT * FROM posts WHERE id=%s LIMIT 1', $_GET['id']);
        
        if(!mysql_num_rows($result)) {  //verifica se tem algum post
            echo 'Post #'.$_GET['id'].' não encontrado';
            exit;
        }

        $row = mysql_fetch_assoc($result);
        echo '<h2>'.$row['title'].'</h2>';  //exibi o titulo na tela
        echo '<em>Postado em '.strftime('%d, de %B de %Y', $row['date']).'</em><br/>';  //exibe a data
        echo nl2br($row['body']).'<br/>';  //exibi o post na tela

        if(isset($_SESSION["username"])){
            echo '<a href="post_edit.php?id='.$_GET['id'].'">Editar</a> | <a href="post_delete.php?id='.$_GET['id'].'">Excluir</a>';
        }
	   
    	echo '| <a href="index.php">Página Inicial</a>';
        echo '<hr/>';
        
		//exibir os comentarios em uma lista ordenada
        $result = mysql_safe_query('SELECT * FROM comments WHERE post_id=%s ORDER BY date ASC', $_GET['id']);
        echo '<ol id="comments">';
        while($row = mysql_fetch_assoc($result)) {
            echo '<li id="post-'.$row['id'].'">';
    
            echo (empty($row['website'])?'<strong>'.$row['name'].'</strong>':'<a href="'.$row['website'].'" target="_blank">'.$row['name'].'</a>');
            if(isset($_SESSION["username"])){
	            echo ' (<a href="comment_delete.php?id='.$row['id'].'&post='.$_GET['id'].'">Excluir</a>)';
                echo " IP: ".$row['end_ip'];
            }
	        echo "<br>";
            echo '<small>'.strftime('%d de %B de %Y %H:%M:%S', $row['date']).'</small><br/>';
            echo nl2br($row['content']);
            echo '</li>';
        }
        echo '</ol>';
        mysql_close();
    
        $ip = getenv('REMOTE_ADDR');
        
        echo <<<HTML
        <form method="post" action="comment_add.php?id={$_GET['id']}">
            <input type="hidden" name="ip" value="$ip">
            <table>
                <tr>
                    <td><label for="name">Nome:</label></td>
                    <td><input name="name" id="name" value=""/></td>
                </tr>
                <tr>
                    <td><label for="content">Comentario:</label></td>
                    <td><textarea name="content" id="content"></textarea></td>
                </tr>
                <tr>
                <td><input type="submit" value="Postar Comentario"/></td>
                </tr>
	        </table>
        </form>
HTML;

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