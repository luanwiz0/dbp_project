package model.service;

public class CartNotFoundException extends Exception {

	public CartNotFoundException() {
		super();
	}

	public CartNotFoundException(String msg) {
		super(msg);
	}
}