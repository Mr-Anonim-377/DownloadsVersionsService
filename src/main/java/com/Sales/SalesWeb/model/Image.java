package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
import java.util.UUID;

@Entity()
@Table(name = "images")
@Data
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID imageId;

    private String imagePatch;

}


