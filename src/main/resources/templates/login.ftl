<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="/jquery/dist/jquery.min.js"></script>
</head>
<body>
<form onsubmit="return false;">
    账号：<input type="text" name="name"><br>
    密码：<input type="text" name="password"><br>
    <input type="submit" value="登录" onclick="login()">
</form>


<button onclick="javascript:location.href='/loginRegister/page/register.html'">注册</button>

<script type="text/javascript">

    function login() {

        $.ajax({
            type: "POST",
            url: "/loginRegister/login.do",
            data: $("form").serialize(),
            async: false,
            success: function (data) {

                if (data.state == 200) {
                    if ("${Session['page']}" == "") location.href = "/zhuYe.html"; else location.href = "${Session['page']}";
                } else {
                    alert("登录失败,重新输入");
                    location.href = "/loginRegister/page/login.html";
                }
            }
        })
    }

    //alert("${Session['page']}");
</script>
</body>
</html>