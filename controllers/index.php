<?php

function index_index() {
    redirect('/moneylover/index.php' . (isLogged() ? '?c=payment&m=list' : '?c=auth&m=login'));
}
