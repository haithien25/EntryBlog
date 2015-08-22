<h3>Quản lý sách</h3>
<p>
    <a href="index.php?c=book&m=add" class="btn btn-primary">Thêm sách mới</a>
    <div class="pagination text-right">
      <ul>
        <li><a href="/admin/index.php?c=book&m=list&pagenum=<?php if($pagenum==0){echo 0;}else{echo $pagenum-1;} ?>"><<</a></li>
        <?php for ($i=1; $i<=$pages ; $i++): ?>
            <li><a href="/admin/index.php?c=book&m=list&pagenum=<?php echo $i-1 ?>"><?php echo $i ?></a></li>
        <?php endfor; ?>
        <li><a href="/admin/index.php?c=book&m=list&pagenum=<?php if($pagenum==$pages-1){echo $pages-1;}else{echo $pagenum+1;} ?>">>></a></li>
      </ul>
    </div>
</p>
<table class="table table-hover">
    <thead>
        <th>#</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Hình</th>
        <th>Mô tả</th>
        <th></th>
    </thead>
    <?php
        foreach ($books as $b):
    ?>
    <tr>
        <td><?php echo $b['id']; ?></td>
        <td><?php echo $b['name']; ?></td>
        <td><?php echo $b['price']; ?></td>
        <td>
            <img width="100px" height="100px" src="<?php echo '../../../images/'.$b['image']; ?>" class="img-rounded">
        </td>
        <td><?php echo $b['description'].'...'; ?></td>
        <td>
            <div class="text-center">
                <button class="btn btn-small btn-primary" onclick="location.href='/admin/index.php?c=book&m=update&bookid=<?php echo $b['id'] ?>';">Update</button><br><br>
                <button type="button" class="mimi btn btn-small btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo $b['id'] ?>" data-image="<?php echo $b['image'] ?>" data-name="<?php echo $b['name'] ?>">Delete</button>
            </div>
            <script type="text/javascript">
                $(document).on("click", ".mimi", function () {
                    var myBookId = $(this).data('id');
                    var myBookImg = $(this).data('image');
                    var myBookName = $(this).data('name');
                    document.getElementById("bookImg").src="../../../images/"+myBookImg;
                    $(".modal-body #bookName").val( myBookName );
                    document.getElementById("btnDel").setAttribute( "onClick", "location.href='/admin/index.php?c=book&m=delete&bookid="+myBookId+"';");
                });
            </script>
        </td>
    </tr>
    <?php        
        endforeach;
    ?>
</table>

    <!-- Modal -->
    <div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Verify Deleting</h3>
      </div>
      <div class="modal-body">
        <h4>Do you really want to delete it?</h4>
        <p>
            <img id="bookImg" width="100" height="100" src=""/>
            <output id="bookName" value=""/>
        </p>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button id="btnDel" class="btn btn-primary" onclick="">Delete</button>
      </div>
    </div>
    <!-- END Modal -->

<div class="pagination text-right">
  <ul>
    <li><a href="/admin/index.php?c=book&m=list&pagenum=<?php if($pagenum==0){echo 0;}else{echo $pagenum-1;} ?>"><<</a></li>
    <?php for ($i=1; $i<=$pages ; $i++): ?>
        <li><a href="/admin/index.php?c=book&m=list&pagenum=<?php echo $i-1 ?>"><?php echo $i ?></a></li>
    <?php endfor; ?>
    <li><a href="/admin/index.php?c=book&m=list&pagenum=<?php if($pagenum==$pages-1){echo $pages-1;}else{echo $pagenum+1;} ?>">>></a></li>
  </ul>
</div>