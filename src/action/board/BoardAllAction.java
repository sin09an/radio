package action.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Admin;
import model.AdminDao;
import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;
import model.Review;
import model.ReviewDao;

public class BoardAllAction {
	//board
	private BoardDao dao = new BoardDao();
	private ReviewDao re = new ReviewDao();
	private AdminDao ad = new AdminDao();
	private int boardtype;
	////////////////////////////////////
	public ActionForward write(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		String msg = "게시물 등록 실패";
    	String url = "writeForm.do?boardtype=1";   	
    	String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
    	try {
        File f = new File(path);
        if (!f.exists()) f.mkdirs();    
        MultipartRequest multi = new MultipartRequest(request, path,10*1024*1024,"euc-kr");
        Board b =new Board();     
        b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype")));  
        b.setId(multi.getParameter("id"));
        b.setTitle(multi.getParameter("title"));
        b.setContent(multi.getParameter("content"));
        b.setGenre(multi.getParameter("genre"));
        b.setPoto(multi.getFilesystemName("poto"));
        int num = dao.maxnum();
        b.setNum(++num);
        b.setGrp(num);   
        if(dao.insert(b)) {
        	msg ="게시물 등록 성공";
        	url="list.do?boardtype=1";
        }   
    } catch(IOException e) {  
    	throw new ServletException(e);
    }
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
    	return new ActionForward(false,"../alert.jsp");  
    }
	
	 public ActionForward list(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		 int limit = 10;
	        int pageNum = 1;
	        boardtype = 1;
	        String column = request.getParameter("column");
	        String find = request.getParameter("find");
	        try {
	        	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	        }catch(NumberFormatException e) {}
	        if(column != null && column.trim().equals(""))
	        	column=null;
	        if(find != null && find.trim().equals(""))
	        	find=null;
	        if(column ==null || find ==null) {
	        	column =null;
	        	find =null;        
	        }//검색 조건에 대한 코딩(if문들 ↑) 
	        int boardcnt = dao.boardCount(column, find, boardtype);//총 게시물 건수
	        List<Board> list = dao.list(pageNum, limit, column, find, boardtype);//게시물 목록
	        int maxpage =(int)((double)boardcnt/limit+0.95);
	        int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
	        int endpage = startpage +9;   
	        if(endpage > maxpage) endpage = maxpage;
	        int boardnum = boardcnt -(pageNum - 1)*limit;
	        request.setAttribute("boardcnt", boardcnt);
	        request.setAttribute("boardtype", boardtype); 
	        request.setAttribute("list", list);  
	        request.setAttribute("maxpage", maxpage);
	        request.setAttribute("startpage", startpage);
	        request.setAttribute("endpage", endpage);
	        request.setAttribute("boardnum", boardnum);//num ex)26-> 6이 계산
	        request.setAttribute("pageNum", pageNum);//밑단 페이지 수
	        return new ActionForward();
	  }  
	 
	 public ActionForward info(HttpServletRequest request,HttpServletResponse response) throws ServletException { 
		     boardtype=1;		  
		     int num = Integer.parseInt(request.getParameter("num"));
	         Board b = dao.selectOne(num, boardtype);   
	         if(request.getRequestURI().contains("info.do")) {
	         dao.cntadd(num);   
	         }    
	         request.setAttribute("b", b);   
			 return new ActionForward();
	    }  
	 
	 public ActionForward conwrite(HttpServletRequest request,HttpServletResponse response) throws ServletException {
			String msg = "게시물 등록 실패";
	    	String url = "conwriteForm.do?boardtype=3";  
	    	String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
	    	try {
	        File f = new File(path);
	        if (!f.exists()) f.mkdirs();   
	        MultipartRequest multi = new MultipartRequest(request, path,10*1024*1024,"euc-kr");
	        Board b =new Board();     
	        b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype"))); 
	        b.setId(multi.getParameter("id"));
	        b.setTitle(multi.getParameter("title"));
	        b.setContent(multi.getParameter("content"));
	        b.setGenre(multi.getParameter("genre"));
	        b.setPoto(multi.getFilesystemName("poto"));
	        int num = dao.maxnum();
	        b.setNum(++num);
	        b.setGrp(num);   
	        if(dao.insert(b)) {  
	        	msg ="게시물 등록 성공";
	        	url="conlist.do?boardtype=3"; 
	        }   
	    } catch(IOException e) {  
	    	throw new ServletException(e);
	    }
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
	    	return new ActionForward(false,"../alert.jsp");  
	    }
	 
