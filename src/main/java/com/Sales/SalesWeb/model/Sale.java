package com.Sales.SalesWeb.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.UUID;

@Entity
@Table(name = "sales")
@Data
public class Sale {

    @Id
    private Integer saleId;

    private String saleName;

    private UUID imageId;

    private BigDecimal discount;
}
