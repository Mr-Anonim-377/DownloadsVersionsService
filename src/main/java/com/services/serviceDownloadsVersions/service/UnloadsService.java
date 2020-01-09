package com.services.serviceDownloadsVersions.service;

import com.google.gson.Gson;
import com.services.serviceDownloadsVersions.model.Download;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import static com.services.serviceDownloadsVersions.SalesWebApplication.*;

@Service
public class UnloadsService {
    private Gson gson = new Gson();

    public void unloadActualVersions(MultipartFile file) throws IOException {
        byte[] bufferByte = file.getBytes();
        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(CURRENT_SYSTEM_PATH
                + CURRENT_PACKAGE
                + "actualCurrentVersion\\"
                + file.getOriginalFilename())));
        stream.write(bufferByte);
        stream.close();
    }

    public void createJsonFile(MultipartFile file, String version, List<String> changeLog) throws IOException {
        Download jsonFile = new Download(Objects.requireNonNull(file.getOriginalFilename()).split("\\.")[0],
                version,
                changeLog,
                LocalDate.now(),
                String.format("/downloads/getActualFile/%s", file.getOriginalFilename()));

        File actualVersionJsonFile = new File(CURRENT_SYSTEM_PATH + CURRENT_PACKAGE + CURRENT_JSON_FILE);
        FileWriter writer = new FileWriter(actualVersionJsonFile);
        writer.write(gson.toJson(jsonFile));
        writer.close();
    }
}
