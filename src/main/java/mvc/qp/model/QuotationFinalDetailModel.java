package mvc.qp.model;

import java.util.List;

public class QuotationFinalDetailModel {

	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private int quoteID;
	private String quoteDate;
	private String custName;
	private String custEmail;
	private String custAddress;
	private double disount;
	private double grandTotal;
	private List<ProductDetails> products;
	public int getQuoteID() {
		return quoteID;
	}
	public void setQuoteID(int quoteID) {
		this.quoteID = quoteID;
	}
	public String getQuoteDate() {
		return quoteDate;
	}
	public void setQuoteDate(String quoteDate) {
		this.quoteDate = quoteDate;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustEmail() {
		return custEmail;
	}
	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}
	public String getCustAddress() {
		return custAddress;
	}
	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}
	public double getDisount() {
		return disount;
	}
	public void setDisount(double disount) {
		this.disount = disount;
	}
	public double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	public List<ProductDetails> getProducts() {
		return products;
	}
	public void setProducts(List<ProductDetails> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "QuotationFinalDetailModel [status=" + status + ", quoteID=" + quoteID + ", quoteDate=" + quoteDate
				+ ", custName=" + custName + ", custEmail=" + custEmail + ", custAddress=" + custAddress + ", disount="
				+ disount + ", grandTotal=" + grandTotal + ", products=" + products + "]";
	}
}
