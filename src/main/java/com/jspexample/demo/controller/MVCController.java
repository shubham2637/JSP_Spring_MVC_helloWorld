package com.jspexample.demo.controller;

import com.jspexample.demo.controller.model.FacebookSubscription;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
//@RequestMapping("/social/facebook")
public class MVCController {

    @GetMapping("/")
    public String helloController(@RequestParam(value = "name",defaultValue = "World",required = true)String name, Model model){
    model.addAttribute("name",name);
        model.addAttribute("message", name);
    return "index";
    }

    @PostMapping()
    public String pageConfirmation(@RequestParam(value = "name",defaultValue = "World",required = true)String name, Model model){
        model.addAttribute("name",name);
        model.addAttribute("message", name);
        return "index";
    }

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
        System.out.println("Options Selected : ");
        System.out.println("Message : "+messages);
        System.out.println("pageMentions : "+pageMentions);
        System.out.println("postComments : "+postComments);


        List<String> listCatagory = Arrays.asList(new String[]{"Demo page 1", "Demo Page 2"});
        request.setAttribute("listCategory", listCatagory);
        for (String page:
             listCatagory) {
            System.out.println(page);

        }
        return "pageSelection";
    }

    @GetMapping("/hello")
    public String helloWorld(@RequestParam(value = "name",defaultValue = "World",required = true)String name, Model model){
        model.addAttribute("name",name);
        return "test";
    }

    @GetMapping("/confirmPage")
    public String confirmPage(Model model,HttpServletRequest request, HttpServletResponse response) throws IOException {
        //TODO get list of Pages from FB server
        List<String> listCatagory = Arrays.asList("Demo 1", "Demo 2");
        model.addAttribute("listCategory", listCatagory);
        //request.setAttribute("listCategory",listCatagory);
        //response.sendRedirect("pageSelection");
        return "pageSelection";

    }

}