	 public ActionForward conlist(HttpServletRequest request,HttpServletResponse response) throws ServletException {
	        int limit = 10;
	        int pageNum = 1; 
	        boardtype = 3;
	        String column = request.getParameter("column");
	        String find = request.getParameter("find");
	        try {
	        	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	        }catch(NumberFormatException e) {}
	        if(column != null && column.trim().equals(""))
	        	column=null;
	        if(find != null && find.trim().equals(""))
	        	find=null;
	        if(column ==null || find ==null) {
	        	column =null;
	        	find =null;      
	        } 
	        //검색 조건에 대한 코딩(if문들 ↑) 
	        int boardcnt = dao.boardCount(column, find, boardtype);//총 게시물 건수
	        List<Board> conlist = dao.list(pageNum, limit, column, find, boardtype);//게시물 목록
	        int maxpage =(int)((double)boardcnt/limit+0.95);
	        int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
	        int endpage = startpage +9;   
	        if(endpage > maxpage) endpage = maxpage;
	        int boardnum = boardcnt -(pageNum - 1)*limit;
	        request.setAttribute("boardcnt", boardcnt);//조회수
	        request.setAttribute("conlist", conlist);  
	        request.setAttribute("boardtype", boardtype); 
 	        request.setAttribute("maxpage", maxpage);
	        request.setAttribute("startpage", startpage);
	        request.setAttribute("endpage", endpage);
	        request.setAttribute("boardnum", boardnum);//num ex)26-> 6이 계산
	        request.setAttribute("pageNum", pageNum);//밑단 페이지 수
	        return new ActionForward();
	  }
	 
	 public ActionForward coninfo(HttpServletRequest request,HttpServletResponse response) throws ServletException { 
	     boardtype=3;
	     int num = Integer.parseInt(request.getParameter("num"));
         Board b = dao.selectOne(num, boardtype);   
         if(request.getRequestURI().contains("coninfo.do")) {
        	 dao.cntadd(num);   
         }    
         request.setAttribute("b", b);  
		 return new ActionForward();
    }
	 
	 public ActionForward plus(HttpServletRequest request,HttpServletResponse response) throws ServletException { 
		 boardtype=3;
	     int num = Integer.parseInt(request.getParameter("num"));
         dao.plusadd(num);
         String url="conlist.do";
         String msg ="추천 되었습니다."; 
         request.setAttribute("url", url);
         request.setAttribute("msg", msg);
         return new ActionForward(false,"../alert.jsp");
    }
	 
