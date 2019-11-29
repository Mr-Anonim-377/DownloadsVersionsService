package com.Sales.SalesWeb.controller.exception;

public class InternalServerExeption extends RuntimeException {
 public InternalServerException(String message){
    super(message);
  }
 
 public InternalServerException(){
   this("InternalServerError);
  }

}
