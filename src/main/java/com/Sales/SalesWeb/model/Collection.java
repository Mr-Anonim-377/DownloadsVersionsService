package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

@Entity()
@Table(name = "collections")
@Data
public class Collection {

    @Id
    private Integer collectionId;

    private String collectionName;

    private String collectionDescription;

    private UUID imageId;

}
