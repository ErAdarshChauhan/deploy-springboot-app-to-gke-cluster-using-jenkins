package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class BookController {

    @GetMapping("/welcome")
    public String welcome() {
        return "Hello Guys!! This app has deployed in K8s engine using GKE'S Jenkins";
    }
}
