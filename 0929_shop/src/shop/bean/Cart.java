package shop.bean;

import java.util.ArrayList;
import java.util.List;

import mybatis.vo.ProductVO;

public class Cart {
/*
   카트의 기능분석
   1) 제품(ProductVO)을 담을(저장) 수 있는 공간 : List<ProdouctVO>
   2) 1)에 제품을 저장하는 기능
   3) 1)에 제품을 삭제하는 기능
   4) 1)에 있는 모든 제품들을 배열로 반환하는 기능
   5) 1)에서 특정제품을 검색하는 기능 : 삭제하기 전에 검색한 후 삭제해야 한다.
   6) 5)에서 검색된 제품의 수량을 변경하는 기능
   7) 총액 계산 
   
   위 분석에 따른 필요한 멤버변수들(속성)
   		-List<ProductVO>
   		-int totalPrice (shopbean에 존재하므로 없어도 될 것 같습니다. ProductVO들 안에 totoalPrice를 활용합니다.)
   
   카트의 기능(멤버 메서드)
   		-searchProduct : 제품 검색기능
   		-addProduct : 제품 추가기능
   		-delProduct : 제품 삭제기능
   		-changeCount: 수량 변경기능
   		-getList    : 배열로 반환하는 기능
*/
	private List<ProductVO> list;     //저장공간
	
	public Cart() {
		list = new ArrayList<ProductVO>();
	}
	
	//카트에서 특정 제품을 검색하여 반환하는 기능
	public ProductVO searchProduct(String pnum){
		for(ProductVO vo : list) {
			if(vo.getP_num().equals(pnum)) {
				return vo;
			}
		}
		return null;
	}
	
	
}
