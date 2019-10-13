package com.Sales.SalesWeb.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.rmi.server.UID;
import java.util.UUID;

@Entity
@Table(name = "sales")
@Data
public class Sales {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(name = "title")
    private String title;

    @Column(name = "images_id")
    private UUID image_id;
}
