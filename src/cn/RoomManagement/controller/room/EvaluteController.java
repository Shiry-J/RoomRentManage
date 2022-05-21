package cn.RoomManagement.controller.room;

import cn.RoomManagement.controller.user.LoginController;
import cn.RoomManagement.pojo.Cart;
import cn.RoomManagement.pojo.Evalute;
import cn.RoomManagement.pojo.Room;
import cn.RoomManagement.pojo.User;
import cn.RoomManagement.service.room.RoomService;
import cn.RoomManagement.tools.Constants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.*;

@Controller
public class EvaluteController {

    //log4j
    private static final Logger logger = Logger.getLogger(LoginController.class);

    //service层
    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/evaluteroom.html")
    public String evaluteroom(HttpServletRequest request,
                              HttpSession session){
        logger.debug("enter EvaluteController============>showEvaluteRoom method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Cart cart = roomService.getCartById(id);
        if(cart == null){
            JOptionPane.showMessageDialog(null,"该订单还不能被留言评价");
            return "mycart";
        }else{
            Evalute evalute = roomService.getEvaluteByCartid(id);
            if (evalute != null){
                JOptionPane.showMessageDialog(null,"该订单已被留言评价");
                return "mycart";
            }
            Room room = roomService.getRoomById(cart.getRoomid());
            session.setAttribute(Constants.ROOMCARTSESSION,room);
            session.setAttribute(Constants.CARTSESSION,cart);
        }
        return "EvaluteRoom";
    }

    @RequestMapping(value = "/do_evalute.html")
    public String do_evaluteroom(@RequestParam(value = "message") String message,
                              HttpSession session){
        logger.debug("enter EvaluteController============>showDo_EvaluteRoom method");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Room room = (Room) session.getAttribute(Constants.ROOMCARTSESSION);
        Cart cart = (Cart) session.getAttribute(Constants.CARTSESSION);
        Evalute evalute = new Evalute();
        evalute.setEvalute(cart.getId(),user.getId(),room.getId(),room.getRoommaster(),message);
        int count = roomService.AddEvaluteRoom(evalute);
        if (count>0){
            return "mycart";
        }
        return "ERROR";
    }

}
