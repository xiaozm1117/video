<html>


        <!--第一个-->
        <#if itemList[0]??>
        <#switch itemList[0].type>
        <#case "video">

        <section>
            <h3>${itemList[0].title}</h3>
            <textarea style='float:left; border:none;outline:none;resize:none'
                      readonly='readonly'>${itemList[0].text}</textarea>
            <video width='320' height='240' controls>
                <source src=${itemList[0].content}>
            </video>
            <input type='button'>点赞 ${itemList[0].dianZan}</input>
            <input type='button'>收藏 ${itemList[0].pingLun}</input>
            <input type='button'>评论 ${itemList[0].shouCang}</input>
        </section>
        <#break>

        <#case "img">
        <section>
            <h3>${itemList[0].title}</h3>
            <textarea style='float:left; border:none;outline:none;resize:none'
                      readonly='readonly'>${itemList[0].text}</textarea>
            <img width='300' height='250' src=${itemList[0].content}></img>
            <input type='button'>点赞 ${itemList[0].dianZan}</input>
            <input type='button'>收藏 ${itemList[0].pingLun}</input>
            <input type='button'>评论 ${itemList[0].shouCang}</input>
        </section>
        <#break>
        <#default>
        <section>
            <h3>${itemList[0].title}</h3>
            <textarea style='float:left; border:none;outline:none;resize:none'
                      readonly='readonly'>${itemList[0].text}</textarea>
            <audio src=${itemList[0].content} controls='controls'></audio>
            <input type='button'>点赞 ${itemList[0].dianZan}</input>
            <input type='button'>收藏 ${itemList[0].pingLun}</input>
            <input type='button'>评论 ${itemList[0].shouCang}</input>
        </section>
</#switch>
</#if>

<!--第二个-->
<#if itemList[1]??>
<#switch itemList[1].type>
<#case "video">
<section>
    <h3>${itemList[1].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[1].text}</textarea>
    <video width='320' height='240' controls>
        <source src=${itemList[1].content}>
    </video>
    <input type='button'>点赞 ${itemList[1].dianZan}</input>
    <input type='button'>收藏 ${itemList[1].pingLun}</input>
    <input type='button'>评论 ${itemList[1].shouCang}</input>
</section>
<#break>
<#case "img">
<section>
    <h3>${itemList[1].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[1].text}</textarea>
    <img width='300' height='250' src=${itemList[1].content}></img>
    <input type='button'>点赞 ${itemList[1].dianZan}</input>
    <input type='button'>收藏 ${itemList[1].pingLun}</input>
    <input type='button'>评论 ${itemList[1].shouCang}</input>
</section>
<#break>
<#default>
<section>
    <h3>${itemList[1].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[1].text}</textarea>
    <audio src=${itemList[1].content} controls='controls'></audio>
    <input type='button'>点赞 ${itemList[1].dianZan}</input>
    <input type='button'>收藏 ${itemList[1].pingLun}</input>
    <input type='button'>评论 ${itemList[1].shouCang}</input>
</section>
</#switch>
</#if>


<!--第三个-->
<#if itemList[2]??>
<#switch itemList[2].type>
<#case "video">
<section>
    <h3>${itemList[2].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[2].text}</textarea>
    <video width='320' height='240' controls>
        <source src=${itemList[2].content}>
    </video>
    <input type='button'>点赞 ${itemList[2].dianZan}</input>
    <input type='button'>收藏 ${itemList[2].pingLun}</input>
    <input type='button'>评论 ${itemList[2].shouCang}</input>
</section>
<#break>
<#case "img">
<section>
    <h3>${itemList[2].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[2].text}</textarea>
    <img width='300' height='250' src=${itemList[2].content}></img>
    <input type='button'>点赞 ${itemList[2].dianZan}</input>
    <input type='button'>收藏 ${itemList[2].pingLun}</input>
    <input type='button'>评论 ${itemList[2].shouCang}</input>
</section>
<#break>
<#default>
<section>
    <h3>${itemList[2].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[2].text}</textarea>
    <audio src=${itemList[2].content} controls='controls'></audio>
    <input type='button'>点赞 ${itemList[2].dianZan}</input>
    <input type='button'>收藏 ${itemList[2].pingLun}</input>
    <input type='button'>评论 ${itemList[2].shouCang}</input>
