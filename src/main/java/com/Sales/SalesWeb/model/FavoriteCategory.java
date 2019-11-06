package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity()
@Table(name = "favorite_category")
@Data
public class FavoriteCategory {

    @Id
    private UUID id;

    private Integer categoryId;

    private String title;

    private Integer popularValue;

}
