package mvc.qp.model;

public class KanbanViewModel {

	private int quoteID;
	private String custName;
	private double amount;
	private String status;
	public int getQuoteID() {
		return quoteID;
	}
	public void setQuoteID(int quoteID) {
		this.quoteID = quoteID;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "KanbanViewModel [quoteID=" + quoteID + ", custName=" + custName + ", amount=" + amount + ", status="
				+ status + "]";
	}
}
