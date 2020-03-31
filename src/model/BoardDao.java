package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;
import model.mapper.MemberMapper;

public class BoardDao {
	private Map<String,Object> map = new HashMap<String,Object>();
	private Class<BoardMapper> cls = BoardMapper.class;
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
    //�Խù� ���
	public boolean insert(Board board) {
       SqlSession session = DBConnection.getConnection();
		try {
			int cnt =session.getMapper(cls).insert(board);
			if(cnt>0) 
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	public int boardCount(String column, String find, int boardtype) {
        SqlSession session = DBConnection.getConnection();
		try {
			   map.clear();		
			    if(column != null) {    
					String[] col = column.split(",");  
				    map.put("col1",col[0]); 
					if(column.equals("���")) {
						map.put("col2",col[1]); 
					}
					if(column.equals("����")) {
						map.put("col3",col[2]); 
					}
					if(column.equals("ȭ��")) {
						map.put("col4",col[3]); 
					}
					if(column.equals("����")) {
						map.put("col5",col[4]); 
					} 
					if(column.equals("����")) {
						map.put("col6",col[5]); 
					}
					if(column.equals("�θ�")) {
						map.put("col7",col[6]); 
					}
					map.put("find", find);
				}  
			    map.put("boardtype", boardtype);
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0; 
	}  

	public List<Board> list
	    (int pageNum, int limit, String column, String find, int boardtype) {
         SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum -1)*limit);
			map.put("limit",limit);
			 if(column != null) {    
					String[] col = column.split(",");  
				    map.put("col1",col[0]); 
					if(col.length ==2) {
		  				map.put("col2",col[1]); 
					}
					map.put("find", find);
				}   
			 map.put("boardtype", boardtype);
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;   
	}  
 
	public Board selectOne(int num, int boardtype) {
       SqlSession session = DBConnection.getConnection();		
		try {
			map.clear();
			map.put("num", num);
			map.put("boardtype", boardtype);
				return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	//��ȸ�� ����
	public void cntadd(int num) {
        SqlSession session = DBConnection.getConnection();
		try {
		  session.getMapper(cls).readcntadd(num); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}
	
	//��õ�� ����
	public void plusadd(int num) {
        SqlSession session = DBConnection.getConnection();
		try {
		  session.getMapper(cls).plusaddcnt(num); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}
	
    //����� ���� ����
	public void grpStepAdd(int grp, int grpstep) {
        SqlSession session = DBConnection.getConnection();		
		try {
			session.getMapper(cls).grpStepAdd(grp, grpstep);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}
	
	//�Խñ� ����
	public boolean update(Board board) {
      SqlSession session = DBConnection.getConnection();
		try {
		   int cnt = session.getMapper(cls).update(board);
		   if(cnt > 0) return true;
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			DBConnection.close(session);
		}
		return false; 
	} 
	
	//�Խñ� ����
	 public boolean delete(int num) {
		 SqlSession session = null; 
	     try { 
	    	 int cnt = session.getMapper(cls).delete(num);
	    	 if(cnt > 0 ) return true;
	     }catch(Exception e) {
	    	 e.printStackTrace();
	     }finally {
	    	 DBConnection.close(session);
			}
		 return false;
	 } 
	 
	 //�׷��� ���
	 public List<Map<String,Integer>> boardgraph(){
		 SqlSession session = DBConnection.getConnection();
		 List<Map<String,Integer>> map=null;
		 try {
			 map = session.getMapper(cls).graph();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 DBConnection.close(session);
		 }
		 return map; 
	 }
	 
	 //mylist 
		public List<Board> list_my 
	    (int pageNum, int limit, String column, String find, int boardtype, String id) {
         SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum -1)*limit);
			map.put("limit",limit);
			map.put("id", id);
			map.put("boardtype", boardtype);
			return session.getMapper(cls).select_my(map);
		} catch (Exception e) {  
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;   
	}
		
		public int boardCountmy(String column, String find, int boardtype, String id) {
			 SqlSession session = DBConnection.getConnection();
				try {
					   map.clear();		
					    if(column != null) {    
							String[] col = column.split(",");  
						    map.put("col1",col[0]); 
							if(column.equals("���")) {
								map.put("col2",col[1]); 
							}
							if(column.equals("����")) {
								map.put("col3",col[2]); 
							}
							if(column.equals("ȭ��")) {
								map.put("col4",col[3]); 
							}
							if(column.equals("����")) {
								map.put("col5",col[4]); 
							} 
							if(column.equals("����")) {
								map.put("col6",col[5]); 
							}
							if(column.equals("�θ�")) {
								map.put("col7",col[6]); 
							}
							map.put("find", find);
						}  
					    map.put("boardtype", boardtype);
					    map.put("id", id);
					return session.getMapper(cls).boardCountmy(map);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBConnection.close(session);
				}
			return 0;
		} 
		
		//myinfo 
		public Board selectOne_my(String id, int boardtype) {
			 SqlSession session = DBConnection.getConnection();		
				try { 
					map.clear();
					map.put("id", id);
					map.put("boardtype", boardtype);
						return session.getMapper(cls).info_my(map).get(0);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBConnection.close(session);
				}
			return null;
		} 
	 
}
