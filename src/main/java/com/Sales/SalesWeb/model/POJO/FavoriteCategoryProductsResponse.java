package com.Sales.SalesWeb.model.POJO;

import com.Sales.SalesWeb.model.Product;
import lombok.Data;

import java.util.List;
@Data
public class FavoriteCategoryProductsResponse {
    private String favoriteCategory;
    private Integer popularValue;
    private List<Product> products;
}
