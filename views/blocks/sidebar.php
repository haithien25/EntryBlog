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
    <li><a href="index.php?c=book&m=list">Cửa hàng sách</a></li>
    <li>
        <a href="/index.php?c=cart&m=list">Giỏ hàng</a>
        <?php if(isset($_SESSION['cart'])): ?>
            <span class="posbadge badge badge-warning">
                <?php echo count($_SESSION['cart']); ?>
            </span>
        <?php endif; ?>
    </li>
    <li><a href="#">Gì đó</a></li>
</ul>
