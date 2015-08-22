<h3>Menu Chính</h3>
<ul class="nav nav-tabs nav-stacked">
    <?php if ($logged = adminLogged()): ?>
    <li><a href="index.php?c=bill&m=list">Welcome <strong><?php echo $logged['username']; ?></strong></a></li>
    <li><a href="index.php?c=admin&m=logout">Logout</a></li>
    <?php else: ?>
    <li><a href="index.php?c=admin&m=login">Login</a></li>
    <?php endif; ?>
</ul>

<ul class="nav nav-tabs nav-stacked">
    <li><a href="index.php?c=bill&m=list">Quản lý đơn hàng</a></li>
    <li><a href="index.php?c=book&m=list">Quản lý sách</a></li>
</ul>
