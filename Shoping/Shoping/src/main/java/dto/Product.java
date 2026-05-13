package dto;

import java.io.Serializable;
// 객체를 전달할 때 식별자 역할을 한다.

public class Product implements Serializable {
	
	private String filename; // 이미지 파일명을 저장할 변수 (이것을 사용)
    private static final long serialVersionUID = -4274700572038677000L;
    
    private String productId; // 상품 아이디
    private String pname; // 상품명
    private Integer unitPrice; //상품 가격(인수)
    private String description; // 설명
    private String manufacturer; //제조사
    private String category; // 분류
    private long unitsInStock; // 재고 수
    private String condition; // 신상품 or 재고품
    private String petType;//애완동물
    private int quantity; // 장바구니에 담은 개수
	

	public Product() {
		super();
	
	}
	public Product(String productId,String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}
	
	
	// id
	public String getProductId() { return productId; }
    public void setProductId(String productId) { this.productId = productId; }
	// 이름
	public String getPname() { 
		return pname;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	//가격
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	//세부사항
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	// 제조사
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	// 분류
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	// 재고
	public long getUnitsInStock() { return unitsInStock; }
    public void setUnitsInStock(long unitsInStock) { this.unitsInStock = unitsInStock; }
	
	//상태
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	// 동물 종류
	public String getPetType() { 
		return petType; 
	}
    public void setPetType(String petType) {
    	this.petType = petType;
    }
    
    public String getFilename() {return filename;}
    public void setFilename(String filename) {this.filename = filename;}
    
    
    // 장바구니
    
    public int getQuantity() {return quantity;}
    public void setQuantity(int quantity) {this.quantity=quantity;}
    
}
	
