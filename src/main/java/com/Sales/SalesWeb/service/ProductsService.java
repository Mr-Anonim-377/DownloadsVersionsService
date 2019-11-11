package com.Sales.SalesWeb.service;

import com.Sales.SalesWeb.model.FavoriteCategory;
import com.Sales.SalesWeb.model.FavoriteCategoryProduct;
import com.Sales.SalesWeb.model.POJO.FavoriteCategoryProductsResponse;
import com.Sales.SalesWeb.model.Product;
import com.Sales.SalesWeb.repository.CategoryRepository;
import com.Sales.SalesWeb.repository.FavoriteCategoryProductsRepository;
import com.Sales.SalesWeb.repository.FavoriteCategoryRepository;
import com.Sales.SalesWeb.repository.ProductRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductsService {
    private final ProductRepository productRepository;
    private final FavoriteCategoryRepository favoriteCategoriesRepository;
    private final FavoriteCategoryProductsRepository favoriteCategoryProductsRepository;
    private final CategoryRepository categoryRepository;

    public ProductsService(ProductRepository productRepository,
                           FavoriteCategoryRepository favoriteCategoriesRepository,
                           FavoriteCategoryProductsRepository favoriteCategoryProductsRepository,
                           CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.favoriteCategoriesRepository = favoriteCategoriesRepository;
        this.favoriteCategoryProductsRepository = favoriteCategoryProductsRepository;
        this.categoryRepository = categoryRepository;
    }


    public Product getProduct(UUID id) {
        return productRepository.findByProductId(id);
    }

    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    public void deleteProduct(Product product) {
        productRepository.delete(product);
    }

    public Map<String, Product> updateProduct(Product productFromDb, Product productFromReqest) {
        Map<String, Product> responseMap = new HashMap<>();
        Product currentProduct;
        currentProduct = productFromDb;
        BeanUtils.copyProperties(productFromDb, productFromReqest, "productId");
        responseMap.put("updatedProduct", productFromDb);
        responseMap.put("currentProduct", currentProduct);
        return responseMap;
    }

    private List<Product> getFavoriteProductList(List<FavoriteCategoryProduct> favoriteCategoryProductList) {
        List<Product> productList = new ArrayList<>();
        for (FavoriteCategoryProduct favoriteCategoryProduct : favoriteCategoryProductList) {
            productList.add(productRepository.findByProductId(favoriteCategoryProduct.getProductId()));
        }
        return productList;
    }

    public List<FavoriteCategoryProductsResponse> getFavoriteCategoriesFavoriteProdcuts() {
        List<FavoriteCategory> favoriteCategories = favoriteCategoriesRepository.findAll();
        favoriteCategories.sort((o1, o2) -> o2.getPopularValue() - o1.getPopularValue());
        List<FavoriteCategoryProductsResponse> favoriteCategoryProductsResponseList = new ArrayList<>();
        for (FavoriteCategory favoriteCategory : favoriteCategories) {
            FavoriteCategoryProductsResponse favoriteCategoryProductsResponse = new FavoriteCategoryProductsResponse();
            favoriteCategoryProductsResponse.setFavoriteCategory(categoryRepository
                    .findByCategoryId(favoriteCategory.getCategoryId())
                    .getCategoryName());
            favoriteCategoryProductsResponse.setPopularValue(favoriteCategory.getPopularValue());
            favoriteCategoryProductsResponse.setProducts(getFavoriteProductList(favoriteCategoryProductsRepository
                    .findByFavoriteCategoryId(favoriteCategory.getFavoriteCategoryId())));
            favoriteCategoryProductsResponseList.add(favoriteCategoryProductsResponse);
        }
        return favoriteCategoryProductsResponseList;
    }
}