</section>
</#switch>
</#if>
</tr>



    <#if itemList[3]??>
    <#switch itemList[3].type>
    <#case "video">
    <section>
        <h3>${itemList[3].title}</h3>
        <textarea style='float:left; border:none;outline:none;resize:none'
                  readonly='readonly'>${itemList[3].text}</textarea>
        <video width='320' height='240' controls>
            <source src=${itemList[3].content}>
        </video>
        <input type='button'>点赞 ${itemList[3].dianZan}</input>
        <input type='button'>收藏 ${itemList[3].pingLun}</input>
        <input type='button'>评论 ${itemList[3].shouCang}</input>
    </section>
    <#break>
    <#case "img">
    <section>
        <h3>${itemList[3].title}</h3>
        <textarea style='float:left; border:none;outline:none;resize:none'
                  readonly='readonly'>${itemList[3].text}</textarea>
        <img width='300' height='250' src=${itemList[3].content}></img>
        <input type='button'>点赞 ${itemList[3].dianZan}</input>
        <input type='button'>收藏 ${itemList[3].pingLun}</input>
        <input type='button'>评论 ${itemList[3].shouCang}</input>
    </section>
    <#break>
    <#default>
    <section>
        <h3>${itemList[3].title}</h3>
        <textarea style='float:left; border:none;outline:none;resize:none'
                  readonly='readonly'>${itemList[3].text}</textarea>
        <audio src=${itemList[3].content} controls='controls'></audio>
        <input type='button'>点赞 ${itemList[3].dianZan}</input>
        <input type='button'>收藏 ${itemList[3].pingLun}</input>
        <input type='button'>评论 ${itemList[3].shouCang}</input>
    </section>
</#switch>
</#if>


<#if itemList[4]??>
<#switch itemList[4].type>
<#case "video">
<section>
    <h3>${itemList[4].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[4].text}</textarea>
    <video width='320' height='240' controls>
        <source src=${itemList[4].content}>
    </video>
    <input type='button'>点赞 ${itemList[4].dianZan}</input>
    <input type='button'>收藏 ${itemList[4].pingLun}</input>
    <input type='button'>评论 ${itemList[4].shouCang}</input>
</section>
<#break>
<#case "img">
<section>
    <h3>${itemList[4].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[4].text}</textarea>
    <img width='300' height='250' src=${itemList[4].content}></img>
    <input type='button'>点赞 ${itemList[4].dianZan}</input>
    <input type='button'>收藏 ${itemList[4].pingLun}</input>
    <input type='button'>评论 ${itemList[4].shouCang}</input>
</section>
<#break>
<#default>
<section>
    <h3>${itemList[4].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[4].text}</textarea>
    <audio src=${itemList[4].content} controls='controls'></audio>
    <input type='button'>点赞 ${itemList[4].dianZan}</input>
    <input type='button'>收藏 ${itemList[4].pingLun}</input>
    <input type='button'>评论 ${itemList[4].shouCang}</input>
</section>
</#switch>
</#if>

<#if itemList[5]??>
<#switch itemList[5].type>
<#case "video">
<section>
    <h3>${itemList[5].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[5].text}</textarea>
    <video width='320' height='240' controls>
        <source src=${itemList[5].content}>
    </video>
    <input type='button'>点赞 ${itemList[5].dianZan}</input>
    <input type='button'>收藏 ${itemList[5].pingLun}</input>
    <input type='button'>评论 ${itemList[5].shouCang}</input>
</section>
<#break>
<#case "img">
<section>
    <h3>${itemList[5].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[5].text}</textarea>
    <img width='300' height='250' src=${itemList[5].content}></img>
    <input type='button'>点赞 ${itemList[5].dianZan}</input>
    <input type='button'>收藏 ${itemList[5].pingLun}</input>
    <input type='button'>评论 ${itemList[5].shouCang}</input>
</section>
<#break>
<#default>
<section>
    <h3>${itemList[5].title}</h3>
    <textarea style='float:left; border:none;outline:none;resize:none'
              readonly='readonly'>${itemList[5].text}</textarea>
    <audio src=${itemList[5].content} controls='controls'></audio>
    <input type='button'>点赞 ${itemList[5].dianZan}</input>
    <input type='button'>收藏 ${itemList[5].pingLun}</input>
    <input type='button'>评论 ${itemList[5].shouCang}</input>
</section>
</#switch>
</#if>


<div>

    <input type='button' value="上页" onclick="prenext('pre')">
    <div id="index" style="display:inline"></div>
    <input type='button' value="下页" onclick="prenext('next')">
    ${currentPage}/${(total/6)?ceiling}
</div>

<script src="/jquery/dist/jquery.min.js"></script>


<script>
    debugger;

    $(function () {

        doIndex()
    })

    function doIndex() {
        var origin =${(currentPage/5)?ceiling}
    *
        5 - 5 + 1;
        let b =${(total/6)?ceiling}-origin + 1 > 5 ? 5 :${(total/6)?ceiling}-origin + 1;
        for (let i = 0; i < b; i++) {
            let b11 = "<input type='button' value=" + (origin + i) + " onclick='aa(" + (origin + i) + ")'>";
            $("#index").append(b11)
        }
    }

    function aa(d) {
        $("#main").load("/doSouSuo.html", {"key": "${key}", "page": d});
    }

    function prenext(s) {
        var a =${(currentPage/5)?ceiling}
    *
        5 - 5 + 1;
        if (s == 'pre') {
            var a = a - 5 > 0 ? a - 5 : 1;
            $("#main").load("/doSouSuo.html", {"key": "${key}", "page": a});
        } else {
            var a = a + 5 >${(total/6)?ceiling} ? a : a + 5;
            $("#main").load("/doSouSuo.html", {"key": "${key}", "page": a});
        }
    }

</script>

</html>
