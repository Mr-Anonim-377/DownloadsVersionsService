package com.Sales.SalesWeb.model;

import lombok.Data;

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

    private double price;

    private UUID image_id;

    private Integer collection_id;

    private UUID delivery_id;

    private UUID properties_id;

    private String type;

}
