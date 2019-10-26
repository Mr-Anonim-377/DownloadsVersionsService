package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.POJO.PostDefaultResponse;
import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "products", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProductController {
    private final ProductRepository productRepository;

    @Autowired
    public ProductController(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }


    @GetMapping
    public ResponseEntity<List<Product>> getAllProducts() {
        return new ResponseEntity<>(productRepository.findAll(), HttpStatus.OK);

    }


    @GetMapping("{id}")
    public ResponseEntity<Product> getProduct(@PathVariable("id") Product product) {
        return new ResponseEntity<>(product, HttpStatus.OK);
    }


    @PostMapping(value = "create", produces = MediaType.APPLICATION_JSON_VALUE)

    public ResponseEntity<Object> createProduct(@RequestBody Product product) {
        try {
            if (productRepository.save(product) == null) {
                return new ResponseEntity<>("", HttpStatus.NOT_FOUND);
            }else {
                return new ResponseEntity<>(product, HttpStatus.OK);
            }
        } catch (RuntimeException e) {
            return new ResponseEntity<>(e.getStackTrace(), HttpStatus.INTERNAL_SERVER_ERROR);
        }


    }


    @PostMapping(value = "delete/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Product> deleteProduct(@PathVariable("id") Product product) {
        try {
            productRepository.delete(product);
            return new ResponseEntity<>(product, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(product, HttpStatus.NOT_FOUND);
        }


    }

}
