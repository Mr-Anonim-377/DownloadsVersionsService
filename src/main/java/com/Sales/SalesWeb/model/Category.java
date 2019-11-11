package com.Sales.SalesWeb.model;


import lombok.Data;

import javax.persistence.*;

@Entity()
@Table(name = "categories")
@Data
public class Category {

    @Id
    private Integer categoryId;

    private Integer parentCategoryId;

    private String categoryName;

}
