package cn.RoomManagement.interceptor;

import cn.RoomManagement.pojo.User;
import cn.RoomManagement.tools.Constants;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 悟空非空也(B站 / 知乎 / CSDN / 公众号)
 */
public class SysInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = Logger.getLogger(cn.RoomManagement.interceptor.SysInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		logger.debug("SysInterceptor preHandle ==========================");
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute(Constants.USER_SESSION);
		
		if(null == user){
			response.sendRedirect(request.getContextPath()+"/401.jsp");
			return false;
		}
		return true;
	}
}
