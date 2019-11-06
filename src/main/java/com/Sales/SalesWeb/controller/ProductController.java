package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.service.ProductsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "products", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProductController {
    private final ProductsService productsService;

    public ProductController(ProductsService productsService) {
        this.productsService = productsService;
    }

    @GetMapping("{id}")
    public ResponseEntity getProduct(@PathVariable("id") Product product) {
        return new ResponseEntity<>(product, HttpStatus.OK);
    }

    @PostMapping("favorite")
    public ResponseEntity getFavoriteCategoriesFavoriteProdcuts() {
        return productsService.getFavoriteCategoriesFavoriteProdcuts();
    }

    @PostMapping(value = "create", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity createProduct(@RequestBody Product product) {
        return productsService.createProduct(product);
    }
    @PostMapping(value = "delete/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity deleteProduct(@PathVariable("id") Product product) {
        return productsService.deleteProduct(product);
    }

}
