<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="/jquery/dist/jquery.min.js"></script>

</head>
<body>
<form onsubmit="return false">
    <p>用户名：</p><input type="text" id="name" name="name" onblur="check()" onfocus="msg(1)"
                      placeholder="请输入3-10个以字母开头的字符串"/><label id="nameId" style="color:#ff0000"></label></p>
    <p>用户密码：</p><input type="text" id="password" onblur="check2()" name="password" onfocus="msg(2)"
                       placeholder="请输入3-7个以字母开头的字母与数字组合字符串"/><label id="passwordId" style="color:red"></label></p>
    <p></P><input type="submit" value="注册" onclick="submit1()"/></p>
</form>

<script type="text/javascript">
debugger;

    function msg(item) {
        if (item == 1) {
            $("#nameId").text("");
        } else {
            $("#passwordId").text("");
        }
    }

    function submit1() {
        var name = check();
        var password = check2();
        if (name && password) {
            $.post("/loginRegister/register.do", $("form").serialize(), function (data) {
                if (data.state == 200) {
                    alert("注册成功");
                    location.href = "/loginRegister/page/login.html";
                }
            })
        }
    }

    function check() {
        var name = /^[a-z][0-9a-z]{2,10}$/;
        var match = name.test($("#name").val());
        if (!match) {
            $("#nameId").text("请输入3-10个以字母开头的字符串");
            return match;
        } else {

            var repeat;
            $.ajax({
                type: "POST",
                url: "/loginRegister/check.do",
                data: {"name": $("#name").val()},
                async: false,
                success: function (data) {
                    repeat = false;
                    if (data.state == 200) {
                        repeat = true;
                        $("#nameId").text("名字重复，请输入另一个");
                    }
                }

            })
            return !repeat;
        }

    }

    function check2() {
        var pw = /^[a-z][a-z0-9]{0,}[0-9][0-9a-z]{1,5}$/;
        var match = pw.test($("#password").val());
        if (!match) {
            $("#passwordId").text("请输入3-7个以字母开头的字母与数字组合字符串");
        }
        return match;
    }


</script>


</body>
</html>