package com.jspexample.demo.controller;


import com.jspexample.demo.dao.SocialFacebookConfiguration;
import com.jspexample.demo.repository.SocialFacebookConfigCrud;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RestControllerDemo {

    @Autowired
    private SocialFacebookConfigCrud socialFacebookConfigCrud;

    @GetMapping("/confirmPage")
    public List<Map<Integer, String>> confirmPage(){
        //TODO get list of Pages from FB server
        Map<Integer,String> pageList = new HashMap<>();
        pageList.put(0,"demo 1");
        pageList.put(1,"demo 2");
        List<Map<Integer,String>> listCatagory = Collections.singletonList(pageList);
        //model.addAttribute("listCategory", listCatagory);

        return listCatagory;

    }

    @PostMapping("save-facebook-page-configuration")
    public String saveFacebookPageConfig(@RequestParam(value = "page_id",defaultValue = "")String page_id,
                                         @RequestParam(value = "page_name",defaultValue = "")String page_name,
                                         @RequestParam(value = "access_token",defaultValue = "")String access_token){

  try {
      SocialFacebookConfiguration socialFacebookConfiguration = new SocialFacebookConfiguration();
      socialFacebookConfiguration.setPageId(page_id);
      socialFacebookConfiguration.setPageName(page_name);
      socialFacebookConfiguration.setAccessToken(access_token);
      //Saving to DB
      socialFacebookConfigCrud.saveSocialFacebookConfig(socialFacebookConfiguration);
      System.out.println(socialFacebookConfiguration);
      return "success";
  }
  catch (Exception e){
      e.printStackTrace();
      return "failed";
  }
    }
}
