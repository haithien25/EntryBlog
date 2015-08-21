<h3>Cửa hàng sách</h3>
<?php if(isset($info)): ?>
    <div id="alert" class="alert alert-success">
      <button type="button" class="close" data-dismiss="alert">×</button>
      <?php echo $info; unset($info); ?>
    </div>
<?php endif; ?>
<p>
    <div class="pagination text-right">
      <ul>
        <li><a href="/index.php?c=book&m=list&pagenum=<?php if($pagenum==0){echo 0;}else{echo $pagenum-1;} ?>"><<</a></li>
        <?php for ($i=1; $i<=$pages ; $i++): ?>
            <li><a href="/index.php?c=book&m=list&pagenum=<?php echo $i-1 ?>"><?php echo $i ?></a></li>
        <?php endfor; ?>
        <li><a href="/index.php?c=book&m=list&pagenum=<?php if($pagenum==$pages-1){echo $pages-1;}else{echo $pagenum+1;} ?>">>></a></li>
      </ul>
    </div>
</p>

<div class="row row_book">
<?php
    $i=0;
    foreach ($books as $b):
    $i++;
?>
    <div class="span3 text-center">
        <form id="" class="form-horizontal" method="post" action="">
          <div class="thumbnail" style="height: 320px;">
            <a data-toggle="popover" data-trigger="hover" data-html="true" title="<?php echo $b['name'] ?>" data-content='<?php echo $b['description'] ?>'>
              <img style="height: 180px;" alt="hư òi" src="../../images/<?php echo $b['image'] ?>" class="img-polaroid">
              <script>
                $(document).ready(function(){
                    $('[data-toggle="popover"]').popover(); 
                });
              </script>
            </a>
            <p class="book_name">
              <?php
                if(strlen($b['name']) > strlen($b['miname']))
                  echo $b['miname'].'...';
                else
                  echo $b['miname'];
              ?>
            </p>
            <h4><?php echo number_format($b['price'], 0, ',', '.') ?><sup>đ</sup></h4>
            <p>
              <button type="button" class="mimi btn btn-small btn-warning" data-toggle="modal" data-target="#cartModal" data-id="<?php echo $b['id'] ?>" data-image="<?php echo $b['image'] ?>" data-name="<?php echo $b['name'] ?>" data-price="<?php echo $b['price'] ?>">Đặt mua</button>
            </p>
          </div>
        </form>
    </div>
    <?php if($i%4==0): ?>
</div>
<div class="row row_book">
<?php
    endif;
    endforeach;
?>
</div>

    <script type="text/javascript">
        Number.prototype.formatMoney = function(c, d, t){
        var n = this, 
            c = isNaN(c = Math.abs(c)) ? 2 : c, 
            d = d == undefined ? "." : d, 
            t = t == undefined ? "," : t, 
            s = n < 0 ? "-" : "", 
            i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
            j = (j = i.length) > 3 ? j % 3 : 0;
           return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
         };

         $(document).on("click", ".mimi", function () {
            var myBookId = $(this).data('id');
            var myBookImg = $(this).data('image');
            var myBookName = $(this).data('name');
            var myBookPrice = $(this).data('price').formatMoney(0, ',', '.');
            document.getElementById("bookImg").src="../../../images/"+myBookImg;
            $(".modal-body #bookName").val( myBookName );
            $(".modal-body #bookPrice").val( myBookPrice );
            $(".modal-body #bookId").val( myBookId );
            $(".modal-body #quantity").val("1");
            $(".modal-body #total").val( myBookPrice );
            document.getElementById("btnAdd");
        });
    </script>
    <!-- Modal -->
    <form id="" class="form-horizontal" method="post" action="">
        <div id="cartModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Thêm sách vào giỏ</h3>
          </div>
          <div class="modal-body">
            <table class="table table-bordered">
              <tr>
                <td>
                  <img id="bookImg" src="" width="100" height="100" />
                  <input type="hidden" id="bookId" name="aidi"/>
                </td>
                <td>
                  <output id="bookName"/>
                </td>
                <td>
                  <output id="bookPrice"/>
                </td>
                <td>
                  <input id="quantity" type="number" class="input-mini" name="quantity" onchange="calculateTotal()" onkeyup="calculateTotal()" />
                </td>
                <td>
                  <p>Tổng:</p>
                  <h4><output id="total"/></h4>
                </td>
              </tr>
            </table>
          </div>
          <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Hủy</button>
            <button type="submit" id="btnAdd" class="btn btn-primary">Thêm vào giỏ hàng</button>
          </div>
        </div>
    </form>

    <script>
      function calculateTotal() {
          var quantity=parseInt(document.getElementById("quantity").value);
          var price=parseInt(document.getElementById("bookPrice").value)*1000;
          if (quantity.length == 0) { 
              document.getElementById("total").value = "0";
              return;
          } else {
              var xmlhttp = new XMLHttpRequest();
              xmlhttp.onreadystatechange = function() {
                  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                      document.getElementById("total").value = xmlhttp.responseText;
                  }
              }
              xmlhttp.open("GET", "/index.php?c=cart&m=calculateTotal&q=" + quantity + "&p=" + price, true);
              xmlhttp.send();
          }
      }
    </script>
    <!-- END Modal -->

<div class="pagination text-right">
  <ul>
    <li><a href="/index.php?c=book&m=list&pagenum=<?php if($pagenum==0){echo 0;}else{echo $pagenum-1;} ?>"><<</a></li>
    <?php for ($i=1; $i<=$pages ; $i++): ?>
        <li><a href="/index.php?c=book&m=list&pagenum=<?php echo $i-1 ?>"><?php echo $i ?></a></li>
    <?php endfor; ?>
    <li><a href="/index.php?c=book&m=list&pagenum=<?php if($pagenum==$pages-1){echo $pages-1;}else{echo $pagenum+1;} ?>">>></a></li>
  </ul>
</div>