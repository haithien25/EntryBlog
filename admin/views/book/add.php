<h3><?php echo $title ?></h3>

<?php if (isset($error)): ?>
<div class="alert alert-error">
    <?php echo $error; ?>
</div>
<?php endif; ?>

<form id="" class="form-horizontal" method="post" action="" enctype="multipart/form-data">

  <?php if($title==='Chỉnh sửa sách'): ?>
      <div class="control-group">
        <label class="control-label" for="inputName">Tên sách</label>
        <div class="controls">
          <input type="text" id="inputName" placeholder="Update name.." name="name" value="<?php echo $single['name'] ?>"/>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="inputPrice">Giá bán</label>
        <div class="controls">
          <input type="text" id="inputPrice" placeholder="Update price.." name="price" value="<?php echo $single['price'] ?>" />
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="inputImage">Hình ảnh</label>
        <div class="controls">
          <input type="file" id="image" name="image"/>
          <img src="../../../images/<?php echo $single['image'] ?>" width="100" height="100">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="inputDscr">Mô tả</label>
        <div class="controls">
          <textarea id="inputDscr" placeholder="Update Description.." name="description"><?php echo $single['description'] ?></textarea>
        </div>
      </div>

  <?php endif;
    if($title==='Thêm sách mới'): ?>

    <div class="control-group">
      <label class="control-label" for="inputName">Tên sách</label>
      <div class="controls">
        <input type="text" id="inputName" placeholder="Add name.." name="name" />
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="inputPrice">Giá bán</label>
      <div class="controls">
        <input type="text" id="inputPrice" placeholder="Add price.." name="price" />
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="inputImage">Hình ảnh</label>
      <div class="controls">
        <input type="file" id="image" placeholder="Add image.." name="image"/>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="inputDscr">Mô tả</label>
      <div class="controls">
        <textarea id="inputDscr" placeholder="Add Description.." name="description"></textarea>
      </div>
    </div>

  <?php endif; ?>

  <script>
    CKEDITOR.replace( "description" );
  </script>

  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-primary">Lưu bài</button>
      <button type="button" class="btn" onclick="location.href='/admin/index.php?c=book&m=list'">Hủy</button>
    </div>
  </div>
</form>
