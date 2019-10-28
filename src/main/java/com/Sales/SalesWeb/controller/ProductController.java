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
        try {
            if (isNullJsonOject(product)) {
                return new ResponseEntity<>(nullObjectResponse(product, "Передан пустой обьект"),
                        HttpStatus.BAD_REQUEST);
            } else {
                Product save = productRepository.save(product);
                return new ResponseEntity<>(save, HttpStatus.OK);
            }
        } catch (RuntimeException e) {
            Map<String, Object> response = new HashMap<>();
            response.put("error", e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    private boolean isNullJsonOject(Object object) {
        System.out.println("ereqrere");
        long countNotNullJsonParam = gson.toJsonTree(object)
                .getAsJsonObject()
                .entrySet()
                .stream()
                .filter(jObj -> !jObj.getValue().isJsonNull()).count();
        return countNotNullJsonParam == 0;
    }

    private Map<String, Object> nullObjectResponse(Object obj, String errorString) {
        Map<String, Object> response = new HashMap<>();
        response.put("error", errorString);
        response.put("jsonObject", obj);
        return response;
    }

    @PostMapping(value = "delete/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> deleteProduct(@PathVariable("id") Product product) {
        try {
            if (isNullJsonOject(product)) {
                return new ResponseEntity<>(nullObjectResponse(product, "Передан пустой обьект"),
                        HttpStatus.BAD_REQUEST);
            } else {
                productRepository.delete(product);
                return new ResponseEntity<>(new HashMap<String,String>().put("successful", "true"),
                        HttpStatus.OK);
            }
        } catch (RuntimeException e) {
            return new ResponseEntity<>(new HashMap<String,String>().put("error", e.getMessage()),
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
