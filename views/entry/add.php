<h3>Thêm bài viết mới</h3>

<?php if (isset($error)): ?>
<div class="alert alert-error">
    <?php echo $error; ?>
</div>
<?php endif; ?>

<form id="" class="form-horizontal" method="post" action="">
  <div class="control-group">
    <label class="control-label" for="inputTitle">Tiêu đề</label>
    <div class="controls">
      <input type="text" id="inputTitle" placeholder="Add title.." name="title" />
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="inputContent">Nội dung</label>
    <div class="controls">
      <input type="text" id="inputContent" placeholder="Content.." name="content" />
    </div>
  </div>

  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-primary">Lưu bài</button>
    </div>
  </div>
</form>