	    //그래프
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) {		
			List<Map<String,Integer>> list = dao.boardgraph();
			StringBuilder json = new StringBuilder("[");//json형태로 생성
			int i =0;
			for(Map<String,Integer> m :list) {
				for(Map.Entry<String,Integer> me: m.entrySet()) {
					if(me.getKey().equals("genre"))
						json.append("{\"genre\":\""+me.getValue()+"\",");
					if(me.getKey().equals("cnt"))
						json.append("\"cnt\":"+me.getValue()+"}");
				}//json 형태가 이미 만들어 져있는것임!!!!
				i++;
				if(i<list.size()) json.append(",");
			}
			json.append("]");
			request.setAttribute("json", json.toString().trim());
			return new ActionForward();	
		}

		//이야기댓글
	    public ActionForward review(HttpServletRequest request,HttpServletResponse response) throws ServletException {
	    	boardtype =1;
	    	Review r = new Review();  
	    	int boardnum = Integer.parseInt(request.getParameter("num"));
	    	r.setBoardtype(Integer.parseInt(request.getParameter("boardtype")));  
	    	r.setNum(boardnum);
	    	r.setId(request.getParameter("id")); 
	        r.setContent(request.getParameter("content")); 
	        int req = re.maxreq();
	        r.setReq(++req);
	    	String msg ="답변등록시 오류"; 
	    	String url="info.do?num="+r.getNum();
	    	if(re.insert(r)) {   
	    		msg="답변등록 완료";      
	    		url="reqlist.do?num="+boardnum;
	    	}
	    	request.setAttribute("msg", msg);
	    	request.setAttribute("url", url);      	
	        return new ActionForward(false,"../alert.jsp");
	    }
	      
	public ActionForward reqlist(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int limit = 10;
		int boardnum = Integer.parseInt(request.getParameter("num"));
		int pageNum = 1;
		boardtype = 1;
		int reqcnt = re.reqCount(boardnum);// 총 게시물 건수
		List<Review> list = re.list(boardnum, pageNum, limit, boardtype);// 게시물 목록
		int maxpage = (int) ((double) reqcnt / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int reqnum = reqcnt - (pageNum - 1) * limit;
		request.setAttribute("reqcnt", reqcnt);
		request.setAttribute("boardtype", boardtype);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("reqnum", reqnum);// num ex)26-> 6이 계산
		request.setAttribute("pageNum", pageNum);// 밑단 페이지 수
		return new ActionForward(false, "info.do?num=" + boardnum);
	}
	
	//콘테스트댓글
	public ActionForward conreview(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		boardtype = 3; 
		Review r = new Review();
		int boardnum = Integer.parseInt(request.getParameter("num"));
		r.setBoardtype(Integer.parseInt(request.getParameter("boardtype")));
		r.setNum(boardnum);
		r.setId(request.getParameter("id"));
		r.setContent(request.getParameter("content"));
		int req = re.maxreq();
		r.setReq(++req);
		String msg = "답변등록시 오류";
		String url = "coninfo.do?num=" + r.getNum();
		if (re.insert(r)) {
			msg = "답변등록 완료";
			url = "conreqlist.do?num="+boardnum;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward conreqlist(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		int limit = 10;
		int boardnum = Integer.parseInt(request.getParameter("num"));
		int pageNum = 1;
		boardtype = 3;
		int reqcnt = re.reqCount(boardnum);// 총 게시물 건수
		List<Review> list = re.list(boardnum, pageNum, limit, boardtype);// 게시물 목록
		int maxpage = (int) ((double) reqcnt / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int reqnum = reqcnt - (pageNum - 1) * limit;
		request.setAttribute("reqcnt", reqcnt);
		request.setAttribute("boardtype", boardtype);
		request.setAttribute("list", list);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("reqnum", reqnum);// num ex)26-> 6이 계산
		request.setAttribute("pageNum", pageNum);// 밑단 페이지 수
		return new ActionForward(false, "coninfo.do?num=" + boardnum);
	}
	
	//오늘의 게시판    
	 public ActionForward todaywrite(HttpServletRequest request,HttpServletResponse response) throws ServletException {
			String msg = "게시물 등록 실패";
	    	String url = "todaywriteForm.do?boardtype=2";  
	    	String path = request.getServletContext().getRealPath("/")+"model2/board/file/";
	    	try {
	        File f = new File(path);
	        if (!f.exists()) f.mkdirs();   
	        MultipartRequest multi = new MultipartRequest(request, path,10*1024*1024,"euc-kr");
	        Board b =new Board();     
	        b.setBoardtype(Integer.parseInt(multi.getParameter("boardtype"))); 
	        b.setId(multi.getParameter("id"));
	        b.setTitle(multi.getParameter("title"));
	        b.setContent(multi.getParameter("content"));
	        b.setGenre(multi.getParameter("genre"));
	        b.setPoto(multi.getFilesystemName("poto"));
	        int num = dao.maxnum();
	        b.setNum(++num);
	        b.setGrp(num);   
	        if(dao.insert(b)) {  
	        	msg ="게시물 등록 성공";
	        	url="todaylist2.do?boardtype=2"; 
	        }   
	    } catch(IOException e) {  
	    	throw new ServletException(e);
	    }
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
	    	return new ActionForward(false,"../alert.jsp");  
	    }
	 
	 public ActionForward todaylist(HttpServletRequest request,HttpServletResponse response) throws ServletException {
	        int limit = 10;
	        int pageNum = 1; 
	        boardtype = 2; 
	        String column = request.getParameter("column");
	        String find = request.getParameter("find");
	        try {
	        	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	        }catch(NumberFormatException e) {}
	        if(column != null && column.trim().equals(""))
	        	column=null;
	        if(find != null && find.trim().equals(""))
	        	find=null;
	        if(column ==null || find ==null) {
	        	column =null;
	        	find =null;      
	        }//검색 조건에 대한 코딩(if문들 ↑) 
	        int admincnt = ad.adminCount(column, find);//총 게시물 건수
	        List<Admin> tolist = ad.list( pageNum, limit, column, find);//게시물 목록
	        int maxpage =(int)((double)admincnt/limit+0.95);
	        int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
	        int endpage = startpage +9;   
	        if(endpage > maxpage) endpage = maxpage;
	        int boardnum = admincnt -(pageNum - 1)*limit;
	        request.setAttribute("boardcnt", admincnt);//조회수
	        request.setAttribute("tolist", tolist);  
	        request.setAttribute("boardtype", boardtype); 
	        request.setAttribute("maxpage", maxpage);
	        request.setAttribute("startpage", startpage);
	        request.setAttribute("endpage", endpage);
	        request.setAttribute("boardnum", boardnum);//num ex)26-> 6이 계산
	        request.setAttribute("pageNum", pageNum);//밑단 페이지 수
	        return new ActionForward();
	  }
	 
	 public ActionForward todaylist2(HttpServletRequest request,HttpServletResponse response) throws ServletException {
	        int limit = 10;
	        int pageNum = 1; 
	        boardtype = 2; 
	        
	        String column = request.getParameter("column");
	        String find = request.getParameter("find");
	        try {
	        	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	        }catch(NumberFormatException e) {}
	        if(column != null && column.trim().equals(""))
	        	column=null;
	        if(find != null && find.trim().equals(""))
	        	find=null;
	        if(column ==null || find ==null) {
	        	column =null;
	        	find =null;      
	        }//검색 조건에 대한 코딩(if문들 ↑) 
	        int boardcnt = dao.boardCount(column, find, boardtype);//총 게시물 건수
	        List<Board> tolist = dao.list(pageNum, limit, column, find, boardtype);//게시물 목록
	        int maxpage =(int)((double)boardcnt/limit+0.95);
	        int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
	        int endpage = startpage +9;   
	        if(endpage > maxpage) endpage = maxpage;
	        int boardnum = boardcnt -(pageNum - 1)*limit;
	        request.setAttribute("boardcnt", boardcnt);//조회수
	        request.setAttribute("tolist", tolist);  
	        request.setAttribute("boardtype", boardtype); 
	        request.setAttribute("maxpage", maxpage);
	        request.setAttribute("startpage", startpage);
	        request.setAttribute("endpage", endpage);
	        request.setAttribute("boardnum", boardnum);//num ex)26-> 6이 계산
	        request.setAttribute("pageNum", pageNum);//밑단 페이지 수
	        return new ActionForward();
	  } 
		
	 public ActionForward todayinfo(HttpServletRequest request,HttpServletResponse response) throws ServletException { 
	     boardtype=2;
	     int num = Integer.parseInt(request.getParameter("num"));
         Board b = dao.selectOne(num, boardtype);   
         if(request.getRequestURI().contains("todayinfo.do")) {
         }    
         request.setAttribute("b", b);  
		 return new ActionForward();
    }
	 
	 public ActionForward towrite(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		    String msg = "게시물 등록 실패";
	    	String url = "towriteForm.do";  
	        Board b =new Board();     
	        Admin a =new Admin();     
	        a.setCalender(request.getParameter("calender"));
	        a.setTodayti(request.getParameter("todayti"));
	        int num = ad.maxnum();
	        a.setNum(++num);  
			if(ad.insert(a)) {     
	        	msg ="게시물 등록 성공";
	        	url="../board/todaylist.do"; 
	        }      
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
	    	return new ActionForward(false,"../alert.jsp");  
	    }
	 
	 public ActionForward mylist(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		    int limit = 10;
	        int pageNum = 1; 
	        boardtype = 1;
	        id = (String)request.getSession().getAttribute("login"); 
	        String column = request.getParameter("column");
	        String find = request.getParameter("find");
	        try {
	        	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	        }catch(NumberFormatException e) {}
	        if(column != null && column.trim().equals(""))
	        	column=null;
	        if(find != null && find.trim().equals(""))
	        	find=null;
	        if(column ==null || find ==null) {
	        	column =null;
	        	find =null;        
	        }//검색 조건에 대한 코딩(if문들 ↑)  
	        int boardcntmy = dao.boardCountmy(column, find, boardtype, id);
	        List<Board> list = dao.list_my(pageNum, limit, column, find, boardtype, id);//게시물 목록
	        int maxpage =(int)((double)boardcntmy/limit+0.95);
	        int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
	        int endpage = startpage +9;   
	        if(endpage > maxpage) endpage = maxpage;
	        int boardnum = boardcntmy -(pageNum - 1)*limit;
	        request.setAttribute("boardcntmy", boardcntmy); 
	        request.setAttribute("boardtype", boardtype); 
	        request.setAttribute("id", id);  
	        request.setAttribute("list", list);  
	        request.setAttribute("maxpage", maxpage);
	        request.setAttribute("startpage", startpage);
	        request.setAttribute("endpage", endpage);
	        request.setAttribute("boardnum", boardnum);//num ex)26-> 6이 계산
	        request.setAttribute("pageNum", pageNum);//밑단 페이지 수
	        return new ActionForward(); 
	  }  
	 
	 public ActionForward mylist3(HttpServletRequest request,HttpServletResponse response) throws ServletException {
		    int limit = 10;
	        int pageNum = 1;
	        boardtype = 3; 
	        id = (String)request.getSession().getAttribute("login"); 
	        String column = request.getParameter("column");
	        String find = request.getParameter("find");
	        try {
	        	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	        }catch(NumberFormatException e) {}
	        if(column != null && column.trim().equals(""))
	        	column=null;
	        if(find != null && find.trim().equals(""))
	        	find=null;
	        if(column ==null || find ==null) {
	        	column =null;
	        	find =null;        
	        }//검색 조건에 대한 코딩(if문들 ↑)  
	        int boardcntmy = dao.boardCountmy(column, find, boardtype, id);
	        List<Board> list3 = dao.list_my(pageNum, limit, column, find, boardtype, id);//게시물 목록
	        int maxpage =(int)((double)boardcntmy/limit+0.95);
	        int startpage = ((int)(pageNum/10.0 + 0.9)-1)*10+1;
	        int endpage = startpage +9;   
	        if(endpage > maxpage) endpage = maxpage;
	        int boardnum = boardcntmy -(pageNum - 1)*limit;
	        request.setAttribute("boardcntmy", boardcntmy); 
	        request.setAttribute("boardtype", boardtype);  
	        request.setAttribute("id", id);  
	        request.setAttribute("list3", list3);  
	        request.setAttribute("maxpage", maxpage);
	        request.setAttribute("startpage", startpage);
	        request.setAttribute("endpage", endpage);
	        request.setAttribute("boardnum", boardnum);//num ex)26-> 6이 계산
	        request.setAttribute("pageNum", pageNum);//밑단 페이지 수
	        return new ActionForward(); 
	  }  
	 
	 public ActionForward mylistinfo(HttpServletRequest request,HttpServletResponse response) throws ServletException { 
	     boardtype=1;	 
	     id = (String)request.getSession().getAttribute("login"); 
         Board b = dao.selectOne_my(id, boardtype);   
         if(request.getRequestURI().contains("mylistinfo.do")) { 
         }        
         request.setAttribute("b", b);   
		 return new ActionForward();
    }
	 
	 public ActionForward mylistinfo3(HttpServletRequest request,HttpServletResponse response) throws ServletException { 
		 boardtype=3;	 
		 id = (String)request.getSession().getAttribute("login"); 
		 Board b = dao.selectOne_my(id, boardtype);   
		 if(request.getRequestURI().contains("mylistinfo3.do")) { 
		 }         
		 request.setAttribute("b", b);   
		 return new ActionForward();
	 }    
	 
	   
	
	//member
	protected String login; 
	protected String id;
	//////////////////////////////////////////////////////
	public ActionForward login(HttpServletRequest request, HttpServletResponse response) {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String msg = "로그인 후에 이용가능합니다.";
		String url = "loginForm.do";        
		Member mem = new MemberDao().selectOne(id);
		if (mem != null && !mem.equals("")) {  
			if (pass.equals(mem.getPass())) {
				request.getSession().setAttribute("login", id);
				msg = mem.getName() + "님이 로그인 하셨습니다.";
				url = "main.do";
			} else { 
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
//	
//	public ActionForward admin(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		if(login==null||login.trim().equals("")) {
//			request.setAttribute("msg","로그인이 필요합니다");
//			request.setAttribute("url","loginForm.do");
//		    return new ActionForward(false,"../alert.jsp");
//		}else if(!login.equals("admin")) {
//			request.setAttribute("msg", "관리자만 가능한 거래 입니다.");
//			request.setAttribute("url", "main.do");
//		}
//		return new ActionForward(false,"../alert.jsp");		
//	}

	public ActionForward join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파라미터 정보를 Member 객체에 저장		
		  Member mem = new Member(); 
		  mem.setId(request.getParameter("id"));
		  mem.setPass(request.getParameter("pass"));
		  mem.setName(request.getParameter("name"));
		  mem.setNicname(request.getParameter("nicname"));
		  mem.setTel(request.getParameter("tel"));
		  mem.setEmail(request.getParameter("email"));
		  mem.setPicture(request.getParameter("picture"));		 
		// db에 Member 객체 추가하기
		  MemberDao dao = new MemberDao();
		  String msg = "회원가입 실패";    
		  String url = "joinForm.do";
		  if (dao.insert(mem) > 0) {
			  msg = "회원가입 성공"; 
			  url = "loginForm.do";
		  }
		  request.setAttribute("msg", msg);
		  request.setAttribute("url", url);
		  return new ActionForward(false, "../alert.jsp"); 
	}
	
	public ActionForward id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");  
		MemberDao dao = new MemberDao(); 
		  String id = dao.idfind(name,tel,email);
		  System.out.println("id="+id);
		  String msg=null; 
		  String url=null;   
		  if(id!=null && !id.trim().equals("")){        
			  id=id.substring(0,id.length()-2);
			  request.setAttribute("id", id);
			  return new ActionForward();   
		  }else {  
			  msg="정보에 맞는 id를 찾을 수 없습니다.";
			  url="idForm.do"; 
			  request.setAttribute("msg", msg);
			  request.setAttribute("url", url);  
			  return new ActionForward(false,"../alert.jsp");
		  }
	}
	
	public ActionForward pw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id =request.getParameter("id"); 
		String tel =request.getParameter("tel");
		MemberDao dao = new MemberDao(); 
		String pass = dao.pwfind(id, tel); 
		if(pass!=null  && !pass.trim().equals("")) {      
		    String pw =pass.substring(0,pass.length()-2); 
		   // String pw =pass.substring(pass.length()-2);
			request.setAttribute("pw", pw);
			return new ActionForward();               
		}else {          
			String msg="정보에 맞는 비밀번호를 찾을 수 없습니다.";
			String url="pwForm.do";	 	
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);    
			return new ActionForward(false,"../alert.jsp");
		}           
	}  
	
	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) {
		//login => UserLoginAction => protected String login;
		login = (String) request.getSession().getAttribute("login");
		String msg=login +"님이 로그아웃하셨습니다.";    
		String url="loginForm.do";     
		request.getSession().invalidate();
		request.setAttribute("msg",msg);
		request.setAttribute("url",url); 
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward picture(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   String path = request.getServletContext().getRealPath("/")+
		                 "model2/member/picture";//위치 잡아주기
		   String fname = null;
		   try{
		   File f = new File(path); 
		   if(!f.exists()){  
			   f.mkdirs();  
		   }
			   MultipartRequest multi = new MultipartRequest
					        (request, path,10*1024*1024,"euc-kr");
			   fname = multi.getFilesystemName("picture");
		   }catch(IOException e){
			   e.printStackTrace();
		   } 	
		   request.setAttribute("fname", fname);
		return new ActionForward();
	}

	public ActionForward info1(HttpServletRequest request, HttpServletResponse response) {
		id = (String)request.getSession().getAttribute("login");
		Member info1 = new MemberDao().selectOne(id); 
		System.out.println(info1);
		request.setAttribute("info1", info1);
		return new ActionForward();      
	}  
	
	public ActionForward update1(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();  
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setNicname(request.getParameter("nicname")); 		
		mem.setEmail(request.getParameter("email"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		String msg=null;
		String url=null; 
		MemberDao dao = new MemberDao();
		Member m = dao.selectOne(request.getParameter("id"));
		if(!request.getParameter("pass").equals(m.getPass())) {
			 msg="비밀번호가 틀렸습니다.";
			 url="updateForm.do?id="+request.getParameter("id");	
		}else { 
		   int result = dao.update(mem); 
		   if(result>0) {
		   msg="수정성공";
		   url="info1.do?id="+request.getParameter("id");
		   }else {  
			   msg="수정실패";
			   url="main.do";   
		   }  
		}	 
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	} 	 
	
	public ActionForward password(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("login");
		boolean opener = false;
		boolean closer = false;
		String msg = "비밀번호 오류입니다. 확인하세요";
		String url = "passwordForm.do";
		/*
		 * if (login == null || login.trim().equals("")) { opener = true; closer = true;
		 * msg = "로그인 하세요"; url = "loginForm.do"; } else {
		 */
			String pass = request.getParameter("pass");
			String ch = request.getParameter("ch");
			MemberDao dao = new MemberDao();
			Member m = dao.selectOne(login);
			if (pass.equals(m.getPass())) {   
				closer = true;
				if (dao.updatePass(login, ch) > 0) {
					opener = true;
					msg = "비밀번호가 변경되었습니다.";
					url = "info1.do?id="+login;
				} else {
					msg = "비밀번호 변경시 오류가 발생했습니다.";
				}
			}
		/* } */      
		request.setAttribute("msg", msg);
		request.setAttribute("url", url); 
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		return new ActionForward();
	}
	
	public ActionForward delete1(HttpServletRequest request, HttpServletResponse response) {
		login = (String) request.getSession().getAttribute("login");
		id = request.getParameter("id");
		String msg = "null";
		String url = "null";
		if (id.equals("admin")) {
			msg = "관리자는 탈퇴가 불가능 합니다.";
			url = "list.do";
		} else {
			String pass = request.getParameter("pass");
			System.out.println(login + "," + pass + "," + id);
			MemberDao dao = new MemberDao();
			Member m = dao.selectOne(id);
			if (!login.equals("admin") && !pass.equals(m.getPass())) {
				msg = "비밀번호가 틀립니다.";
				url = "deleteForm.do?id=" + id;
			} else {
				int result = dao.delete(id);
				if (login.equals("admin") || pass.equals(m.getPass())) {
					if (result > 0) {
						request.getSession().invalidate();
						msg = "탈퇴되었습니다.";
						url = "loginForm.do";
					} else {
						msg = "탈퇴되었습니다.";
						url = "list.do";
					}
				} else {
					if (!login.equals("admin")) {
						msg = "삭제실패하였습니다.";
						url = "info1.do?id=" + id;
					} else {
						msg = "삭제되었습니다.";
						url = "list.do";
					}
				}
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
}
 