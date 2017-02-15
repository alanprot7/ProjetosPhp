<?php

include 'mysql.php';

if (!empty($_POST['title']) && !empty($_POST['body'])){
    if(mysql_safe_query('UPDATE posts SET title=%s, body=%s, date=%s WHERE id=%s', $_POST['title'], $_POST['body'], time(), $_GET['id']))
        redirect('post_view.php?id='.$_GET['id']);
}
else{
    if (isset($_POST['title']))
        if(empty(($_POST['title'])))
		    echo "Campo do titulo não pode ser vazio";
    if (isset($_POST['body']))
        if(empty(($_POST['body'])))
            echo "Campo da Mensagem não pode ser vazio";
}


$result = mysql_safe_query('SELECT * FROM posts WHERE id=%s', $_GET['id']);

if(!mysql_num_rows($result)) {
    echo 'Post #'.$_GET['id'].' não encontrado';
    exit;
}

$row = mysql_fetch_assoc($result);
mysql_close();   

echo <<<HTML
    <meta charset="utf-8">
    <form method="post">
        <table>
            <tr>
                <td><label for="title">Titulo</label></td>
                <td><input name="title" id="title" value="{$row['title']}" /></td>
            </tr>
            <tr>
                <td><label for="body">Mensagem</label></td>
                <td><textarea name="body" id="body">{$row['body']}</textarea></td>
            </tr>
            <tr>
                <td><input type="submit" value="Salvar"/></td>
            </tr>
        </table>
    </form>
HTML;

?>