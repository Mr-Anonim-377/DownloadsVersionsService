package com.Sales.SalesWeb.repository;

import com.Sales.SalesWeb.model.Category;
import com.Sales.SalesWeb.model.Collection;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.UUID;

public interface CollectionRepository extends JpaRepository<Collection, UUID> {

    Collection findByCollectionId(Integer categoryId);
    ArrayList<Collection> findAll();

}
