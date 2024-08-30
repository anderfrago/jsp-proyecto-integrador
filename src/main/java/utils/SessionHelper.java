package utils;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionHelper extends HttpServlet {
	
	private static HttpSession session;
	
	public static void startSession(HttpSession s) {
		session = s;
		session.setMaxInactiveInterval(60*15);
	}
	
	public static void destroySession(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    session.setAttribute("user", null);
	    response.sendRedirect("index.jsp");
	    return; 	
	}
	
	public static void setSession(String user) {
		session.setAttribute("user", user);
	}
	public static String getSession() {
		String user = session.getAttribute("user") != null ? session.getAttribute("user").toString() : "" ;
		return user;
	}
	
	public static boolean isLoggedIn() {
		if(session == null ) return false;
		String user = session.getAttribute("user") != null ? session.getAttribute("user").toString() : "" ;
		return user != "";
	}

}
