package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Sales;
import com.Sales.SalesWeb.repository.SalesRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("sales")
public class MessageController {



    private final SalesRepository salesRepository;
    @Autowired
    public MessageController(SalesRepository salesRepository) {
        this.salesRepository = salesRepository;
    }

    @GetMapping
    public List<Sales> list()
    {
        return salesRepository.findAll();
    }



    @GetMapping("{id}")
    public Sales getOne(@PathVariable("id") Sales sale){
        return sale;
    }


    @PostMapping
    public Sales create(@RequestBody Sales sale){
        return salesRepository.save(sale);
    }


    @PutMapping("{id}")
    public Sales update (@PathVariable("id") Sales saleFromDb ,
                         @RequestBody Sales  saleFromUser){
        BeanUtils.copyProperties(saleFromUser,saleFromDb, "id");
    return salesRepository.save(saleFromDb);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable("id") Sales sale) {
    salesRepository.delete(sale);

    }

}