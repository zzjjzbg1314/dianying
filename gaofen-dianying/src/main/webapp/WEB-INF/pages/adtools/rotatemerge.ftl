<#include "/WEB-INF/pages/includes/macros.ftl">
<link rel="stylesheet" type="text/css" href="/roctools/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/roctools/static/easyui/themes/icon.css">
<script src="/roctools/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/roctools/static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/roctools/static/easyui/jquery.easyui.min.js"></script>
<div class="panel panel-info">
    <div class="row">
        <div class="col-md-3" >
            <div class="form-group" >
                <select id="bizId"" class="form-control">
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <label>RotateGroupIds</label>
            <input id="ids" type="textarea" class="form-control" style="display: inline-block;width: 60%; height: auto"/>
        </div>
        <div class="col-md-3">
            <a id="queryIds" class="btn btn-success">查询</a>
        </div>
    </div>


    <div class="row" style="padding-top: 20px ">
        <div class="col-md-6">
            <a id="sign" class="btn btn-mini btn-default" actiontype="0">合并轮转组</a>
        </div>
    </div>
    <div id="searchResult">
        <div class="row table-info">
            <div class="col-md-12">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"/></th>
                        <th>门店城市</th>
                        <th>门店名称</th>
                        <th>客户类型</th>
                        <th>门店状态</th>
                        <th>推荐客户</th>
                        <th>优质客户</th>
                        <th>ShopGroupId</th>
                        <th>RotateId</th>
                        <th>ShopId</th>
                        <th>责任销售</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script data-id="shop-tpl" type="text/template">
    <tr>
        <td><input type="checkbox" id="<%= rotateId %>" class="selectFlag"/></td>
        <td><%= cityName %></td>
        <td><%= shopName %></td>
        <td><%= bigCustomer %></td>
        <td><%= shopStatus %></td>
        <td><%= recommend %></td>
        <td><%= highQuality %></td>
        <td><%= shopGroupId %></td>
        <td><%= rotateId %></td>
        <td><%= shopId %></td>
        <td><%= owner %></td>
    </tr>
</script>

<script type="text/javascript">
    $.ajax({
        type: 'GET',
        url: '../roctools/getBizTypes',
        success: function (data) {
            if(data) {
                $.each(data,function(key,value){
                    if(key == 104){
                        $("#bizId").append('<option value="'+key+'" selected="selected"">'+value+'</option>');
                    }else
                    {
                        $("#bizId").append('<option value="'+key+'">'+value+'</option>');
                    }
                });
            } else {
                alert("获取BIZ失败");
            }
        }
    });

    $("#checkAll").click(function() {
        if (this.checked) {
            $(".selectFlag").each(function() {
                this.checked = true;
            })
        } else {   //反之 取消全选
            $(".selectFlag").each(function() {
                this.checked = false;
            })
        }
    });

    $("a#sign").click(function(){
        var rotateIds = [];
        $("td input:checkbox:checked").each(function(item){
            rotateIds.push($(this).attr("id"));
        });

        if(rotateIds.length==0) {
            alert("请先选中要设置的门店");
            return;
        }

        var bizId = $("#bizId").val();

        var data = {
            bizId:bizId,
            selectedRotateIds:rotateIds
        };
        $.ajax({
            type: 'POST',
            url: '../roctools/merge',
            context: $(this),
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            success: function (data) {
                if(data.code == 200) {
                    alert("合并成功");
                    queryShop();
                } else {
                    alert("合并失败："+data.msg)
                }
            },
            error:function(code,err){
                alert("系统错误")
            }
        });
    });

    $("#queryIds").click(function(){
        queryShop();
    });

    function queryShop(){
        if(!checkRequired()) return;

        var data = {
            bizId: $("#bizId").val(),
            ids : $("#ids").val(),
        };

        $.ajax({
            type:"GET",
            url:"../roctools/rotatesearch",
            data:data,
            success: function(result){
                if(result.code==200){
                    var shopTpl = _.template($('[data-id="shop-tpl"]').html());
                    $("tbody").empty();
                    var shops = result.msg;
                    for(index in shops){
                        $("tbody").append(shopTpl(shops[index]));
                    }
                } else {
                    alert("查询出错:"+result.msg);
                }
            }
        });
    }

    function checkRequired(){
        if(!$("#ids").val()){
            alert("请输入id");
            return false;
        }
        return true;
    }

</script>