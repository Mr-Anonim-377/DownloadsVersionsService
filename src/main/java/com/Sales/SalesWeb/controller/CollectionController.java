package com.Sales.SalesWeb.controller;

import com.Sales.SalesWeb.controller.exception.InternalServerError;
import com.Sales.SalesWeb.controller.exception.NoSuchObject;
import com.Sales.SalesWeb.model.Collection;
import com.Sales.SalesWeb.service.CollectionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "collection", produces = MediaType.APPLICATION_JSON_VALUE)
public class CollectionController {
    private final CollectionService collectionService;

    public CollectionController(CollectionService collectionService) {
        this.collectionService = collectionService;
    }

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity getCollection(@PathVariable Integer id) {
        Collection collection;
        try {
            collection = collectionService.getCollect(id);
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new InternalServerError();
        }
        if (collection == null) {
            throw new NoSuchObject();
        }
        return new ResponseEntity<>(collection, HttpStatus.OK);
    }

    @GetMapping(value = "all", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity getAllCollection() {
        List<Collection> collections;
        try {
            collections = collectionService.getAllCollect();
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new InternalServerError();
        }
        return new ResponseEntity<>(collections, HttpStatus.OK);
    }
}
