package com.Sales.SalesWeb.controller;

import com.Sales.SalesWeb.service.BanerService;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "baners", produces = MediaType.APPLICATION_JSON_VALUE)
public class BanerController {
    private final BanerService banerService;


    public BanerController(BanerService banerService) {
        this.banerService = banerService;
    }
}


