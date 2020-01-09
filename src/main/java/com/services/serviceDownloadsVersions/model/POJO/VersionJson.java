package com.services.serviceDownloadsVersions.model.POJO;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class VersionJson {

    @SerializedName("name")
    @Expose
    private String name;
    @SerializedName("version")
    @Expose
    private String versions;
    @SerializedName("changeLog")
    @Expose
    private List<String> changeLog = null;
    @SerializedName("createData")
    @Expose
    private LocalDate createData;
    @SerializedName("downloadUri")
    @Expose
    private String downloadUrl;

}