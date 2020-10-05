package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {

	//사용자가 선택한 category값을 저장할 변수
	private String category; // 이것은 <jsp:setProperty에 의해 자동 저장됨
	
	//카테고리 값으로 제품들을 선별한 후 배열로 저장할 곳!
	private ProductVO[] p_list;
	
	//제품 상세보기 기능에서 사용할 제품번호
	private String p_num;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public ProductVO[] getP_list() {
		return p_list;
	}

	public void setP_list(ProductVO[] p_list) {
		this.p_list = p_list;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	
	//제품목록(제품 진열대)를 ShopDAO를 통해 생성한다.
	public void searchProduct() {
		p_list = ShopDAO.getList(category); //category를 이미 <jsp:serProperty로 들어온 상태기 때문에
											//여기서 바로 사용할 수 있다.
	}
	
	//사용자가 상세보기를 하기위해 제품번호를 이용하게 된다. 그래서
	//원하는 제품을 제품진열대( p_list )에서 검색한 후 ProductVO를 반환하여
	// product_content.jsp에서 표현하도록 한다.
	public ProductVO getProduct() {
		ProductVO pvo = null; //반환값!
		
		// 사용자가 선택한 제품은 이미 p_num이라는 변수에 들어가 있다.
		//그래서 p_list에서 찾아서 반환하면 된다.
		for(ProductVO vo : p_list) {
			if(vo.getP_num().equals(p_num)) { //같은 제품을 찾은 경우
				pvo = vo;
				break;//가장 가까운 반복문 탈출
			}//if문의 끝!
		}//for의 끝
		
		return pvo;
	}
	
	public ProductVO getProduct2() {
		for(ProductVO vo : p_list) {
			if(vo.getP_num().equals(p_num)) { //같은 제품을 찾은 경우
				return vo;
			}//if문의 끝!
		}//for의 끝
		return null;
	}
}