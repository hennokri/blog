<?php
/**
 * Created by PhpStorm.
 * User: Hanzo
 * Date: 17.09.14
 * Time: 18:31
 */

class users extends Controller{

    public $requires_auth = true;

    function index () {
        $user_id = $this->params[0];
        $this->users = get_first("SELECT * FROM user WHERE user_id = '$user_id'");
    }
    function view() {
        $user_id = $this->params[0];
        $this->user = get_first ("SELECT * FROM user WHERE user_id = '$user_id'");
    }

}