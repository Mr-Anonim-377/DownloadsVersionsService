package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigInteger;
import java.rmi.server.UID;

@Entity
@Data
public class Product {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UID id;

    private String title;

    private UID product_type_id;

    private double price;

    private UID image_id;

    private UID collection_id;

    private UID delivery_id;

    private UID properties_id;

    private String type;



}
