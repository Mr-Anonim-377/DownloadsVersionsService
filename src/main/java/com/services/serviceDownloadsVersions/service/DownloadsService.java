package com.services.serviceDownloadsVersions.service;

import com.google.gson.Gson;
import com.services.serviceDownloadsVersions.model.Download;
import com.services.serviceDownloadsVersions.model.POJO.VersionJson;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import static com.services.serviceDownloadsVersions.SalesWebApplication.*;

@Service
public class DownloadsService {
    private Gson gson = new Gson();

    public File getActualFile(String fileName) {
        return new File(CURRENT_SYSTEM_PATH + CURRENT_PACKAGE+"actualCurrentVersion\\" + fileName);
    }

    public Download getActualVersions() throws IOException {
        File actualVersionJsonFile = new File(CURRENT_SYSTEM_PATH + CURRENT_PACKAGE + CURRENT_JSON_FILE);
        char[] buffer = new char[10000];
        FileReader fileReader = new FileReader(actualVersionJsonFile);
        fileReader.read(buffer);
        fileReader.close();
        String fileContext = new String(buffer).replaceAll("\\u0000", "");
        if (!fileContext.equals("")) {
            VersionJson downloadJson = gson.fromJson(fileContext, VersionJson.class);
            Download downloadFile = new Download();
            downloadFile.setName(downloadJson.getName());
            downloadFile.setChangeLog(downloadJson.getChangeLog());
            downloadFile.setCreateData(downloadJson.getCreateData());
            downloadFile.setDownloadUri(downloadJson.getDownloadUrl());
            downloadFile.setVersion(downloadJson.getVersions());
            return downloadFile;
        } else {
            throw new RuntimeException("JsonEmpty");
        }


    }

}


