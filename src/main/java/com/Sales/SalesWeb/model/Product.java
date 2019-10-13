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

    private UUID product_type_id;

    private double price;

    private UUID image_id;

    private UUID collection_id;

    private UUID delivery_id;

    private UUID properties_id;

    private String type;

}
