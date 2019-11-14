package com.Sales.SalesWeb.controller.Handlers;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.apache.tomcat.jni.Local;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.time.LocalDate;
import java.time.LocalDateTime;

@ControllerAdvice
public class AwesomeExceptionHandler extends ResponseEntityExceptionHandler {

    public static class NoSuchObject extends RuntimeException {
    }

    public static class IntermalServerError extends RuntimeException {
    }


    @ExceptionHandler(NoSuchObject.class)
    protected ResponseEntity<ExceptionResponse> handleThereIsNoSuchUserException() {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now(), "No such object in db"), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(IntermalServerError.class)
    protected ResponseEntity<ExceptionResponse> handleIntermalServerError() {
        return new ResponseEntity<>(new ExceptionResponse(LocalDateTime.now(), "No such object in db"), HttpStatus.NOT_FOUND);
    }


    @Data
    @AllArgsConstructor
    private static class ExceptionResponse {
        LocalDateTime dateTime;
        private String message;
    }




}
