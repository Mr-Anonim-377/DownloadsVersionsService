package com.Sales.SalesWeb;

import com.services.serviceDownloadsVersions.controller.DownloadController;
import com.services.serviceDownloadsVersions.model.Download;
import com.services.serviceDownloadsVersions.service.DownloadsService;
import org.junit.jupiter.api.Test;
import org.springframework.http.ResponseEntity;

class SaleWebApplicationTests {

    @Test
    void genericTest() {
        DownloadController downloadController = new DownloadController(new DownloadsService());
        ResponseEntity actualVersions = downloadController.getActualVersions();
        if (actualVersions.getBody().getClass() != Download.class) {
            throw new RuntimeException("Test error");
        }
    }
}
