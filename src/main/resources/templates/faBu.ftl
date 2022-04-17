
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div style="background-color: rgb(200, 200, 200);">

    <input type="file" id="fileInput"/><br/>       <!--  multiple="multiple" -->
    <div id="audio1"></div>

    <input type="text" id="fabuTitle" placeholder="标题"></input>
    <textarea rows="20" cols="100%" id="text" style="resize:none;"></textarea>

    <input type="submit" value="发布" onclick="faBu()"/>
</div>


<script src="/jquery/dist/jquery.min.js">

</script>
<script>
    debugger;

    $("#fileInput").change(function () {
        $('#audio1').empty();
        var file = $("#fileInput").prop("files")[0];
        var type = file.name;
        if (type.match(/.+(mp4)/)) {
            var path = URL.createObjectURL(file);
            var audio = document.createElement('video');
            var source = document.createElement("source");
            audio.controls = "controls";
            source.src = path;
            source.type = "video/mp4";
            audio.append(source)
            $('#audio1').append(audio);
        } else if (type.match(/.+(jpeg|png)/)) {

            var image = document.createElement('input');
            image.type = "image";
            image.src = window.URL.createObjectURL(file);
            $('#audio1').append(image);
        } else if (type.match(/.+(mp3)/)) {

            var audio = document.createElement('audio');
            audio.controls = "controls";
            audio.src = window.URL.createObjectURL(file);
            $('#audio1').append(audio);
        }

    })

    function faBu() {
        if ($("#fabuTitle").val() == "") {
            alert("请输入标题");
            return;
        }
        var file = $("#fileInput").prop("files")[0];
        if (file == null && $("textarea").val() == "") {
            alert("请输入正文");
            return;
        }
        if (file != null) {
            var type = file.name;

            if (type.match(/.+(mp4)/) == null && type.match(/.+(mp3)/) == null && type.match(/.+(png)/) == null) {
                alert("请添加图片，MP4，MP3")
                return;
            }
        }


        var adminId = 3;//"${Session['admin'].id}";
        var formData = new FormData();
        formData.append("adminId", adminId);
        formData.append("title", $("#fabuTitle").val());
        formData.append("file", file);
        if ($("textarea").val() != "") {
            formData.append("text", $("textarea").val());
        }
        $.ajax({
            type: "POST",
            url: "/doFabu.do",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data.state == 200) {
                    alert("上传成功");
                } else {
                    alert("上传失败")
                }
            }

        })
    }
</script>

