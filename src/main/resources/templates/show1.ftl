<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="/jquery/dist/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">

    function doload() {
        $("#abc").load("/user/edit.html", {itemId: -1});
    }

    function search(id) {
        var name = $(id).val();
        var ar = new Array();
        if (name == "") {
        <
            #list
            uList as item >
            ar.push({id: "${item.id}", name: "${item.name}", age: "${item.age}", sex: "${item.sex}"});
        <
            /#list>
        } else {
        <
            #list
            uList as item >
            if (name == "${item.name}") {
                ar.push({id: "${item.id}", name: "${item.name}", age: "${item.age}", sex: "${item.sex}"});
            }
        <
            /#list>}
            if (ar.length == 0) {
                return;
            }
            $("tbody").html("");
            for (let i = 0; i < ar.length; i++) {
                let a = $("<tr></tr>");
                a.append("<td><input type='checkbox' value='" + ar[i].id + "'></input></td>");
                a.append("<td>" + ar[i].id + "</td>");
                a.append("<td>" + ar[i].name + "</td>");
                a.append("<td>" + ar[i].age + "</td>");
                a.append("<td>" + ar[i].sex + "</td>");
                $("tbody").append(a)
            }
        }

        function update() {
            var ar = new Array();
            $("tbody input").each(function () {
                let a = $(this).prop("checked");
                if ($(this).prop("checked")) {
                    ar.push($(this).attr("value"));
                }
            })
            if (ar.length == 0 || ar.length > 1) {
                alert("请选择一项修改");
                return;
            }

        <
            #list
            uList as item >
            if (${item.id}==ar[0]
        )
            {
                var itemId = "${item.id}";
            }
        <
            /#list>
            $("#abc").load("/user/edit.html", {itemId: itemId});

        }

        function delete11() {
            var ar = new Array();
            $("tbody input").each(function () {
                if ($(this).prop("checked")) {
                    ar.push($(this).attr("value"))
                }
                ;
            })
            if (ar.length == 0) {
                alert("请至少选择一项修改");
                return;
            }


            $.ajax({
                type: "POST",
                url: "/service/user/delete",
                traditional: "true",
                data: {items: ar},
                success: function (data) {
                    if (data.state == 200) {
                        alert("删除成功");
                        location.reload();
                    } else {
                        alert("删除失败");
                    }
                }
            })
        }

</script>
<div id="abc">

    <div>
        <div><input type="text" id="sch" placeholder="输入名字搜索"
                    onkeydown="javascript:if(event.keyCode==13) search('#sch');"></input>
            <input type="button" onclick="search('#sch')">搜索</input></div>

        <input type="button" onclick="doload()">添加</input>
        <input type="button" onclick="update()">修改</input>
        <input type="button" onclick="delete11()">删除</input>
    </div>


    <div>
        <table border="1" id="ab">
            <thead>
            <tr>
                <th></th>
                <th>序号</th>
                <th>名字</th>
                <th>年龄</th>
                <th>性别</th>
            </tr>
            </thead>
            <tbody>
            <#list uList as article>
            <tr>
                <td><input type="checkbox" value="${article.id}"></input></td>
                >
                <td>${article.id}</td>
                <td>${article.name}</td>
                <td>${article.age}</td>
                <td>${article.sex}</td>
            </tr>
            </
            #list>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>