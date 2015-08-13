<?php

function index_index() {
    redirect('/index.php' . (isLogged() ? '?c=blog&m=list' : '?c=blog&m=listpublic'));
}
