$(function () {
    var status = "";
    var $status = $("#status");
    $("#monthinput").bootstrapMonthpicker();
    $status.val($("#statustab").attr("value"));
    $status.change(function(){
        status = $("#status").find("option:selected").val();
    });
    $.ajax({
        url: '../roctools/combotree',
        type: 'GET',
        dataType: 'JSON',
        async: true,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {},
        success: function (data) {
            var tree = $('#tree');
            tree.combotree('loadData', data.msg);
            tree.combotree({
                panelHeight:400
            });
            var str = tree.attr("value");
            tree.combotree('setValues', str);

        },
        error:function(code,err){
            alert("Tree wrong")
        }
    });

    $("#query").click(function(){
        var departments = $('#tree').combotree('getValues');
        var month = $("#monthinput").val();
        window.location.href = "../roctools/contracts?"+"departments="+departments+"&&month="+month+"&&archivestatus="+status;
    });

    $("#queryByContractNo").click(function(){
        var contractNo = $("#contractNo").val();
        window.location.href = "../roctools/contract?"+"contractno="+contractNo;
    });

    $("#queryByCreateBy").click(function(){
        var createBy = $("#createBy").val();
        window.location.href = "../roctools/contractByCreateBy?"+"createBy="+createBy;
    });

    $(".cancel").click(function(){
        if(!confirm("确认撤销归档？")){
            return;
        }
        var contractid = $(this).attr("data-id");
        $.ajax({
            url: '../roctools/archiverecord',
            type: 'GET',
            dataType: 'JSON',
            async: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {
                contractId: contractid,
                archiveStatus: 0
            },
            success: function (data) {
                alert("撤销归档成功");
                window.location.reload();
            },
            error:function(code,err){
                alert("撤销归档失败")
            }
        });
    });
    $(".save").click(function(){
        var contractlist = new Array();
        $(".archive-check:checked").each(function(){
            contractlist.push($(this).attr("id"));
        });
        var contractListStr = contractlist.join(",")
        $.ajax({
            url: '../roctools/archiverecords',
            type: 'GET',
            dataType: 'JSON',
            async: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {
                contractId: contractListStr,
                archiveStatus: 1
            },
            success: function (data) {
                alert(data.msg);
                window.location.reload();
            },
            error:function(code,err){
                alert("归档失败");
                window.location.reload();
            }
        });
    })
});
