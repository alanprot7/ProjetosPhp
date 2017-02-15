<?php

//função para evitar ataques por SQL Injection/
function mysql_safe_string($value) {
    $value = trim($value);
    if(empty($value))
		return 'NULL';
    elseif(is_numeric($value))
        return $value;
    else   
	    return "'".mysql_real_escape_string($value)."'";
}

function mysql_safe_query($query) {
    conect(); 
    $args = array_slice(func_get_args(),1);
    $args = array_map('mysql_safe_string',$args);
    return mysql_query(vsprintf($query,$args));
    mysql_close();
}

function redirect($uri) {
    header('location:'.$uri);
    exit;
}

function conect(){
    mysql_connect('localhost','root',"") or die("Não foi possível a conexão com o servidor");
    mysql_select_db('teste')or die("Não foi possível selecionar o banco de dados");
}

?>