package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.FavoriteCategoryProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface FavoriteCategoryProductsRepository extends JpaRepository<FavoriteCategoryProduct, UUID> {

    List<FavoriteCategoryProduct> findByFavoriteCategoryId(UUID favoriteCategoryId);
}
