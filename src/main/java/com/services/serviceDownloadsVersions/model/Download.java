package com.services.serviceDownloadsVersions.model;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class Download {

    public Download(String name, String versions, List<String> changeLog, LocalDate createData, String downloadUri) {
        this.name = name;
        this.version = versions;
        this.changeLog = changeLog;
        this.createData = createData;
        this.downloadUri = downloadUri;
    }

    public Download() {

    }

    private String name;
    private String version;
    private List<String> changeLog;
    private LocalDate createData;
    private String downloadUri;

}
