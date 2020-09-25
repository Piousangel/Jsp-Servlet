	package mybatis.dao;
	import java.util.Hashtable;
	import java.util.Map;

	import org.apache.ibatis.session.SqlSession;
	
	import mybatis.service.FactoryService;
import mybatis.vo.workVO;

	public class workDAO {

		public static boolean add(String m_id, String m_pw, String m_name, String m_addr, String m_phone, String m_email) {
				
			Map<String, String> map = new Hashtable<String, String>();
			map.put("id", m_id);
			map.put("pw", m_pw);
			map.put("name", m_name);
			map.put("addr", m_addr);
			map.put("phone", m_phone);
			map.put("email", m_email);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.insert("work.add", map); //저장에 성공하면 1을 반환받고, 실패시 0을 반환받는다.
			boolean value = false;
			
			if(cnt > 0) {
				value = true;
				ss.commit();
			}else {
				ss.rollback(); //지금까지 작업된 내용 모두 삭제 및 DB적용 취소
			}
			ss.close();
			return value;
		}
		
		
		//로그인 기능 - login.jsp에서 호출
		public static workVO login(String u_id, String u_pw) {
			//로그인 이라는 매퍼를 사용할려면 map을 만들어서 그곳에 보내고자하는 파라미터 값을 넣어줍니다.
			
			Map<String, String> map = new Hashtable<String, String>();
			
			map.put("u_id", u_id); //#붙은애 보고 확인
			map.put("u_pw", u_pw);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			workVO vo = ss.selectOne("work.login", map);
			ss.close();
			
			return vo;
		}
		
	}

