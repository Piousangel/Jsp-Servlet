package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.ProductVO;

public class ShopDAO {

	
	//카테고리별 목록을 반환하는 기능

/*	public static List<ProductVO> getlist(String category){
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("shop.list",category);    
		ss.close();
		
		return list; 
	}
*/
	
	public static ProductVO[] getList(String category) {
		SqlSession ss = FactoryService.getFactory().openSession();
		ProductVO[] ar = null; //반환값
		
		List<ProductVO> list = ss.selectList("shop.list", category);
		ss.close();
		
		//받은 list를 배열로 변경해야 합니다.
		if(list!=null && list.size()>0) {
			ar = new ProductVO[list.size()];
			
/*			for(int i=0; i<list.size(); i++) {
				ar[i] = list.get(i);
			}*/
			
			//배열이 list와 같은 크기이므로 list에 있는 모든 요소들을 배열에 한번에 복사해 넣는다. list.toArray 기억하자!
			list.toArray(ar);
		}
		
		return ar;
		
	}
}
