package cn.RoomManagement.controller.user;

import cn.RoomManagement.pojo.Cleanner;
import cn.RoomManagement.pojo.RoomMaster;
import cn.RoomManagement.pojo.User;
import cn.RoomManagement.service.user.UserService;
import cn.RoomManagement.tools.Constants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.PrintWriter;

@Controller
public class RegisterController {

    //log4j
    private static final Logger logger = Logger.getLogger(LoginController.class);

    //service层
    @Autowired
    private UserService userService;

    //显示注册页面
    @RequestMapping(value = "/register.html")
    public String register() {
        logger.debug("enter LoginController============>register method");
        return "register";
    }

    //提交注册表单
    @RequestMapping(value = "/doregister.html")
    public String doRegister(@RequestParam(value = "username") String username,
                          @RequestParam(value = "password1") String password1,
                          @RequestParam(value = "password2") String password2,
                          @RequestParam(value = "phone") String phone,
                          @RequestParam(value = "email") String email,
                          HttpSession session,
                          HttpServletRequest request) {
        logger.debug("enter RegisterController=============>doregister method");
        //和数据库中用户信息进行校验
        User user = new User();
        user.setUsername(username);
        user.setPassword(password1);
        user.setPhone(phone);
        user.setEmail(email);
        User registeruser = this.userService.register(user);
        if(registeruser == null){//说明用户存在
            //使用request容器返回提示信息
            request.setAttribute("register_error","账号已经存在");
            //页面跳转
            return "register";
        }else{//说明用户不存在
            //页面的跳转
            return "login";
        }
    }

    //显示房东注册页面
    @RequestMapping(value = "/Register_roommaster.html")
    public String Register_roommaster(HttpSession session) {
        logger.debug("enter UserInfoController============>showRegister_roommaster method");
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        RoomMaster checkuser =this.userService.ifroommaster(user.getUsername());
        if (checkuser==null){//用户不存在
            return "Register_roommaster";
        }
        JOptionPane.showMessageDialog(new JFrame(),"该用户已是房东");
        return "userinfo";
    }

    //显示清洁人员注册页面
    @RequestMapping(value = "/Register_cleanner.html")
    public String Register_cleanner(HttpSession session) {
        logger.debug("enter UserInfoController============>showRegister_cleanner method");
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        Cleanner checkuser =this.userService.ifcleanner(user.getUsername());
        if (checkuser==null){//用户不存在
            return "Register_cleanner";
        }
        JOptionPane.showMessageDialog(new JFrame(),"该用户已是清洁人员");
        return "userinfo";
    }

    //提交房东注册表单
    @RequestMapping(value = "doRegister_roommaster.html")
    public String doRegister_roommaster(@RequestParam(value = "idcard") String idcard,
                          @RequestParam(value = "address") String address,
                          HttpSession session,
                          HttpServletRequest request) {
        logger.debug("enter RegisterController=============>doRegister_roommaster method");
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        RoomMaster roommaster = new RoomMaster();
        roommaster.setUsername(user.getUsername());
        roommaster.setPhone(user.getPhone());
        roommaster.setEmail(user.getEmail());
        roommaster.setIdcard(idcard);
        roommaster.setAddresse(address);
        RoomMaster registerroommaster = this.userService.registerroommaster(roommaster);
        if(registerroommaster == null){//说明用户已是房东
            //使用request容器返回提示信息
            request.setAttribute("register_roommaster_error","该账号已是房东");
            //页面跳转
            return "Register_roommaster";
        }else{//说明用户不存在
            //页面的跳转
            return "frame";
        }
    }

    //提交清洁人员注册表单
    @RequestMapping(value = "doRegister_cleanner.html")
    public String doRegister_cleanner(@RequestParam(value = "idcard") String idcard,
                                        @RequestParam(value = "address") String address,
                                        HttpSession session,
                                        HttpServletRequest request) {
        logger.debug("enter RegisterController=============>doRegister_cleanner method");
        User user = (User)session.getAttribute(Constants.USER_SESSION);
        Cleanner cleanner = new Cleanner();
        cleanner.setUsername(user.getUsername());
        cleanner.setPhone(user.getPhone());
        cleanner.setEmail(user.getEmail());
        cleanner.setIdcard(idcard);
        cleanner.setAddresse(address);
        Cleanner registercleanner = this.userService.registercleanner(cleanner);
        if(registercleanner == null){//说明用户已是清洁人员
            //使用request容器返回提示信息
            request.setAttribute("register_cleanner_error","该账号已是清洁人员");
            //页面跳转
            return "Register_cleanner";
        }else{//说明用户不存在
            //页面的跳转
            return "frame";
        }
    }

}
