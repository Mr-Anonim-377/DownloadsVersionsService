package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "sales")
@Data
public class Sale {

    @Id
    private Integer saleId;

    private String saleName;

    private UUID imageId;

    private Double discount;
}
