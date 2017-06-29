<#include "/WEB-INF/pages/includes/macros.ftl">
<link rel="stylesheet" type="text/css" href="/roctools/static/css/bootstrap.min.css">
<script type="text/javascript" src="/roctools/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/roctools/static/js/bootstrap.min.js"></script>

<div class="container">
    <form id = "splitQueryForm" class="form-inline" action="/roctools/searchshopsplit" method="post">
        <div class="row">
            <div class="form-group">
                <label class="control-label">业务</label>
                <select class="form-control" id = "bizId" name = "bizId" style="margin-left: 10px;">
                </select>
            </div>
            <div class="form-group" style="margin-left: 30px;">
                <label class="control-label">查询类型</label>
                <select class="form-control" id="idType" style="margin-left: 10px;">
                    <option value="rotateGroupId" >rotateGroupId</option>
                    <option value="shopGroupId" >shopGroupId</option>
                    <option value="shopId" >shopId</option>
                </select>
            </div>
            <div class="form-group" style="margin-left: 5px;">
                <input type="text" name = "ids" class="form-control" id="ids" value="${ids!}"
                       placeholder="请输入相应查询类型的查询ids" style="width: 260px;">
            </div>
            <div class="form-group"  style="margin-left: 30px;">
                <button type="button" id = "splitQueryButton" class="btn btn-primary active" style="width: 140px;">查询</button>
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <button type="button" id="splitButton" class="btn btn-primary active" style="width: 150px;">拆分轮转组</button>
            <p class="form-control-static  label-warning" style="font-size: 16px">
            </p>
        </div>

    <#--<div class="alert alert-error">-->
            <#--<button type="button" class="close" data-dismiss="alert">&times;</button>-->
            <#--&lt;#&ndash;<h4>Warning!</h4>&ndash;&gt;-->
            <#--Best check yo self, you're not...-->
        <#--</div>-->

        <#--<div class="col-sm-6" >-->
            <#--<p class="form-control-static red" style="font-size: 18px">-->
                <#--该轮转组为特大轮转组，门店数-->
            <#--</p>-->
        <#--</div>-->

        <div class="row" style="margin-top: 5px;">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th style="text-align: center">选择</th>
                        <th>门店城市</th>
                        <th>门店名称</th>
                        <th>客户类型</th>
                        <th>门店状态</th>
                        <th>shopGroupId</th>
                        <th>rotateGroupId</th>
                        <th>shopId</th>
                        <th>责任销售</th>
                    </tr>
                </thead>
                <tbody>
                <#--<#list searchResult as shopModel>-->
                    <#--<tr>-->
                        <#--<td style="text-align: center"> <input type="checkbox" name="shopId" value="${shopModel.shopId}"></td>-->
                        <#--<td>${shopModel.cityName!'未知'}</td>-->
                        <#--<td>${shopModel.shopName!'未知'}</td>-->
                        <#--<td>${shopModel.bigCustomer!'暂无类型'}</td>-->
                        <#--<td>${shopModel.shopStatus!'暂无'}</td>-->
                        <#--<td>${shopModel.shopGroupId!'暂无'}</td>-->
                        <#--<td>${shopModel.rotateId!'暂无'}</td>-->
                        <#--<td>${shopModel.shopId!'暂无'}</td>-->
                        <#--<td>${shopModel.owner!'暂无'}</td>-->
                    <#--</tr>-->
                <#--</#list>-->
                </tbody>
            </table>
        </div>
    </form>
</div>
<script data-id="shop-tpl" type="text/template">
    <tr>
        <td><input type="checkbox" name="shopId" value="<%= shopId %>" class="selectFlag"/></td>
        <td><%= cityName %></td>
        <td><%= shopName %></td>
        <td><%= bigCustomer %></td>
        <td><%= shopStatus %></td>
        <td><%= shopGroupId %></td>
        <td><%= rotateId %></td>
        <td><%= shopId %></td>
        <td><%= owner %></td>
    </tr>
</script>

