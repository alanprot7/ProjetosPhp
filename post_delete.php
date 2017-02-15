<?php

include 'mysql.php';

mysql_safe_query('DELETE FROM posts WHERE id=%s LIMIT 1', $_GET['id']); //apaga o post
mysql_safe_query('DELETE FROM comments WHERE post_id=%s', $_GET['id']); //apaga todos os comentarios que existiam no post
redirect('index.php');

mysql_close();

?>