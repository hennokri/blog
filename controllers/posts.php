<?php

class posts extends Controller{

	function index(){
		$this->posts = get_all("SELECT * FROM post");
        $_tags = get_all("SELECT*FROM post_tags NATURAL JOIN tag");
        foreach( $_tags as $tag ){
            $this->tags[$tag['post_id']][] = $tag ['tag_name'];
        }
	}


    function index_ajax(){
		echo "\$_POST:<br>";
        var_dump($_POST);
    }

	function index_post(){
		echo "\$_POST:<br>";
		var_dump($_POST);
	}
    function view(){
        $this->tags = get_all("SELECT*FROM post_tags NATURAL JOIN tag WHERE post_id='$post_id'");
        $post_id = $this->params[0];
        $this->post = get_all("select * from post natural join user where post_id='$post_id'");
    }
}
