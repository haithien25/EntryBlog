<h3>Quản lý bài đăng</h3>
<p>
    <a href="index.php?c=blog&m=add" class="btn btn-primary">Thêm bài viết mới</a>
</p>
<table class="table table-striped">
    <tr>
        <th>#</th>
        <th>Tiêu đề</th>
        <th>Ngày đăng</th>
        <th>Nội dung</th>
    </tr>
    <?php
        $i = 0;
        foreach ($entrys as $e):
        $i++;
    ?>
    <tr>
        <td><?php echo $i; ?></td>
        <td><?php echo $e['title']; ?></td>
        <td><?php echo $e['posted_day']; ?></td>
        <td>
            <?php echo $e['content']; ?>
            <div class="text-right">
                <button class="btn btn-small btn-primary" onclick="location.href='/index.php?c=blog&m=update&entry=<?php echo $e['id'] ?>';">Update</button>
                <button class="btn btn-small btn-danger" onclick="location.href='/index.php?c=blog&m=delete&entry=<?php echo $e['id'] ?>';">Delete</button>
            </div>
        </td>
    </tr>
    <?php        
        endforeach;
    ?>
    <tr>
        <td colspan="3"><strong>Tổng cộng:</strong></td>
        <td class="text-right"><strong><?php echo $i.' bài đăng.' ?></strong></td>
    </tr>
</table>