<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <meta charset="UTF-8">
    <script src="/jquery/dist/jquery.min.js"></script>
</head>

<body>

<span><input style="width: 75%; height: 100%;display: block" multiple="multiple" type="file" name="file"
             onchange="uploadVidoe(this)"/>
</span>

<video style=" width:320px ;height:240px" controls>
    <source src="/upload/video/1.mp4"
            type="video/mp4">
</video>
<div style=" width:100px ;height:240px;background:#eee">
    <img src="/upload/picture/00383446c9444c91ad2adc4695c3a670.png"></img>
    <audio src="http://resource.com/audio/0f177a2495b443efa2f1204bc9ec5bfe.mp3" controls="controls"></audio>

    <audio controls>
        <source src="http://resource.com/audio/0f177a2495b443efa2f1204bc9ec5bfe.mp3" type="audio/mpeg">
    </audio>
    <audio controls>
        <source src="http://resource.com/audio/0f177a2495b443efa2f1204bc9ec5bfe.mp3" type="audio/mpeg">
    </audio>
    <audio controls>
        <source src="http://resource.com/audio/0f177a2495b443efa2f1204bc9ec5bfe.mp3" type="audio/mpeg">
    </audio>

</div>

<script>

    function uploadVidoe(vidoe) {
        var fileObj = vidoe.files[0]; // 获取文件对象

        if (fileObj != undefined) {

            if (fileObj.name) {
                console.log(fileObj.name)
            } else {
                alert("请选择文件");
            }

            var size = fileObj.size;
            var type = fileObj.type;

            //校验格式
            if (type.indexOf('mp4') == -1) {
                alert("请上传MP4格式")
                return false;
            }
            /* //校验大小
            if (size / 1024 / 1024 > 10) {
                alert("请上传" + size + "之内的视频")
                return false;
            } */

            var form = new FormData(); // FormData 对象
            form.append("file", vidoe.files);
            $.ajax({
                url: "/service/doupload",
                contentType: false,//false 传输对象
                processData: false,
                type: "POST",
                data: form,
                success: function (ret) {
                    if (ret.resCode != undefined) {
                        if (ret.resCode == '1') {
                            alert("上传成功")
                        } else if (ret.resCode == '0') {
                            alert("上传失败")
                        }
                    }
                }
            })

        }
    }

</script>
</body>

</html>