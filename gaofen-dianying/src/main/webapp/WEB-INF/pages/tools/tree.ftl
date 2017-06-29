<!DOCTYPE html>
<HTML>
<HEAD>
    <TITLE> ZTREE DEMO </TITLE>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
</HEAD>
<BODY>
<link rel="stylesheet" href="/roctools/static/css/awesome.css" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/roctools/static/css/jquery.navtree.css">
<div class="orgtree" style="width: 33%; float:left">
    <ul id="treeDemo" class="ztree"></ul>
</div>
<div class="" style="width: 33%; float:left">
    <ul id="childrenlist"></ul>
</div>
<script type="text/javascript" src="/roctools/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/roctools/static/js/jquery.ztree.core.min.js"></script>

<SCRIPT LANGUAGE="JavaScript">

    $(document).ready(function(){
        $.ajax({
            type: "GET",
            url: "./orgtree",
            success: function(data){
                var zNodes = data;
                var zTreeObj;
                var setting = {
                    data: {
                        key: {
                            children: "children",
                            name: "departmentName",
                            title: "departmentId"
                        }
                    },
                    callback: {
                        beforeClick: beforeClick,
                        onClick: onClick

                    }
                }
                zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            }
        });
        function beforeClick(treeId, treeNode, clickFlag) {
            console.log(treeNode.departmentId+treeNode.departmentName);
            return (treeNode.click != false);
        }
        function onClick(event, treeId, treeNode, clickFlag) {
            showChildren(treeNode.departmentId);
//            console.log(treeNode.departmentId+treeNode.departmentName);
        }

        function showChildren(id) {
            $.ajax({
                type: "GET",
                url: "./children?id="+id,
                success: function(data){
                    $("#childrenlist").empty();

                    data.forEach(function (i) {
                        $("#childrenlist").append("<li>" +
                                "<span>" +i.realName + "</span></br>" +
                                "<span>工号:" +i.serialNumber + "</span>" +
                                "<span>   loginid:" +i.loginId + "</span></br>" +
                                "</li>")
                    });
                }
            });
        }

    });
</SCRIPT>
</BODY>
</HTML>
