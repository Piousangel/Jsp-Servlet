	package mybatis.dao;
	import java.util.Hashtable;
	import java.util.Map;

	import org.apache.ibatis.session.SqlSession;
	
	import mybatis.service.FactoryService;
import mybatis.vo.workVO;

	public class workDAO {

		/*public static boolean send(String title, String content, String reg_date) {
				
			Map<String, String> map = new Hashtable<String, String>();
			map.put("title", title);
			map.put("content", content);
			map.put("reg_date", reg_date);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.insert("work.send", map); //저장에 성공하면 1을 반환받고, 실패시 0을 반환받는다.
			boolean value = false;
			
			if(cnt > 0) {
				value = true;
				ss.commit();
			}else {
				ss.rollback(); //지금까지 작업된 내용 모두 삭제 및 DB적용 취소
			}
			ss.close();
			return value;
		}*/
		
		public static boolean add(workVO vo) {
			
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.insert("work.send", vo);
			boolean value = false;
			
			if(cnt > 0) {
				value = true;
				ss.commit();
			}else
				ss.rollback();
			
			ss.close();
			
			return value;
					
		}
		
		
		
	}

