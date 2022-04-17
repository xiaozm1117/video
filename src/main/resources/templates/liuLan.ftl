<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <div style="overflow: scroll;position: absolute;margin-left:-200px;left:50%;width:400px ;height:600px" id="main">
    <script src="/jquery/dist/jquery.min.js"></script>

    <style>
        img {
            width: 320px;
            height: 240px
        }

    </style>


    <script>

        debugger;
        var startId = 0;
        var page = 1;
        var direction = "down";
        $(function () {

            getData();
            $("#main").scroll(function () {
                var scrollTop = document.getElementById("main").scrollTop;
                var scrollClient = document.getElementById("main").clientHeight;
                var scrollHeight = document.getElementById("main").scrollHeight;
                console.log(scrollTop, scrollClient, scrollHeight, scrollHeight - scrollTop);
                if (document.getElementById("main").scrollTop == 0) {
                    var scrollBottom = $("#main")[0].scrollHeight - $("#main")[0].scrollTop - $("#main").height();
                    if (direction == "up") {
                        page = page - 1;

                    } else {
                        page = page - 2;
                        direction = "up"
                    }
                    if (page < 1) {
                        direction = "down"
                        startId = 0;
                        page = 1;
                        $("section").remove();
                        getData();
                        return;
                    }
                    getData(scrollBottom);


                } else if (scrollTop + scrollClient == scrollHeight) {
                    if (direction == "down") {
                        page = page + 1;

                    } else {
                        page = page + 2;
                        direction = "down"
                    }
                    getData();

                }

            })
        })

        function getData(scrollBottom) {
            $.get("/doLiuLan.do", {page: page, startId: startId}, function (data) {

                if (data.state == 200 && data.data.length != 0) {
                    if (page == 1) {
                        startId = data.data[0].id;
                    }

                    if (direction == "down") {
                        $("section").remove(".up");
                        $("section").prop("class", "up");
                        for (var i = 0; i < data.data.length; i++) {
                            var temp1 = "";
                            var temp2 = "";
                            if (data.data[i].type == "video") {
                                temp1 = "<video width='320' height='240' controls><source src=" + data.data[i].content + " type='video/mp4'></video>";
                            } else if (data.data[i].type == "img") {
                                temp1 = "<img src='" + data.data[i].content + "'></img>";
                            } else if (data.data[i].type == "audio") {
                                temp1 = "<audio src='" + data.data[i].content + "' controls='controls'></audio>";
                            }
                            if (data.data[i].text != null) {
                                temp2 = "<textarea style='float:left; border:none;outline:none;resize:none' readonly='readonly'>" + data.data[i].text + "</textarea>";
                            }
                            var item = "<section class='down'>" +
                                "<h3>" + data.data[i].title + "</h3>" +
                                temp2 + temp1 +
                                "<input type='button'  value='点赞" + data.data[i].dianZan + "'>" +
                                "<input type='button'  value='收藏" + data.data[i].pingLun + "'>" +
                                "<input type='button'  value='评论" + data.data[i].shouCang + "'>" +
                                "</section>";
                            $("#main").append(item);

                        }

                    } else {

                        $("section").remove(".down");
                        $("section").prop("class", "down");
                        var first = $("section:first");
                        for (var i = data.data.length - 1; i >= 0; i--) {
                            var temp1 = "";
                            var temp2 = "";
                            if (data.data[i].type == "video") {
                                temp1 = "<video width='320' height='240' controls><source src=" + data.data[i].content + " type='video/mp4'></video>";
                            } else if (data.data[i].type == "img") {
                                temp1 = "<img src='" + data.data[i].content + "'></img> ";
                            } else if (data.data[i].type == "audio") {
                                temp1 = "<audio src='" + data.data[i].content + "' controls='controls'></audio> ";
                            }

                            if (data.data[i].text != null) {
                                temp2 = "<textarea  style='float:left; border:none;outline:none;resize:none' readonly='readonly'>" + data.data[i].text + "</textarea>";
                            }
                            var item = "<section class='up'>" +
                                "<h3>" + data.data[i].title + "</h3>" +
                                temp2 + temp1 +
                                "<input type='button'  value='点赞" + data.data[i].dianZan + "'>" +
                                "<input type='button'  value='收藏" + data.data[i].pingLun + "'>" +
                                "<input type='button'  value='评论" + data.data[i].shouCang + "'>" +
                                "</section>";
                            $("#main").prepend(item);
                        }
                        $("#main").scrollTop(first.offset().top);
                    }

                    var items = document.getElementsByTagName("textarea");
                    if (items != null) {
                        var height = items[0].scrollHeight + "px";
                        for (let item of items) {
                            item.style.height = height;
                        }
                    }

                } else {//到达全部数据底部
                    page = page - 1;
                }
            })
        }

    </script>

</html>