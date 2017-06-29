<#include "/WEB-INF/pages/includes/macros.ftl">
<link rel="stylesheet" type="text/css" href="/roctools/static/easyui/themes/default/easyui.css"
      xmlns="http://www.w3.org/1999/html">
<link rel="stylesheet" type="text/css" href="/roctools/static/easyui/themes/icon.css">
<script src="/roctools/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/roctools/static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/roctools/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/roctools/static/js/ajaxfileupload.js"></script>
<script type="text/javascript">

</script>
<div>
    <div class="row" style="margin: 1em 1em 1em 0">
        <div class="col-md-6">
            <label>MTPoiId</label>
            <input id="id" type="textarea" class="form-control" style="display: inline-block;width: 60%; height: auto"/>
        </div>
        <div class="col-md-3">
            <a id="queryIds" class="btn btn-success">查询</a>
        </div>
    </div>

    <div id="searchResult" style="margin: 0 1em 0 1em">
        <div class="row table-info">
            <div class="col-md-12">
                <table class="table table-striped" style="border: 1px">
                    <thead>
                        <th width="30%">门店信息</th>
                        <th></th>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#queryIds").click(function(){
        queryShop();
    });

    function queryShop(){
        if(!checkRequired()) return;

        var data = {
            mtPoiId : $("#id").val(),
        };

        $.ajax({
            type:"GET",
            url:"../roctools/mtshopsearch",
            data:data,
            success: function(result){
                if(result.code==200){
                    $("tbody").empty();
                    var shop = result.msg;

                    $("tbody").append("<tr><td>美团poiId</td><td>"+shop.mtPoiId+"</td></tr>");
                    $("tbody").append("<tr><td>美团责任销售loginId</td><td>"+shop.mtOwnerId+"</td></tr>");
                    $("tbody").append("<tr><td>美团责任销售姓名</td><td>"+shop.mtOwnerName+"</td></tr>");
                    $("tbody").append("<tr><td>点评poiId</td><td>"+shop.dpShop.shopId+"</td></tr>");
                    $("tbody").append("<tr><td>点评战区</td><td>"+shop.dpShop.territoryName+"</td></tr>");
                    $("tbody").append("<tr><td>点评rotateId</td><td>"+shop.dpShop.rotateId+"</td></tr>");
                    $("tbody").append("<tr><td>点评责任销售loginId</td><td>"+shop.dpShop.ownerId+"</td></tr>");
                    $("tbody").append("<tr><td>点评责任销售</td><td>"+shop.dpShop.owner+"</td></tr>");

                } else {
                    alert("查询出错："+result.msg);
                }
            }
        });
    }

    function checkRequired(){
        if(!$("#id").val()){
            alert("请输入id");
            return false;
        }
        return true;
    }
</script>