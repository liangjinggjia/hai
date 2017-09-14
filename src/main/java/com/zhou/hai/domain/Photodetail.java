package com.zhou.hai.domain;

public class Photodetail {
    private Long id;

    private String photo;

    private String introduce;

    private Long photocollectionId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public Long getPhotocollectionId() {
        return photocollectionId;
    }

    public void setPhotocollectionId(Long photocollectionId) {
        this.photocollectionId = photocollectionId;
    }

    public Photodetail() {
    }
}