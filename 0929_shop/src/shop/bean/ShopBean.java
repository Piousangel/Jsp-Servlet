package shop.bean;

import mybatis.dao.ShopDAO;
import mybatis.vo.ProductVO;

public class ShopBean {

	
		//사용자가 선택한 category값을 저장할 변수를 하나 만듭니다
		private String category;  //이것은 <jsp:setProperty에 의해 자동저장됨.
		
		//카테고리 값으로 제품들을 선별한 후 배열로 저장할 곳입니다.
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
			p_list = ShopDAO.getList(category); //category를 <jsp:setProperty로 들어온 상태이기 때문에 여기서 바로 사용할 수 있습니다.
			
		}
		
		//사용자가 상세보기를 하기위해 제품번호를 이용하게 된다. 그래서
		//원하는 제품을 제품진열대( p_list)에서 검색한 후 ProductVO를 반환하여
		//product_content.jsp에서 표현하도록 한다.
		
		public ProductVO getProduct() {
			ProductVO pvo = null;
			
			//사용자가 선택한 제품은 이미 p_num변수에 들어가있는 상태입니다.
			//그래서 p_list에서 찾아서 반환하면 됩니다.
			
			/*for(int i= 0 ; i<= p_list.length; i++) {
				if(p_num == p_list[i].toString()) {
					
					pvo = p_list[i];
					return pvo;
				}
				 return null;
			}
			*/	
			
			for(ProductVO vo : p_list ) {
				if(vo.getP_num().equals(p_num)) {
					return pvo;
				}
			}
				return null;
		}
		
		
		
}
