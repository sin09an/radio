package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private Map<String,Object> map = new HashMap<String,Object>();
	private Class<MemberMapper> cls = MemberMapper.class;//���������� ������ ����
	public Member selectOne(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
				map.clear();
				map.put("id",id);
				List<Member> list = session.getMapper(cls).select(map);//ȯ�漳�����ϳ־��ְ� �޼��� �־��ְ�
				return list.get(0);//���
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	//ȸ�����
	public int insert(Member m) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).insert(m);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;// insert ����
	}

	public List<Member> list() { 
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).select(null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public int update(Member m) {
		SqlSession session = DBConnection.getConnection();
		try {     
			return session.getMapper(cls).update(m);
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally {
			DBConnection.close(session);
		}  
		return 0; 
	}
	public int delete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		}catch (Exception e) { 
			e.printStackTrace();
		} finally { 
			DBConnection.close(session);
		}
		return 0;
	}
	public int updatePass(String id, String pass) { 
		SqlSession session = DBConnection.getConnection();//DBConnection.open
		try {
			return session.getMapper(cls).updatePass(id,pass); 
		}catch(Exception e) { 
			e.printStackTrace();
		} finally { 
			DBConnection.close(session); 
		}
		return 0;
	}
   public String idfind(String name, String tel, String email){
		SqlSession session = DBConnection.getConnection();
		try {  
		   return session.getMapper(cls).idfind(name,tel,email);  
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			DBConnection.close(session);   
		}
	return null;   
   }
   public String pwfind(String id, String tel) {
		SqlSession session = DBConnection.getConnection();
		try {  			
		   return session.getMapper(cls).pwfind(id,tel);     			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session); 
		}
	return null; 
   } 	
}
