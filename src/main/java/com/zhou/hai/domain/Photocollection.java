package com.zhou.hai.domain;

import java.util.Date;
import java.util.List;

public class Photocollection {
    private Long photocollectionId;

    private String title;

    private Date date;

    private int number;

    private List<Photodetail> photodetailList;

    public List<Photodetail> getPhotodetailList() {
        return photodetailList;
    }

    public void setPhotodetailList(List<Photodetail> photodetailList) {
        this.photodetailList = photodetailList;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Long getPhotocollectionId() {
        return photocollectionId;
    }

    public void setPhotocollectionId(Long photocollectionId) {
        this.photocollectionId = photocollectionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Photocollection(Long photocollectionId, String title,Date date) {
        this.photocollectionId = photocollectionId;
        this.title = title;
        this.date = date;
    }

    public Photocollection() {
    }
}