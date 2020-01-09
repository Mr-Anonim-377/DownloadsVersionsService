package com.services.serviceDownloadsVersions.controller.handlers;

import com.services.serviceDownloadsVersions.controller.exception.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.io.FileNotFoundException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@ControllerAdvice
public class AwesomeExceptionHandler extends ResponseEntityExceptionHandler {

    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-LL-yyyy/HH:mm:ss");

    @ExceptionHandler(InternalServerExeption.class)
    protected ResponseEntity<ExceptionResponse> handleIntermalServerError(Exception exc) {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now().format(formatter),
                "Server Error", "INTERNAL_SERVER_ERROR"), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(JsonEmptyError.class)
    protected ResponseEntity<ExceptionResponse> handleJsonEmptyError(Exception exc) {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now().format(formatter),
                "JSON File is empty", "JSON_FILE_ERROR"), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(JsonParseError.class)
    protected ResponseEntity<ExceptionResponse> handleJsonParseError(Exception exc) {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now().format(formatter),
                "JSON Parse Error", "JSON_FILE_ERROR"), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(JsonReadError.class)
    protected ResponseEntity<ExceptionResponse> handleJsonReadError(Exception exc) {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now().format(formatter),
                "Don't read JSON File", "JSON_FILE_ERROR"), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(FileNotFoundException.class)
    protected ResponseEntity<ExceptionResponse> handleFileNotFoundException(Exception exc) {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now().format(formatter),
                "Don't found file", "FILE_FOUND_ERROR"), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(UploadFileEmptyError.class)
    protected ResponseEntity<ExceptionResponse> handleFileEmptyError(Exception exc) {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now().format(formatter),
                "Unload's file is Empty", "FILE_EMPTY_ERROR"), HttpStatus.NOT_FOUND);
    }


    @Data
    @AllArgsConstructor
    private static class ExceptionResponse {
        private String dateTime;
        private String message;
        private String type;
    }


}
