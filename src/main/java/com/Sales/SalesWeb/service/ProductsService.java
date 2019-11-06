package com.Sales.SalesWeb.service;

import com.Sales.SalesWeb.model.FavoriteCategory;
import com.Sales.SalesWeb.model.FavoriteCategoryProduct;
import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.FavoriteCategoryProductsRepository;
import com.Sales.SalesWeb.repository.FavoriteCategoryRepository;
import com.Sales.SalesWeb.repository.ProductRepository;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

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

    public ResponseEntity getFavoriteCategoriesFavoriteProdcuts() {
        Set<JsonObject> responsSet = new HashSet<JsonObject>();
        Gson g = new Gson();
        List<FavoriteCategory> favoriteCategories = favoriteCategoriesRepository.findAll();
//        favoriteCategories.sort((o1, o2) -> o2.getPopularValue() - o1.getPopularValue());
        for(FavoriteCategory favoriteCategory : favoriteCategories){
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("favoriteCategory",favoriteCategory.getTitle());
            jsonObject.addProperty("popularValue",favoriteCategory.getPopularValue());
            jsonObject.add("products",g.toJsonTree(favoriteCategoryProductsRepository.
                    findByFavoriteCategoryId(favoriteCategory.getId())));
            responsSet.add(jsonObject);
        }
        return new ResponseEntity<>(responsSet.toString(), HttpStatus.OK);
    }

    public ResponseEntity createProduct(Product product){
        return new ResponseEntity<>(productRepository.save(product), HttpStatus.OK);
    }
    public ResponseEntity deleteProduct(Product product){
        productRepository.delete(product);
        return new ResponseEntity <> (HttpStatus.OK);
    }


}
