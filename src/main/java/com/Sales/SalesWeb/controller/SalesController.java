package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Sales;
import com.Sales.SalesWeb.repository.SalesRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("sales")
public class SalesController {


    private final SalesRepository salesRepository;

    @Autowired
    public SalesController(SalesRepository salesRepository) {
        this.salesRepository = salesRepository;
    }

    @GetMapping
    public List<Sales> getSales() {
        return salesRepository.findAll();
    }


    @GetMapping("{id}")
    public Sales getSale(@PathVariable("id") Sales sale) {
        return sale;
    }


    @PostMapping
    public Sales createSale(@RequestBody Sales sale) {
        return salesRepository.save(sale);
    }


    @PutMapping("{id}")
    public Sales updateSale(@PathVariable("id") Sales saleFromDb,
                            @RequestBody Sales saleFromUser) {
        BeanUtils.copyProperties(saleFromUser, saleFromDb, "id");
        return salesRepository.save(saleFromDb);
    }

    @DeleteMapping("{id}")
    public void deleteSale(@PathVariable("id") Sales sale) {
        salesRepository.delete(sale);
    }

}