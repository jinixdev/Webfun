package gallery;

import java.sql.Timestamp;

public class galleryBean {
	private int num;
	private String id,pass,file,content;
	
	private String tastetype,foodtype,eattype;
	private int smile;
	private Timestamp date;
	private String storename,storeaddr,store_num,b_num; 
	private String placename,placeaddr,star;
	
	
	
	
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
	public String getPlaceaddr() {
		return placeaddr;
	}
	public void setPlaceaddr(String placeaddr) {
		this.placeaddr = placeaddr;
	}

	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
	

	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getStoreaddr() {
		return storeaddr;
	}
	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}
	public String getStore_num() {
		return store_num;
	}
	public void setStore_num(String store_num) {
		this.store_num = store_num;
	}
	public String getB_num() {
		return b_num;
	}
	public void setB_num(String b_num) {
		this.b_num = b_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTastetype() {
		return tastetype;
	}
	public void setTastetype(String tastetype) {
		this.tastetype = tastetype;
	}
	public String getFoodtype() {
		return foodtype;
	}
	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	public String getEattype() {
		return eattype;
	}
	public void setEattype(String eattype) {
		this.eattype = eattype;
	}
	public int getSmile() {
		return smile;
	}
	public void setSmile(int smile) {
		this.smile = smile;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
}
