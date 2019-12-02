package com.Sales.SalesWeb.controller;

import com.Sales.SalesWeb.controller.exception.InternalServerError;
import com.Sales.SalesWeb.controller.exception.NoSuchObject;
import com.Sales.SalesWeb.model.Collection;
import com.Sales.SalesWeb.model.Image;
import com.Sales.SalesWeb.service.CollectionService;
import com.Sales.SalesWeb.service.ImageService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(value = "image", produces = MediaType.APPLICATION_JSON_VALUE)
public class ImageController {
    private final ImageService imageService;

    public ImageController(ImageService imageService) {
        this.imageService = imageService;
    }

    @GetMapping(value = "{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity getCollection(@PathVariable UUID id) {
        Image image;
        try {
            image = imageService.getImage(id);
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new InternalServerError();
        }
        if (image == null) {
            throw new NoSuchObject();
        }
        return new ResponseEntity<>(image, HttpStatus.OK);
    }

}