<script type = "text/javascript">

    $(function(){
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

        $("#splitQueryButton").click(function()
        {
            var ids = $("#ids").val();
            var bizId= $("#bizId").val();
            var idType= $("#idType").val();

            if(ids == null || ids == "")
            {
                alert("请输入查询ids");
                return false;
            }
            var reg =/^\d+\s*(\s*,?\s*\d+)*,?\s*$/;
            var result=  reg.test(ids);
            if(result)
//                $("#splitQueryForm").submit();
                $.ajax( {
                    url:'/roctools/searchshopsplit',
                    data:{
                        ids : ids,
                        idType : idType,
                        bizId : bizId
                    },
                    type:'get',
                    cache:false,
                    dataType:'json',
                    success:function(data) {
                        if(data.code == 200 ){
                            var shopTpl = _.template($('[data-id="shop-tpl"]').html());
                            $("tbody").empty();
                            $("p").text("");
                            var shops = data.msg;
                            var status = 0;
                            for (index in shops) {
                                $("tbody").append(shopTpl(shops[index]));
                                if(index != 0&&shops[index].rotateId != shops[index - 1].rotateId){
                                    status = 0;
                                }

                                if ( status == 0&&shops[index].shopIdNum != null) {
                                    $("p").append('<b>轮转组' + shops[index].rotateId + '为特大轮转组，门店数:' + shops[index].shopIdNum + '&nbsp;&nbsp;&nbsp;若在下面前50家中没有找到门店,请通过shopId查找指定门店!!! </b>');
                                    $("p").show();
                                    status = 1;
                                }
                            }

                        }
                        else
                        {
                            alert("查询失败: "+data.msg);
                        }
                    },
                    error : function() {
                        alert("服务器处理异常");
                    }
                });
            else
                alert("您输入的ids的格式有误，请重新输入");
        });

        $("#splitButton").click(function()
        {

            var shopIds;
            var rotateGroupId;
            var shopGroupIds;
            var bizId = $("#bizId").val();
            var rotateGroupFlag = true;
            var shopIdsFlag =true;
            $("input[type = 'checkbox']:checked").each(function()
            {
                var shopId = $(this).val();
                var $tds = $(this).parents("tr").children("td");
                var shopGroupId_td = $tds.eq(5).text();
                var rotateGroupId_td = $tds.eq(6).text();
                if(shopId == null || shopId == "" || rotateGroupId_td == null || rotateGroupId_td == "" || shopGroupId_td == null || shopGroupId_td == "")
                {
                    alert("您勾选的shopId、rotateGroupId、shopGroupId中有空值，请再次进行检查");
                    $("#splitButton").attr({"disabled":"disabled"});
                    shopIdsFlag = false;
                    return false;
                }
                if(shopIds == null || shopIds == "")
                {
                    shopIds = shopId;
                }
                else
                {
                    shopIds = shopIds + "," + shopId;
                }
                if(rotateGroupId == null || rotateGroupId == "")
                {
                    rotateGroupId = rotateGroupId_td;
                }
                else
                {
                    if(rotateGroupId != rotateGroupId_td)
                    {
                        alert("rotateGroupId " + rotateGroupId + "," + rotateGroupId_td + "不是同一轮转组,不能进行拆分");
                        rotateGroupFlag = false;
                        return false;
                    }
                }
                if(shopGroupIds == null || shopGroupIds == "")
                {
                    shopGroupIds = shopGroupId_td;
                }
                else
                {
                    shopGroupIds = shopGroupIds + "," + shopGroupId_td;
                }
            });
            if(shopIds == null || shopIds == "")
            {
                alert("请选择需要处理的门店");
                $("#splitButton").removeAttr("disabled");
                return false;
            }
            if(shopIdsFlag && rotateGroupFlag)
                createRotateGroup(shopIds,rotateGroupId,shopGroupIds,bizId);
            else
                return false;
        });

        function createRotateGroup(shopIds,rotateGroupId,shopGroupIds,bizId)
        {
            $.ajax( {
                url:'/roctools/createrotategroup',
                data:{
                    shopIds : shopIds,
                    rotateGroupId : rotateGroupId,
                    shopGroupIds : shopGroupIds,
                    bizId : bizId
                },
                type:'post',
                cache:false,
                dataType:'json',
                success:function(data) {
                    if(data.code == 200 ){
                        alert("拆分成功！");
                        $("table").eq(0).find("tr").css("background-color","#FFFFFF");
                        $("input[type = 'checkbox']:checked").each(function(){

                            $(this).attr("checked",false);
                            var $tr = $(this).parents("tr");
                            var $tds = $tr.children("td");
                            $tds.eq(6).text(data.msg);
                            $tr.css("background-color","#CCCCCC");
                        });
                    }
                    else
                    {
                        alert("拆分失败 "+data.msg);
                    }
                },
                error : function() {
                    alert("服务器处理异常");
                }
            });
        }
    })


</script>
