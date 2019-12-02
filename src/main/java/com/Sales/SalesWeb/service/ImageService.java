package com.Sales.SalesWeb.service;

import com.Sales.SalesWeb.model.Collection;
import com.Sales.SalesWeb.model.Image;
import com.Sales.SalesWeb.repository.CollectionRepository;
import com.Sales.SalesWeb.repository.ImageRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

@Service
public class ImageService {
    private final ImageRepository imageRepository;

    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    public Image getImage(UUID id) {
        return imageRepository.findByImageId(id);
    }
}
