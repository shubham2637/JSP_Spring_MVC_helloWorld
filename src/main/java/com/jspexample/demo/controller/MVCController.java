package com.jspexample.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
//@RequestMapping("/social/facebook")
public class MVCController {

    @GetMapping("/")
    public String helloController(){
    return "test";
    }

 /*   @PostMapping()
    public String pageConfirmation(@RequestParam(value = "name",defaultValue = "World",required = true)String name, Model model){
        model.addAttribute("name",name);
        model.addAttribute("message", name);
        return "index";
    }*/

    @PostMapping("/postOptions")
    public String postMessage(@RequestParam(value = "messages",defaultValue = "off")String messages,
                              @RequestParam(value = "post_comments",defaultValue = "off")String postComments,
                              @RequestParam(value = "page_mentions",defaultValue = "off")String pageMentions,
                              Model model,HttpServletRequest request) {
        model.addAttribute("messages",messages);
        model.addAttribute("postComments",postComments);
        model.addAttribute("pageMentions",pageMentions);
        //TODO call FB server
        //TODO pass the response to confirmation page
        System.out.println("Options Selected : \n"+"Message : "+messages+"\npageMentions : "+pageMentions+"\npostComments : \"+postComments");

        //TODO get list of Pages from FB server
        List<String> listCatagory = Arrays.asList("Demo 1", "Demo 2");
        model.addAttribute("listCategory", listCatagory);
        for (String page: listCatagory)
            System.out.println(page);
        return "pageSelection";
    }

    @GetMapping("/social/facebook")
    public String helloWorld(){
        return "test";
    }




}