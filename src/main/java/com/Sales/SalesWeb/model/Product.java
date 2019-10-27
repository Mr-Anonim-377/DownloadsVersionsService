package com.Sales.SalesWeb.model;

import com.google.gson.JsonObject;
import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Data
public class Product {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    private String title;

    private Integer product_type_id;

    private Double price;

    private UUID image_id;

    private Integer collection_id;

    private UUID delivery_id;

    @Column(name = "properties")
    @Type(type = "com.Sales.SalesWeb.model.DataType.JsonType")
    private JsonObject properties;

    private String type;

}
