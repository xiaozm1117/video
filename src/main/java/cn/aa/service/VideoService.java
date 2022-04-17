package cn.aa.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.aa.pojo.Video;

public interface VideoService {
    public Video[] liuLan(int page, int startId);

    public void faBu(String title, String text, int adminId, MultipartFile file, String realPath);

    public long getCount();

    List<Video> findItemByKey(String key, int page);

    public Long solrCount(String key);
}
