package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.FavoriteCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface FavoriteCategoryRepository extends JpaRepository<FavoriteCategory, UUID> {

    List<FavoriteCategory> findAll();
}

