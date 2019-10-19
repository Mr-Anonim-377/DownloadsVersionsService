package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.POJO.PostDefaultResponse;
import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.ProductRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }


    @GetMapping("{id}")
    public Product getProduct(@PathVariable("id") Product product) {
        return product;
    }


    @PostMapping(value = "create", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> createProduct(@RequestBody Product product) throws JsonProcessingException {

        PostDefaultResponse postDefaultResponse = new PostDefaultResponse();
        ObjectMapper mapper = new ObjectMapper();

        postDefaultResponse.setProduct(product);
        postDefaultResponse.setSucsessfull(true);

        productRepository.save(product);

        mapper.writeValueAsString(postDefaultResponse);

        return new ResponseEntity<String>(mapper.writeValueAsString(postDefaultResponse), HttpStatus.OK);
    }

    @PostMapping(value = "delete/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> deleteProduct(@PathVariable("id") Product product) throws JsonProcessingException {
        productRepository.delete(product);

        PostDefaultResponse postDefaultResponse = new PostDefaultResponse();
        ObjectMapper mapper = new ObjectMapper();

        postDefaultResponse.setProduct(product);
        postDefaultResponse.setSucsessfull(true);

        mapper.writeValueAsString(postDefaultResponse);

        return new ResponseEntity<>(mapper.writeValueAsString(postDefaultResponse), HttpStatus.OK);
    }

}
