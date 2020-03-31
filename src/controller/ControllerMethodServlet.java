package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.board.BoardAllAction;

@WebServlet(urlPatterns = {"*.do"}, //.do라는 요청이 들어오면 나를 호출
     initParams = {@WebInitParam(name="properties", value="method.properties")})   

public class ControllerMethodServlet extends HttpServlet {//ControllerMethodServlet 실행이 되며 실행이 될때 클래스 상태에서 객체화를 시킴
	private static final long serialVersionUID = 1L;
	private Properties pr= new Properties(); 
	private BoardAllAction action = new BoardAllAction();
	private Class[] paramType = new Class[]
			{HttpServletRequest.class, HttpServletResponse.class};
    //init : 서블릿이 객체화 된 이후 바로 호출되는 메서드(객체화 될때 딱 한번만 호출)static이 없어 객체화를 해줘야함. 
	//config 객체: 파라미터 전달
	//            properties = method.properties
	@Override
     public void init(ServletConfig config) throws ServletException{
    	 //props : method.properties 값을 가지고 있음.
		 String props = config.getInitParameter("properties");
    	 FileInputStream f =null;
    	 try {
    	  //f: WEB-INF/method.properties 파일을 읽기위한 입력 스트림	 
    		 f= new FileInputStream //파일을 읽어와 
    				 (config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
    		 //key=/model2/hello.do
    		 //value = hello
    		 pr.load(f); 
    		 f.close();
    	 }catch(IOException e) {
    		 e.printStackTrace();
    	 }
     }
    //클라이언트 GET 방식 요청시 호출되는 메서드 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("euc-kr");
	    Object[] paramObjs=new Object[] {request,response};
	    ActionForward forward =null;
	    String commend =null;
	    try {
	    	System.out.println(request.getRequestURI());//jspstudy2/*.do
	    	System.out.println(request.getContextPath());//jspstudy2   
	    	//commend 프로젝트를 제외한 요청 url : model2/hello.do
	    	commend = request.getRequestURI().substring
	    			(request.getContextPath().length());
	    	//methodName : hello
	    	String methodName = pr.getProperty(commend);
	    	//method : 메서드 객체 생성
	    	//BoardAllAction 클래스 중 메서드 이름이 methodName 이고 매개변수가 paramType인 메서드를 객체로 리턴 
	    	Method method = BoardAllAction.class.getMethod
	    			(methodName.trim(), paramType);  
	    	//invoke : 메서드 호출 기능
	    	//         action.hello(request,response) 호출
	    	forward =(ActionForward)method.invoke(action, paramObjs);
	    }catch(NullPointerException e) {
	    	forward = new ActionForward();
	    	e.printStackTrace();
	    }catch(Exception e) {
	    	throw new ServletException(e);
	    }
	    if(forward != null) {  
	    	if(forward.isRedirect()) {
	    		response.sendRedirect(forward.getView());
	    	}else {
	    		if(forward.getView()==null) {
	    			forward.setView(commend.replace(".do",".jsp"));
	    		}
	    		RequestDispatcher disp =
	    				request.getRequestDispatcher(forward.getView());
	    		disp.forward(request, response);
	    	}
	    }else response.sendRedirect("nopage.jsp");
	}
	//클라이언트 POST 방식 요청시 호출되는 메서드 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}
}
 