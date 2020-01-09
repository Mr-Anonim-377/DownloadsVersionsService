package com.services.serviceDownloadsVersions.controller;

import com.services.serviceDownloadsVersions.controller.exception.JsonEmptyError;
import com.services.serviceDownloadsVersions.controller.exception.JsonParseError;
import com.services.serviceDownloadsVersions.controller.exception.JsonReadError;
import com.services.serviceDownloadsVersions.model.Download;
import com.services.serviceDownloadsVersions.service.DownloadsService;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import static com.services.serviceDownloadsVersions.SalesWebApplication.CURRENT_PACKAGE;
import static com.services.serviceDownloadsVersions.SalesWebApplication.CURRENT_SYSTEM_PATH;

@RestController
@RequestMapping(value = "downloads")
public class DownloadController {
    private final DownloadsService downloadsService;

    public DownloadController(DownloadsService downloadsService) {
        this.downloadsService = downloadsService;
    }

    @GetMapping(value = "getActualFile/{fileName}")
    public ResponseEntity getActualFile(@PathVariable String fileName) {
        File file = downloadsService.getActualFile(fileName);
        InputStreamResource resource = null;
        try {
            resource = new InputStreamResource(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + file.getName())
                .contentType(MediaType.APPLICATION_OCTET_STREAM).contentLength(file.length())
                .body(resource);
    }

    @GetMapping(value = "getActualVersions", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity getActualVersions() {
        try {
            Download downloadObject = downloadsService.getActualVersions();
            return new ResponseEntity<>(downloadObject, HttpStatus.OK);
        } catch (RuntimeException e) {
            if (e.getMessage().equals("JsonEmpty")) {
                throw new JsonEmptyError();
            } else {
                throw new JsonParseError();
            }
        } catch (IOException e) {
            throw new JsonReadError();
        }
    }
}