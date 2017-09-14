package com.zhou.hai.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by zhou on 2017/4/29.
 */
public class PhotoServiceTest extends BaseTest {
@Autowired
private  PhotoService photoService;
    @Test
    public void testGetPreAftPhotoByPhotoCollectionId() throws Exception {
        photoService.getPrePhotoByPhotoCollectionId(new Long(7));
    }
}