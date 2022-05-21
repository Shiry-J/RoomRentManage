package cn.RoomManagement.controller.room;

import cn.RoomManagement.controller.user.LoginController;
import cn.RoomManagement.pojo.CleanerCart;
import cn.RoomManagement.pojo.Cleanner;
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
import javax.swing.*;
import java.util.List;

@Controller
public class CleanerController {

    //log4j
    private static final Logger logger = Logger.getLogger(LoginController.class);

    //service层
    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/mycleanercart.html")
    public String MyCleanerCart(HttpSession session){
        logger.debug("enter CleanerController============>showMyCleanerCart method");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        List<CleanerCart> none_cleanerCart = roomService.getNoneCleanerCartByUserid(user.getId());
        List<CleanerCart> ing_cleanerCart = roomService.getIngCleanerCartByUserid(user.getId());
        List<CleanerCart> end_cleanerCart = roomService.getEndCleanerCartByUserid(user.getId());
        session.setAttribute(Constants.NONE_CLEANER_CART_SESSION,none_cleanerCart);
        session.setAttribute(Constants.ING_CLEANER_CART_SESSION,ing_cleanerCart);
        session.setAttribute(Constants.END_CLEANER_CART_SESSION,end_cleanerCart);
        return "MyCleanerCart";
    }

    @RequestMapping(value = "/addcleanercart.html")
    public String AddCleanerCart(HttpServletRequest request, HttpSession session){
        logger.debug("enter CleanerController============>showAddCleanerCart method");
        Integer cartid = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Room room = roomService.getRoomById(cartid);
        CleanerCart check = roomService.checkCleanerCart(room.getId(),user.getId());
        if (check != null) {
            int flag = check.getStatus();
            if(flag!=0){
                JOptionPane.showMessageDialog(null,"您已发布该房间的清洁委托或委托正在进行，请勿重复发布");
                return "RoomCartManage";
            }
        }
        session.setAttribute(Constants.ADD_CLEANER_CART_SESSION,room);
        return "AddCleanerCart";
    }

    @RequestMapping(value = "/do_addcleanercart.html")
    public String do_AddCleanerCart(@RequestParam("price") String price, HttpSession session){
        logger.debug("enter CleanerController============>showDoAddCleanerCart method");
        CleanerCart cleanerCart = new CleanerCart();
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Room room = (Room) session.getAttribute(Constants.ADD_CLEANER_CART_SESSION);
        cleanerCart.setCleanCart(user.getId(),room.getId(),room.getRoomaddress(),"无",Double.valueOf(price),2);
        int count = roomService.addCleanerCart(cleanerCart);
        if(count>0){
            List<CleanerCart> none_cleanerCart = roomService.getNoneCleanerCartByUserid(user.getId());
            List<CleanerCart> ing_cleanerCart = roomService.getIngCleanerCartByUserid(user.getId());
            List<CleanerCart> end_cleanerCart = roomService.getEndCleanerCartByUserid(user.getId());
            session.setAttribute(Constants.NONE_CLEANER_CART_SESSION,none_cleanerCart);
            session.setAttribute(Constants.ING_CLEANER_CART_SESSION,ing_cleanerCart);
            session.setAttribute(Constants.END_CLEANER_CART_SESSION,end_cleanerCart);
            return "MyCleanerCart";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/deletecleancart.html")
    public String deletecleancart(HttpServletRequest request,
                                  HttpSession session){
        Integer id = Integer.valueOf(request.getParameter("id"));
        int count = roomService.DeleteCleancartById(id);
        if (count>0){
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            List<CleanerCart> none_cleanerCart = roomService.getNoneCleanerCartByUserid(user.getId());
            List<CleanerCart> ing_cleanerCart = roomService.getIngCleanerCartByUserid(user.getId());
            List<CleanerCart> end_cleanerCart = roomService.getEndCleanerCartByUserid(user.getId());
            session.setAttribute(Constants.NONE_CLEANER_CART_SESSION,none_cleanerCart);
            session.setAttribute(Constants.ING_CLEANER_CART_SESSION,ing_cleanerCart);
            session.setAttribute(Constants.END_CLEANER_CART_SESSION,end_cleanerCart);
            return "MyCleanerCart";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/returnRoomCartManage.html")
    public String returnRoomCartManage(){
        return "RoomCartManage";
    }

    @RequestMapping(value = "/accepttask.html")
    public String accepttask(HttpServletRequest request,
                             HttpSession session){
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        int count = roomService.ModifyCleanerCart(id,user.getUsername());
        if(count>0){
            List<CleanerCart> cleaner_none = roomService.getNoneCleanerCart();
            List<CleanerCart> cleaner_ing = roomService.getIngCleanerCart(user.getUsername());
            List<CleanerCart> cleaner_end = roomService.getEndCleanerCart(user.getUsername());
            session.setAttribute(Constants.NONE_CLEANER_SESSION,cleaner_none);
            session.setAttribute(Constants.ING_CLEANER_SESSION,cleaner_ing);
            session.setAttribute(Constants.END_CLEANER_SESSION,cleaner_end);
            return "Cleaner";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/endtask.html")
    public String endtask(HttpServletRequest request,
                             HttpSession session){
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        int count = roomService.EndCleanerCart(id);
        if(count>0){
            List<CleanerCart> cleaner_none = roomService.getNoneCleanerCart();
            List<CleanerCart> cleaner_ing = roomService.getIngCleanerCart(user.getUsername());
            List<CleanerCart> cleaner_end = roomService.getEndCleanerCart(user.getUsername());
            session.setAttribute(Constants.NONE_CLEANER_SESSION,cleaner_none);
            session.setAttribute(Constants.ING_CLEANER_SESSION,cleaner_ing);
            session.setAttribute(Constants.END_CLEANER_SESSION,cleaner_end);
            return "Cleaner";
        }
        return "ERROR";
    }

}
