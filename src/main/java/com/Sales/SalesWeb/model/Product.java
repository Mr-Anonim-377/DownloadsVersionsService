package com.Sales.SalesWeb.model;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.UUID;

@Entity()
@Table(name = "products")
@Data
public class Product {
    @Id
    private UUID id;

    private String title;

    private Integer product_category_id;

    private Double price;

    private UUID image_id;

    private Integer collection_id;

    private UUID delivery_id;

//    @Column(name = "properties")
//    @Type(type = "com.Sale.SalesWeb.model.DataType.JsonType")
//    private JsonElement properties;
    private String properties;

    private String description;
}
