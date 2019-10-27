package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.ProductRepository;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "products", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProductController {
    private final ProductRepository productRepository;
    private Gson gson;

    @Autowired
    public ProductController(ProductRepository productRepository) {
        this.productRepository = productRepository;
        gson = new GsonBuilder().setPrettyPrinting().serializeNulls().create();
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

        long countNotNullJsonParam = gson.toJsonTree(product)
                .getAsJsonObject()
                .entrySet()
                .stream()
                .filter(jObj -> !jObj.getValue().isJsonNull()).count();
        try {
            if (countNotNullJsonParam == 0) {
                Map<String, Object> response = new HashMap<String, Object>();
                response.put("RequestJson", product);
                response.put("Error", "Не верная валидация входных параметров Json обьекта");
                return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
            } else {
                Product save = productRepository.save(product);
                return new ResponseEntity<>(save, HttpStatus.OK);
            }
        } catch (RuntimeException e) {
            Map<String, Object> response = new HashMap<String, Object>();
            response.put("Error", e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
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
