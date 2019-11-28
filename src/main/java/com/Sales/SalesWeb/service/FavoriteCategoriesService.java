package com.Sales.SalesWeb.service;

import com.Sales.SalesWeb.model.FavoriteCategory;
import com.Sales.SalesWeb.repository.FavoriteCategoryRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class FavoriteCategoriesService {
    private final FavoriteCategoryRepository favoriteCategoriesRepository;

    public FavoriteCategoriesService(FavoriteCategoryRepository favoriteCategoriesRepository) {
        this.favoriteCategoriesRepository = favoriteCategoriesRepository;
    }

    public FavoriteCategory getfavoriteCategory(UUID id) {
        return favoriteCategoriesRepository.findByFavoriteCategoryId(id);

    }

    public ArrayList<FavoriteCategory> getAllFavoriteCategories() {
        ArrayList<FavoriteCategory> favoriteCategories = favoriteCategoriesRepository.findAll();
        favoriteCategories.sort((o1, o2) -> o2.getPopularValue() - o1.getPopularValue());
        return favoriteCategories;
    }

}
