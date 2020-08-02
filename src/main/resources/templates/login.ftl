<html>
<head>
    <meta charset="UTF-8">
    <title>pmss-web管理平台</title>
    <link rel="stylesheet" href="./layui/css/layui.css" rel="stylesheet">
    <link rel="stylesheet" href="./layui/css/modules/layer/default/layer.css?v=3.1.1" rel="stylesheet">
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            align-items: center; /*定义body的元素垂直居中*/
            justify-content: center; /*定义body的里的元素水平居中*/
        }
    </style>
</head>
<body>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="userName" lay-verify="required" autocomplete="off" placeholder="请输入用户名称"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="passWord" lay-verify="required" autocomplete="off" placeholder="请输入密码"
                   class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="lbutton">登录</button>
        </div>
    </div>
</form>
<script src="./layui/layui.js"></script>
<script src="./jquery/jquery-3.5.1.min.js"></script>
<script>
    var redirectUrl ='<#if RequestParameters['redirectUrl']??>${RequestParameters['redirectUrl']}</#if>';
    redirectUrl = redirectUrl ? redirectUrl : '/pmss-web/index';
    layui.use(['form'], function () {
        var form = layui.form
            , layer = layui.layer
        form.on('submit(lbutton)', function (data) {
            $.ajax({
                url: "/pmss-admin/login?redirectUrl="+ redirectUrl,
                type: "post",
                data: data.field,
                async: false,
                success: function (data) {
                    //alert("登录成功");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);//状态码
                    alert(XMLHttpRequest.readyState);//状态
                    alert(textStatus);//错误信息
                }
            })
        });
    });
</script>
</body>
</html>