package com.zhou.hai.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Post {
//    为了显示加的属性
    private String showDate;
    /** 主键id */
    private Long postId;

    private String postAuthor;

    private Integer postUnitId;
@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date postDate;

    private Integer postStatus;

    private String postType;

    private Long commentId;

    private Long commentCount;

    private String postNo;

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getPostAuthor() {
        return postAuthor;
    }

    public void setPostAuthor(String postAuthor) {
        this.postAuthor = postAuthor == null ? null : postAuthor.trim();
    }

    public Integer getPostUnitId() {
        return postUnitId;
    }

    public void setPostUnitId(Integer postUnitId) {
        this.postUnitId = postUnitId;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public Integer getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(Integer postStatus) {
        this.postStatus = postStatus;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType == null ? null : postType.trim();
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public Long getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Long commentCount) {
        this.commentCount = commentCount;
    }

    public String getPostNo() {
        return postNo;
    }

    public void setPostNo(String postNo) {
        this.postNo = postNo == null ? null : postNo.trim();
    }

    public void setShowDate(String showDate) {
        this.showDate = showDate;
    }

    public String getShowDate() {
        return showDate;
    }
}