package controller;

import java.io.FileInputStream;  
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

@WebServlet(urlPatterns = { "*.me" }, initParams = { @WebInitParam(name = "properties", value = "action.properties") })

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();

	public ControllerServlet() {
		super(); 
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("properties");
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			pr.load(f);  
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			try {
				if (f != null)
					f.close();
			} catch (IOException e) {
			}
		}
		for (Object k : pr.keySet()) {
			String command = (String) k;
			String className = pr.getProperty(command);
			try { 
				Class commandClass = Class.forName(className.trim());
				//commandObj : action.HelloAction or action.AddAction
				Object commandObj = commandClass.newInstance();//객체화
				commandMap.put(command, (Action) commandObj);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}    

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		action.Action action = null;
		ActionForward forward = null;
		String commend = null;
		try {
			//commend : /model2/hello.me(key로 쓰일 내용)
			commend = request.getRequestURI().substring(request.getContextPath().length());
			//action : Action 인터페이스의 구현 객체
			//         action.HelloAction 객체
			action = commandMap.get(commend);
			//System.out.println("commend:"+commend+",class:"+action.getClass().getName());
			//execute 이게 있어야 객체화 가능 
			forward = action.execute(request, response);
			//System.out.println(forward);
		} catch (NullPointerException e) {
			e.printStackTrace();
			forward = new ActionForward(); 			 
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			} else {
				//거짓일때 
				if (forward.getView() == null) {
					forward.setView(commend.replace(".me", ".jsp"));
				}
				//forward.getView() : action클래스에서 전달 view 이름
				//                    addForm.jsp
				//forward 대상을 설정
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request, response);
			}
		} else
			response.sendRedirect("nopage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
