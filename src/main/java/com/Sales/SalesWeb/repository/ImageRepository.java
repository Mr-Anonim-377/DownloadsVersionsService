package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.math.BigInteger;

public interface ImageRepository extends JpaRepository <Image, BigInteger>{
}
