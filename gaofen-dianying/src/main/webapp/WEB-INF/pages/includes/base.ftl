<#assign decorator=JspTaglibs["http://www.opensymphony.com/sitemesh/decorator"]>
<!doctype html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>
        推广结婚工具
    </title>
    <link rel="stylesheet" href="/roctools/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/roctools/static/css/common.css" id="base-common-css">
    <link rel="stylesheet" href="/roctools/static/css/header.css" id="base-header-css">
    <link rel="stylesheet" href="/roctools/static/css/base.css" id="base-css">
    <link rel="Shortcut Icon" href="http://j1.s2.dpfile.com/s/res/favicon.5ff777c11d7833e57e01c9d192b7e427.ico" type="image/x-icon">
    <style type="text/css">
        .form-horizontal .control-label.required:after {
            display: inline-block;
            width: 1em;
            color: #ff6600;
            content: '*';
            vertical-align: middle;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="page-${_page_name!}" style="margin-top: 20px;margin-left: 10px;">
<@decorator.body />
</div>
<script src="/menus/static/head.js"></script>
<script src="/roctools/static/js/bootstrap.min.js"></script>
<script src="/roctools/static/js/underscore-min.js"></script>
<script type="text/javascript">
    var ENV = {
        menuKey: 'roc.opstools',
        menuRouter: 'h5'
    }
</script>
</body>
