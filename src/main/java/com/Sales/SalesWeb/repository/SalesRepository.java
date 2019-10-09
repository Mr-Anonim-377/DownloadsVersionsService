package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.Sales;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SalesRepository extends JpaRepository<Sales, Integer> {





}
