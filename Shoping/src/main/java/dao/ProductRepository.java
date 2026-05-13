package dao;

import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
	
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	public void addProduct(Product product) {
        listOfProducts.add(product);
    }
	
	// public을 private으로 변경하여 외부에서 'new'로 새 저장소를 만드는 것을 차단합니다.
	private ProductRepository() {
    	// 첫 번째 상품 개 음식
    	Product dogFood = new Product("P1234","organic salmon",35000);
    	dogFood.setDescription("It's good for health");
    	dogFood.setCategory("food");
    	dogFood.setManufacturer("PetCare");
    	dogFood.setUnitsInStock(1000);
    	dogFood.setCondition("new");
    	dogFood.setPetType("Dog");
    	
    	// 두 번째 고양이 음식
    	Product catFood = new Product("P1235","chicken cat",28000);
    	catFood.setDescription("good tasty! lower cost!");
    	catFood.setCategory("food");
    	catFood.setManufacturer("HealthyMeow");
    	catFood.setUnitsInStock(1000);
    	catFood.setCondition("new");
    	catFood.setPetType("Cat");
    	

    	Product toy = new Product("P1236","doogy teeth toy",8000);
    	toy.setDescription("For your Pet");
    	toy.setCategory("toy");
    	toy.setManufacturer("JoyPet");
    	toy.setUnitsInStock(100);
    	toy.setCondition("new");
    	toy.setPetType("Dog");
    		
        // 리스트에 상품을 추가
    	listOfProducts.add(dogFood);
    	listOfProducts.add(catFood);
    	listOfProducts.add(toy);
	}

    // 모든 상품목록을 반환하는 메소드
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}

	public Product getProductById(String productId) {
	    Product productById = null;

	    for (int i = 0; i < listOfProducts.size(); i++) {
	        Product product = listOfProducts.get(i);
	        if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
	            productById = product;
	            break;
	        }
	    }
	    return productById;
	}
}