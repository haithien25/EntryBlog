<h3>Menu Chính</h3>
<ul class="nav nav-tabs nav-stacked">
    <?php if ($logged = isLogged()): ?>
    <li><a href="index.php?c=blog&m=list">Welcome <strong><?php echo $logged['name']; ?></strong></a></li>
    <li><a href="index.php?c=auth&m=logout">Logout</a></li>
    <?php else: ?>
    <li><a href="index.php?c=auth&m=login">Login</a></li>
    <li><a href="index.php?c=auth&m=register">Register</a></li>
    <?php endif; ?>
</ul>

<ul class="nav nav-tabs nav-stacked">
    <li><a href="index.php?c=blog&m=listpublic">Bài đăng gần đây</a></li>
</ul>
