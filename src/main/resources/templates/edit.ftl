<div>
    <form action="/service/user/add-update">
        序号：<input type="text" name="id" readonly="true"><br>
        名字：<input type="text" name="name"><br>
        性别： <input type="text" name="sex"><br>
        年龄：<input type="text" name="age"><br>
        <input type="submit" value="Submit">
    </form>
</div>
<script src="/jquery/dist/jquery.min.js"></script>
<script>

    (function () {
        debugger;

        if ("${userL[0]}" == "") {
            $("input[name='id']").val(0);
            return;
        }
        $("input[name='id']").val("${userL[0].id}");
        $("input[name='name']").val("${userL[0].name}");

        $("input[name='sex']").val("${userL[0].sex}");
        $("input[name='age']").val("${userL[0].age}");
    })()


</script>
	
	
	
