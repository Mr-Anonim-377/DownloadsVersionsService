package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
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
