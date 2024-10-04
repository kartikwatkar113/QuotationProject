package mvc.qp.model;

public class ProductDetails {

	private String productId;
	private int qty;
	private double rate;
	private double amount;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getqty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "ProductDetails [productId=" + productId + ", qty=" + qty + ", rate=" + rate + ", amount="
				+ amount + "]";
	}
}
