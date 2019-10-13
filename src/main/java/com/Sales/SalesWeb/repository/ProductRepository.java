package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigInteger;
import java.util.UUID;

public interface ProductRepository extends JpaRepository<Product, UUID> {
}
