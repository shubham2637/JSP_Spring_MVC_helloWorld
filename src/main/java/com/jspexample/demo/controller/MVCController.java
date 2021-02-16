package com.jspexample.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MVCController {

    @GetMapping("/")
    public String helloController(@RequestParam(value = "name",defaultValue = "World",required = true)String name, Model model){
    model.addAttribute("name",name);
    return "index";
    }

    @GetMapping("/hello")
    public String helloWorld(@RequestParam(value = "name",defaultValue = "World",required = true)String name, Model model){
        model.addAttribute("name",name);
        return "hello";
    }
}