<h3><?php echo $title ?></h3>

<?php if (isset($error)): ?>
<div class="alert alert-error">
    <?php echo $error; ?>
</div>
<?php endif; ?>

<form id="" class="form-horizontal" method="post" action="">
  <div class="control-group">
    <label class="control-label" for="inputTitle">Tiêu đề</label>
    <div class="controls">
      <input type="text" id="inputTitle" placeholder="Add title.." name="title" <?php if($title==='Chỉnh sửa bài viết'){foreach($single as $s):echo 'value="'.$s['title'].'"'; ?> />
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="inputContent">Nội dung</label>
    <div class="controls">
      <textarea class="comment" rows="15" placeholder="Content.." name="content"><?php echo $s['content'];endforeach;}else{?> />
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="inputContent">Nội dung</label>
    <div class="controls">
      <textarea class="comment" rows="15" placeholder="Content.." name="content"><?php } ?></textarea>
    </div>
  </div>

  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-primary">Lưu bài</button>
      <button type="button" class="btn" onclick="location.href='/index.php?c=blog&m=list'">Hủy</button>
    </div>
  </div>
</form>