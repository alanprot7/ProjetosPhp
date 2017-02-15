<?php
include 'mysql.php';

    $name = htmlspecialchars($_POST['name']);
    $content = htmlspecialchars($_POST['content']);    

mysql_safe_query('INSERT INTO comments (post_id,name,content,date,end_ip) VALUES (%s,%s,%s,%s,%s)', 
    $_GET['id'], $name, $content, time(),$_POST['ip']);
mysql_safe_query('UPDATE posts SET num_comments= (SELECT COUNT(*) FROM comments WHERE POST_ID =%s) WHERE id=%s LIMIT 1', $_GET['id'],$_GET['id'] );
redirect('post_view.php?id='.$_GET['id'].'#post-'.mysql_insert_id());
mysql_close();

?>