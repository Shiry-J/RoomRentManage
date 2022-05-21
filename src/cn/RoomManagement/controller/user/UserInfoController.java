package cn.RoomManagement.controller.user;

import cn.RoomManagement.pojo.*;
import cn.RoomManagement.service.room.RoomService;
import cn.RoomManagement.service.user.UserService;
import cn.RoomManagement.tools.Constants;
import com.sun.deploy.net.HttpResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class UserInfoController {

    //log4j
    private static final Logger logger = Logger.getLogger(LoginController.class);

    //service层
    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/userinfo.html")
    public String userinfo() {
        logger.debug("enter UserInfoController============>showUserInfoPage method");
        return "userinfo";
    }

    @RequestMapping(value = "/modifypassword.html")
    public String modifypassword() {
        logger.debug("enter UserInfoController============>showModifyPassword method");
        return "modifypassword";
    }

    @RequestMapping(value = "/doModfyPassword.html")
    public String doModfyPassword(@RequestParam(value = "password") String password,
                                  @RequestParam(value = "password1") String password1,
                                  @RequestParam(value = "password2") String password2,
                          HttpSession session,
                          HttpServletRequest request) {
        logger.debug("enter UserInfoController=============>doModfyPassword method");
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        if(password.equals(user.getPassword())&&password!=null&&password!=""&&password1!=null&&password1!=""
                &&password2!=null&&password2!=""){
            if (password1.equals(password2)){
                if (!password.equals(password1)){
                    int count = this.userService.modifypassword(user.getUsername(),password1);
                    if(count>0){
                        return "login";
                    }else{
                        request.setAttribute("doModifyPassword_error","修改失败");
                        return "modifypassword";
                    }
                }
                else{
                    request.setAttribute("doModifyPassword_error","新密码不能与旧密码相同");
                    return "modifypassword";
                }
            }else{
                request.setAttribute("doModifyPassword_error","两次输入密码不一致");
                return "modifypassword";
            }
        } else{
            request.setAttribute("doModifyPassword_error","旧密码错误");
            return "modifypassword";
        }
    }

    @RequestMapping(value = "returnframe.html")
    public String returnframe(){
        return "frame";
    }

    @RequestMapping(value = "returnuserinfo.html")
    public String returnuserinfo(){
        return "userinfo";
    }

    @RequestMapping(value = "/roommaster.html")
    public String roommaster(HttpSession session){
        logger.debug("enter UserInfoController============>showRoomMaster method");
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        RoomMaster roomMaster = userService.ifroommaster(user.getUsername());
        if (roomMaster!=null)
        {
            List<Room> on_roomList = roomService.getRoomList_on(user.getUsername());
            List<Room> off_roomList = roomService.getRoomList_off(user.getUsername());
            session.setAttribute(Constants.ROOM_On_SESSION,on_roomList);
            session.setAttribute(Constants.ROOM_Off_SESSION,off_roomList);
            return "RoomMaster";
        }
        else{
            JOptionPane.showMessageDialog(null,"该用户必须先注册为房东。");
            return "frame";
        }
    }

    @RequestMapping(value = "/cleaner.html")
    public String cleanerr(HttpSession session,
                           Model model) {
        logger.debug("enter UserInfoController============>showCleaner method");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Cleanner cleanner = userService.ifcleanner(user.getUsername());
        if (cleanner!=null)
        {
            List<CleanerCart> cleaner_none = roomService.getNoneCleanerCart();
            List<CleanerCart> cleaner_ing = roomService.getIngCleanerCart(user.getUsername());
            List<CleanerCart> cleaner_end = roomService.getEndCleanerCart(user.getUsername());
            session.setAttribute(Constants.NONE_CLEANER_SESSION,cleaner_none);
            session.setAttribute(Constants.ING_CLEANER_SESSION,cleaner_ing);
            session.setAttribute(Constants.END_CLEANER_SESSION,cleaner_end);
            return "Cleaner";
        }
        else{
            JOptionPane.showMessageDialog(null,"该用户必须先注册为清洁人员。");
            return "frame";
        }
    }

}
