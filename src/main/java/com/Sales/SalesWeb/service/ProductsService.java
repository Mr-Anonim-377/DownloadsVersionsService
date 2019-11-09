package com.Sales.SalesWeb.service;

import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.FavoriteCategoryProductsRepository;
import com.Sales.SalesWeb.repository.FavoriteCategoryRepository;
import com.Sales.SalesWeb.repository.ProductRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class ProductsService {
    private final ProductRepository productRepository;
    private final FavoriteCategoryRepository favoriteCategoriesRepository;
    private final FavoriteCategoryProductsRepository favoriteCategoryProductsRepository;

    public ProductsService(ProductRepository productRepository,
                           FavoriteCategoryRepository favoriteCategoriesRepository,
                           FavoriteCategoryProductsRepository favoriteCategoryProductsRepository) {
        this.productRepository = productRepository;
        this.favoriteCategoriesRepository = favoriteCategoriesRepository;
        this.favoriteCategoryProductsRepository = favoriteCategoryProductsRepository;
    }

    public void getFavoriteCategoriesFavoriteProdcuts() {

    }

    public ResponseEntity createProduct(Product product) {
        return new ResponseEntity<>(productRepository.save(product), HttpStatus.OK);
    }

    public ResponseEntity deleteProduct(Product product) {
        productRepository.delete(product);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
