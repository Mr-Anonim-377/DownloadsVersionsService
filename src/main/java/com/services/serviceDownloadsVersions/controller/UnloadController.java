package com.services.serviceDownloadsVersions.controller;

import com.services.serviceDownloadsVersions.controller.exception.InternalServerExeption;
import com.services.serviceDownloadsVersions.controller.exception.UploadFileEmptyError;
import com.services.serviceDownloadsVersions.service.UnloadsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(value = "unloads", produces = MediaType.APPLICATION_JSON_VALUE)
public class UnloadController {
    private final UnloadsService unloadService;

    public UnloadController(UnloadsService unloadService) {
        this.unloadService = unloadService;
    }

    @PostMapping(value = "unloadActualVersions", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity unloadActualVersions(@RequestParam(required = false, name = "version") String version,
                                               @RequestParam(required = false,
                                                       name = "changeLog") List<String> changeLog,
                                               @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                unloadService.unloadActualVersions(file);
                unloadService.createJsonFile(file, version, changeLog);
                return new ResponseEntity<>("Successful",HttpStatus.OK);
            } catch (IOException e) {
                throw new InternalServerExeption();
            }
        } else {
            throw new UploadFileEmptyError();
        }
    }

}
