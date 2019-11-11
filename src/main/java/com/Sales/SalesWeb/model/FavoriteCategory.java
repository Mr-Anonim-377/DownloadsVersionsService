package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
import java.util.UUID;

@Entity()
@Table(name = "favorite_category")
@Data
public class FavoriteCategory {

    @Id
    private UUID favoriteCategoryId;

    private Integer categoryId;

    private Integer popularValue;

}
