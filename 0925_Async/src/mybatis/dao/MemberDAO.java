package mybatis.dao;

import java.util.Hashtable;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemVO;

public class MemberDAO {

	// 회원가입 기능
	public static boolean add(String m_id, String m_pw, String m_name,
			String m_addr, String m_phone, String m_email) {
		Map<String, String> map = new Hashtable<String, String>();
		map.put("id", m_id);
		map.put("pw", m_pw);
		map.put("name", m_name);
		map.put("addr", m_addr);
		map.put("phone", m_phone);
		map.put("email", m_email);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("mem.add", map);
		boolean value = false;
		
		if(cnt > 0) {
			value = true;
			ss.commit();
		}else
			ss.rollback();
		
		ss.close();
		
		return value;
				
	}
	
	//로그인 기능 - login.jsp에서 호출 
	public static MemVO login(String u_id, String u_pw) {
		// login이라는 맵퍼를 사용하기 위해서는 Map을 만들어서 그곳에
		// 보내고자 하는 파라미터 값(u_id,u_pw)를 저장해야 한다.
		Map<String, String> m = new Hashtable<String, String>();
		m.put("u_id", u_id);
		m.put("u_pw", u_pw);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		MemVO vo = ss.selectOne("mem.login", m);//id와 pw가 정확할때만 vo를 받는다.
		
		ss.close();
		return vo;
	}
	
	//아이디를 검색
	public static MemVO searchId(String m_id) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MemVO vo = ss.selectOne("mem.search_id", m_id);
		ss.close();
		
		return vo;// vo가 null이면 id가 없는 id이고, null이 아니면 
				// member_t라는 테이블에 이미 존재하는 id다.
	}
	
}







