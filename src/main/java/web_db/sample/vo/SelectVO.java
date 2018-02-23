package web_db.sample.vo;

public class SelectVO {
	private String selTB;
	
	public String getSelTB() {
		return selTB;
	}
	public void setSelTB(String selTB) {
		this.selTB = selTB;
	}
	@Override
	public String toString(){
		return "[ selected table : " + selTB + " ]";
	}
}
