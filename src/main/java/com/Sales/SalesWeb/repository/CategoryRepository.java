package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CategoryRepository extends JpaRepository<Category, UUID> {

    Category findByCategoryId(Integer categoryId);

}
