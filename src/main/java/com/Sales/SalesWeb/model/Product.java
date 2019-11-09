package com.Sales.SalesWeb.model;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import lombok.Data;
import org.flywaydb.core.internal.database.postgresql.PostgreSQLType;
import org.hibernate.annotations.Type;
import org.hibernate.type.descriptor.sql.NumericTypeDescriptor;

import javax.persistence.*;
import java.sql.SQLData;
import java.util.UUID;

import static org.hibernate.type.descriptor.sql.NumericTypeDescriptor.INSTANCE;

@Entity()
@Table(name = "products")
@Data
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID productId;


    private String nameProduct;

    private Integer productCategoryId;

    private Double price;

    private UUID imageId;

    private Integer collectionId;

//    @Column(name = "properties")
//    @Type(type = "com.Sale.SalesWeb.model.DataType.JsonType")
//    private JsonElement properties;
    private String properties;

    private String productDescription;
}
