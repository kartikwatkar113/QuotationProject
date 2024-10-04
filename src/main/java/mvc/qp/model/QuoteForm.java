package mvc.qp.model;

import java.util.List;

public class QuoteForm {

	private String status;
    private String quoteDate;
    private String customer;
    private List<ProductDetails> products;
    private double subtotal;
    private double discount;
    private double grandTotal;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getQuoteDate() {
		return quoteDate;
	}
	public void setQuoteDate(String quoteDate) {
		this.quoteDate = quoteDate;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public List<ProductDetails> getProducts() {
		return products;
	}
	public void setProducts(List<ProductDetails> products) {
		this.products = products;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	@Override
	public String toString() {
		return "QuoteForm [status=" + status + ", quoteDate=" + quoteDate + ", customer=" + customer + ", products="
				+ products + ", subtotal=" + subtotal + ", discount=" + discount + ", grandTotal=" + grandTotal + "]";
	}
}
