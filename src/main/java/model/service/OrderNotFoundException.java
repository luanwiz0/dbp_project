package model.service;

public class OrderNotFoundException extends Exception{
	public OrderNotFoundException() {
		super();
	} 
	public OrderNotFoundException(String o) {
		super(o);
	}
}