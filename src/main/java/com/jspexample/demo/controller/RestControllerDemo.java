package com.jspexample.demo.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class RestControllerDemo {
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
}
