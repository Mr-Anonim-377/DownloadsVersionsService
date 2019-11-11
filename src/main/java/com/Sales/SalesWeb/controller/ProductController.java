package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.service.ProductsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping(value = "products", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProductController {
    private final ProductsService productsService;

    public ProductController(ProductsService productsService) {
        this.productsService = productsService;
    }

    @GetMapping("{id}")
    public ResponseEntity getProduct(@PathVariable UUID id) {
        return new ResponseEntity<>(productsService.getProduct(id), HttpStatus.OK);
    }

    @PostMapping(value = "create", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity createProduct(@RequestBody Product product) {
        return new ResponseEntity<>(productsService.createProduct(product), HttpStatus.OK);
    }

    @DeleteMapping(value = "{id}/delete", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity deleteProduct(@PathVariable("id") Product product) {
        productsService.deleteProduct(product);
        return new ResponseEntity<>("\"delete\":\"successfully\"", HttpStatus.OK);
    }

    @PutMapping(value = "{id}/update", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity updateProduct(@PathVariable("id") Product productFromDb, @RequestBody Product productFromReqest) {
        return new ResponseEntity<>(productsService.updateProduct(productFromDb, productFromReqest), HttpStatus.OK);
    }

    @PostMapping(value = "favorites",produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity getFavoriteCategoriesFavoriteProdcuts() {
        return new ResponseEntity<>(productsService.getFavoriteCategoriesFavoriteProdcuts(), HttpStatus.OK);
    }

}
