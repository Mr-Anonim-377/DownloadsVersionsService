package com.Sales.SalesWeb.service;

import com.Sales.SalesWeb.model.Collection;
import com.Sales.SalesWeb.repository.CollectionRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CollectionService {
    private final CollectionRepository collectionRepository;

    public CollectionService(CollectionRepository collectionRepository) {
        this.collectionRepository = collectionRepository;
    }

    public Collection getCollect(Integer id) {
        return collectionRepository.findByCollectionId(id);

    }

    public ArrayList<Collection> getAllCollect() {
        return collectionRepository.findAll();

    }
}
