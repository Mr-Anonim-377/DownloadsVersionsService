package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity()
@Table(name = "favorite_category_products")
@Data
public class FavoriteCategoryProduct {
    @Id
    private UUID favoriteCategoryProductId;

    private UUID productId;

    private UUID favoriteCategoryId;
}
