package cn.RoomManagement.controller.user;

import cn.RoomManagement.pojo.Room;
import cn.RoomManagement.pojo.User;
import cn.RoomManagement.service.room.RoomService;
import cn.RoomManagement.service.user.UserService;
import cn.RoomManagement.tools.Constants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import java.util.List;

@Controller
public class LoginController {

    //log4j
    private static final Logger logger = Logger.getLogger(LoginController.class);

    //service层
    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;

    //显示登录页面，此页面也是首页
    @RequestMapping(value = "/index.html")
    public String index() {
        logger.debug("enter LoginController============>showLoginPage method");
        return "login";
    }

    //提交登录表单
    @RequestMapping(value = "dologin.html")
    public String doLogin(@RequestParam(value = "username") String username,
                          @RequestParam(value = "password") String password,
                          HttpSession session,
                          HttpServletRequest request) {
        logger.debug("enter LoginController=============>doLogin method");
        //和数据库中用户信息进行校验
        User loginuser = this.userService.login(username,password);
        if(loginuser !=null){//说明用户存在
            List<Room> roomList = roomService.getRoomList();
            session.setAttribute(Constants.ROOM_SESSION,roomList);
            //使用session容器，把该用户放进去
            session.setAttribute(Constants.USER_SESSION,loginuser);
            //页面跳转
            return "frame";
        }else{//说明用户不存在
            //使用request容器返回提示信息
            request.setAttribute("error","账号或密码错误");
            //页面的跳转
            return "login";
        }
    }

    //登出,返回登录页
    @RequestMapping(value = "exit.html")
    public String exit(){
        return "login";
    }

}
