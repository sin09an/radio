package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ReviewMapper;

public class ReviewDao {
	private Map<String,Object> map = new HashMap<String,Object>();
	private Class<ReviewMapper> cls = ReviewMapper.class;
	public boolean insert(Review r) {
	    SqlSession session = DBConnection.getConnection();
			try {
				int cnt =session.getMapper(cls).insert(r);
				if(cnt>0) 
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBConnection.close(session);
			}
			return false;
		}
	
	public int maxreq() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).maxreq();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	
	public List<Review> list(int boardnum, int pageNum, int limit, int boardtype) {
		SqlSession session = DBConnection.getConnection();
		try {
			 map.clear();
			 map.put("start", (pageNum -1)*limit); 
			 map.put("limit",limit);
			 map.put("boardnum", boardnum);
			 map.put("boardtype", boardtype); 
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;   
	}

	public int reqCount(int boardnum) {
        SqlSession session = DBConnection.getConnection();
		try {
			   map.clear();		
			   map.put("boardnum", boardnum);
			return session.getMapper(cls).reqCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0; 
	}
	 
	
}

