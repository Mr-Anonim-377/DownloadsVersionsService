package com.Sales.SalesWeb.controller;


import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
    public String createProduct(@RequestBody Product product){

        return productRepository.save(product).toString();
    }

    @PostMapping("delete/{id}")
    public String deleteProduct(@PathVariable("id") Product product){
        productRepository.delete(product);
        return "{type:sucsessfull}";
    }

}
