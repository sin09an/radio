package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.AdminMapper;

public class AdminDao {
	private Map<String,Object> map = new HashMap<String,Object>();
	private Class<AdminMapper> cls = AdminMapper.class;
	
	public boolean insert(Admin admin) {
	       SqlSession session = DBConnection.getConnection();
			try {
				int cnt =session.getMapper(cls).insert(admin);
				if(cnt>0) 
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(session);
			} 
			return false;
	}
	
	
	public List<Admin> list(int pageNum, int limit, String column, String find) {
		SqlSession session = DBConnection.getConnection();
		try {
			 map.clear();
			 map.put("start", (pageNum -1)*limit); 
			 map.put("limit",limit);   
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;   
	} 
	
	public int adminCount(String column, String find) {
        SqlSession session = DBConnection.getConnection();
		try {
			   map.clear();		
			    if(column != null) {    
					String[] col = column.split(",");  
				    map.put("col1",col[0]); 
					if(col.length ==2) {
						map.put("col2",col[1]); 
					}
					map.put("find", find);
				}  
			return session.getMapper(cls).adminCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0; 
	}  
	
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}  
		return 0;
	}


}
