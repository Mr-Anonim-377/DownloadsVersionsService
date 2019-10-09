package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigInteger;
import java.rmi.server.UID;

@Entity
@Data
public class Image {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UID id;

        @Column(name = "image")
        private String image;

    }


