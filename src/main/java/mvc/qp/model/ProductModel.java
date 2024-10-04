package mvc.qp.model;

public class ProductModel {

	private int proID;
	private String proName;
	private float proPrice;
	public int getProID() {
		return proID;
	}
	public void setProID(int proID) {
		this.proID = proID;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public float getProPrice() {
		return proPrice;
	}
	public void setProPrice(float proPrice) {
		this.proPrice = proPrice;
	}
	@Override
	public String toString() {
		return "ProductModel [proID=" + proID + ", proName=" + proName + ", proPrice=" + proPrice + "]";
	}
	
	
}
