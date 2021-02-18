package com.jspexample.demo.repository;

import com.jspexample.demo.dao.SocialFacebookConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SocialFacebookConfigCrud {

    @Autowired
    private SocialFacebookConfigRepo socialFacebookConfigRepo;

    public void  saveSocialFacebookConfig(SocialFacebookConfiguration socialFacebookConfiguration){
        SocialFacebookConfiguration configFromDb = (SocialFacebookConfiguration) socialFacebookConfigRepo.findByPageId(socialFacebookConfiguration.getPageId());
        if (configFromDb==null) {
            System.out.println("Saving new Config");
            socialFacebookConfigRepo.save(socialFacebookConfiguration);
            return;
        }
        System.out.println("Found in DB, Updating Config");
        configFromDb.setAccessToken(socialFacebookConfiguration.getAccessToken());
        configFromDb.setPageName(socialFacebookConfiguration.getPageName());
        socialFacebookConfigRepo.save(configFromDb);
    }
}
