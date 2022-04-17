package cn.aa.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.aa.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import cn.aa.pojo.Video;
import cn.aa.tool.Result;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class VideoController {
    @Resource
    private VideoService videoService;

    @RequestMapping("/zhuYe")
    public String homePage1() {
        return "zhuYe";
    }

    @RequestMapping("/liuLan")
    public String homePage2(HttpServletResponse response) {
        return "liuLan";
    }

    @RequestMapping("/faBu")
    public String homePage3(HttpServletResponse response) {
        return "faBu";
    }



    @RequestMapping("/doFabu")
    @ResponseBody
    public Result faBu(String title, String text, int adminId, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Cache-Control", "no-cache");
        try {


            videoService.faBu(title, text, adminId, file, request.getServletContext().getRealPath("/"));
            return new Result("ok");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Result("fail");
    }



    @RequestMapping("/solrCount")
    public Long solrCount(@RequestParam("key") String key) {
        return videoService.solrCount(key);
    }



    @RequestMapping("/doLiuLan")
    @ResponseBody
    public Result getData(int page, int startId) {
        try {

            Video[] data = videoService.liuLan(page, startId);
            return new Result(data);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Result("fail");
    }


    @RequestMapping("/doSouSuo")
    public String videos(@RequestParam("key") String key, int page, Model mode) {

        try {
            byte[] data = key.getBytes("ISO-8859-1");
            //数据发给dubbo提供者
            //dubbo中消费者发数据给提供者用的编码是utf-8
            String q = new String(data, "UTF-8");
            //通过调用接口的抽象方法去调用微服务的提供者
            List<Video> itemList = videoService.findItemByKey(key, page);
            mode.addAttribute("itemList", itemList);
            mode.addAttribute("currentPage", page);
            long count = videoService.solrCount(key);
            mode.addAttribute("total", count);
            mode.addAttribute("key", key);
            return "souSuo";

        } catch (Exception e) {
            e.printStackTrace();
        }
        //转发到search.jsp
        return null;
    }

    @RequestMapping("/getCount")
    @ResponseBody
    public Result getCount() {
        try {

            long count = videoService.getCount();
            return new Result(count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new Result("fail");
    }


}
