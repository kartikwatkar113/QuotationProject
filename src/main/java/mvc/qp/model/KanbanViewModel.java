package mvc.qp.model;

public class KanbanViewModel {

	private int quoteID;
	private String custName;
	private String custaddress;
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
	public String getCustaddress() {
		return custaddress;
	}
	public void setCustaddress(String custaddress) {
		this.custaddress = custaddress;
	}
	@Override
	public String toString() {
		return "KanbanViewModel [quoteID=" + quoteID + ", custName=" + custName + ", custaddress=" + custaddress + "]";
	}
	
	
	
	
}
