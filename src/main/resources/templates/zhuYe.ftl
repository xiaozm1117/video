<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="/jquery/dist/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/css/persionalSpace.css"
          charset="utf-8">
</head>
<body>
<div id="dengLu">
    <inupt type="button" onclick="liuLan(4)">登录</inupt>
    <inupt type="button" onclick="liuLan(5)">/注册</inupt>
    <br>
</div>
<input type="button" id="liuLan" value="浏览" onclick="liuLan(1)"/>
<input type="button" id="faBiao" value="发表" onclick="liuLan(2)"/>

<div>
    <input type="text" id="sch" onkeydown="javascript:if(event.keyCode==13) search();"></input>
    <input type="button" onclick="liuLan(3)" value="搜索"></input>
</div>


<div id="abc">


</div>

<script>

    $.ajaxSetup({ //设置ajax请求结束后的执行动作
        complete: function (XMLHttpRequest, textStatus) { // 通过XMLHttpRequest取得响应头，
            var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
            if (sessionstatus == "TIMEOUT") {
                var win = window;
                while (win != win.top) {
                    win = win.top;
                }
                win.location.href = XMLHttpRequest.getResponseHeader("CONTEXTPATH");
            }
        }
    });

    function liuLan(val) {
        $("#abc").empty();
        if (val == 1) {
            $("#abc").load("/liuLan.html");
        } else if (val == 2) {
            $("#abc").load("/faBu.html");
        } else if (val == 3) {
            $("#abc").load("/doSouSuo.html", {"key": $("#sch").val(), "page": 1});
        } else if (val == 4) {
            window.location.href = "/loginRegister/page/login.html";
        } else if (val == 5) {
            window.location.href = "/loginRegister/page/register.html";
        }
    }

</script>


</body>
</html>