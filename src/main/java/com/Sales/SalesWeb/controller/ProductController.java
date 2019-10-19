package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.ProductRepository;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("products")
public class ProductController {



    private final ProductRepository productRepository;
    @Autowired
    public ProductController(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }


    @GetMapping
    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }



    @GetMapping("{id}")
    public Product getProduct(@PathVariable("id") Product product){
        return product;
    }


    @PostMapping(value = "create",produces = MediaType.APPLICATION_JSON_VALUE)
    public Product createProduct(@RequestBody Product product){

        return productRepository.save(product);
    }

    @PostMapping(value = "delete/{id}",produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> deleteProduct(@PathVariable("id") Product product){
        productRepository.delete(product);


        return new ResponseEntity<Product>(product,HttpStatus.OK);
    }

}
