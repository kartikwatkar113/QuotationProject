package mvc.qp.model;

public class CustomerModel {

	private int custID;
	private String custName;
	private String custEmail;
	private String custAddress;
	public int getCustID() {
		return custID;
	}
	public void setCustID(int custID) {
		this.custID = custID;
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
	@Override
	public String toString() {
		return "CustomerModel [custID=" + custID + ", custName=" + custName + ", custEmail=" + custEmail
				+ ", custAddress=" + custAddress + "]";
	}
	
}
