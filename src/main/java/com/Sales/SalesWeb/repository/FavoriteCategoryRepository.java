package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.FavoriteCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.UUID;

public interface FavoriteCategoryRepository extends JpaRepository<FavoriteCategory, UUID> {

    ArrayList<FavoriteCategory> findAll();

    FavoriteCategory findByFavoriteCategoryId(UUID favoriteCategoryId);
}

