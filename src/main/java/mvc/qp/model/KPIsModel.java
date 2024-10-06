package mvc.qp.model;

public class KPIsModel {

	private long openQuotes;
	private double conversionRatio;
	private double rejectionRatio;
	private long quotedCurMoth;
	public long getOpenQuotes() {
		return openQuotes;
	}
	public void setOpenQuotes(long openQuotes) {
		this.openQuotes = openQuotes;
	}
	public double getConversionRatio() {
		return conversionRatio;
	}
	public void setConversionRatio(double conversionRatio) {
		this.conversionRatio = conversionRatio;
	}
	public double getRejectionRatio() {
		return rejectionRatio;
	}
	public void setRejectionRatio(double rejectionRatio) {
		this.rejectionRatio = rejectionRatio;
	}
	public long getQuotedCurMoth() {
		return quotedCurMoth;
	}
	public void setQuotedCurMoth(long quotedCurMoth) {
		this.quotedCurMoth = quotedCurMoth;
	}
	@Override
	public String toString() {
		return "KPIsModel [openQuotes=" + openQuotes + ", conversionRatio=" + conversionRatio + ", rejectionRatio="
				+ rejectionRatio + ", quotedCurMoth=" + quotedCurMoth + "]";
	}
}
