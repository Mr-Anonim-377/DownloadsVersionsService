package com.Sales.SalesWeb.controller.exception;

public class InternalServerExeption extends RuntimeException {
 public InternalServerExeption(String message){
    super(message);
  }

}
