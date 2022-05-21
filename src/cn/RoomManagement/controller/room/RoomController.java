package cn.RoomManagement.controller.room;

import cn.RoomManagement.controller.user.LoginController;
import cn.RoomManagement.pojo.*;
import cn.RoomManagement.service.room.RoomService;
import cn.RoomManagement.tools.Constants;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class RoomController {

    //log4j
    private static final Logger logger = Logger.getLogger(LoginController.class);

    //service层
    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/roominfo.html")
    public String roominfo(HttpSession session,
                           HttpServletRequest request){
        logger.debug("enter RoomController============>showRoomInfo method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Room room = this.roomService.roominfo(id);
        if(room != null){
            List<Evalute> evaluteList = roomService.getEvaluteByRoomid(id);
            session.setAttribute(Constants.EVALUTE_SESSION,evaluteList);
            session.setAttribute(Constants.ROOMINFO_SESSION,room);
            return "roominfo";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/frame.html")
    public String roomList(Model model){
        logger.debug("enter RoomController============>showRoomList method");
        List<Room> roomList = roomService.getRoomList();
        model.addAttribute(Constants.ROOM_SESSION,roomList);
        return "frame";
    }

    @RequestMapping(value = "/addroom.html")
    public String addroom(){
        logger.debug("enter RoomController============>showAddRoom method");
        return "AddRoom";
    }

    @RequestMapping(value = "/do_addroom.html")
    public String do_addroom(@RequestParam("roomname") String roomname,
                          @RequestParam("roomimage") MultipartFile roomimage,
                          @RequestParam("roomdescription") String roomdescription,
                          @RequestParam("roomaddress") String roomaddress,
                          @RequestParam("roomprice") String roomprice,
                          HttpSession session,
                          HttpServletRequest request) throws IOException {
        logger.debug("enter RoomController============>showAddRoom method");
        LocalDate pubDate = LocalDate.now();
        Double newroomprice = Double.valueOf(roomprice);
        Room room = new Room();
        room.setRoomname(roomname);
        room.setRoomimage(roomService.saveimage(roomimage));
        room.setRoomdescription(roomdescription);
        room.setRoomaddress(roomaddress);
        room.setRoomprice(newroomprice);
        room.setIson(1);
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        room.setRoommaster(user.getUsername());
        room.setRoomdate(java.sql.Date.valueOf(pubDate));
        int checkroom = roomService.addroom(room);
        if(checkroom>0){
            List<Room> roomList = roomService.getRoomList();
            session.setAttribute(Constants.ROOM_SESSION,roomList);
            List<Room> on_roomList = roomService.getRoomList_on(user.getUsername());
            List<Room> off_roomList = roomService.getRoomList_off(user.getUsername());
            session.setAttribute(Constants.ROOM_On_SESSION,on_roomList);
            session.setAttribute(Constants.ROOM_Off_SESSION,off_roomList);
            return "RoomMaster";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/deleteroom.html")
    public String deleteroom(HttpServletRequest request,
                             HttpSession session){
        logger.debug("enter RoomController============>showDeleteRoom method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int count = roomService.deleteRoomByid(id);
        if(count>0)
        {
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            List<Room> roomList = roomService.getRoomList();
            session.setAttribute(Constants.ROOM_SESSION,roomList);
            List<Room> on_roomList = roomService.getRoomList_on(user.getUsername());
            List<Room> off_roomList = roomService.getRoomList_off(user.getUsername());
            session.setAttribute(Constants.ROOM_On_SESSION,on_roomList);
            session.setAttribute(Constants.ROOM_Off_SESSION,off_roomList);
            return "RoomMaster";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/offroom.html")
    public String offroom(HttpServletRequest request,
                          HttpSession session){
        logger.debug("enter RoomController============>showOffRoom method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int count = roomService.offRoomByid(id);
        if(count>0)
        {
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            List<Room> roomList = roomService.getRoomList();
            session.setAttribute(Constants.ROOM_SESSION,roomList);
            List<Room> on_roomList = roomService.getRoomList_on(user.getUsername());
            List<Room> off_roomList = roomService.getRoomList_off(user.getUsername());
            session.setAttribute(Constants.ROOM_On_SESSION,on_roomList);
            session.setAttribute(Constants.ROOM_Off_SESSION,off_roomList);
            return "RoomMaster";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/onroom.html")
    public String onroom(HttpServletRequest request,
                          HttpSession session){
        logger.debug("enter RoomController============>showOnRoom method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int count = roomService.onRoomByid(id);
        if(count>0)
        {
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            List<Room> roomList = roomService.getRoomList();
            session.setAttribute(Constants.ROOM_SESSION,roomList);
            List<Room> on_roomList = roomService.getRoomList_on(user.getUsername());
            List<Room> off_roomList = roomService.getRoomList_off(user.getUsername());
            session.setAttribute(Constants.ROOM_On_SESSION,on_roomList);
            session.setAttribute(Constants.ROOM_Off_SESSION,off_roomList);
            return "RoomMaster";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/modifyroom.html")
    public String modifyroom(HttpServletRequest request,
                             HttpSession session){
        logger.debug("enter RoomController============>showModifyRoom method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Room room = roomService.roominfo(id);
        session.setAttribute(Constants.ROOMINFO_SESSION,room);
        return "ModifyRoom";
    }

    @RequestMapping(value = "/do_modifyroom.html")
    public String do_modifyroom(@RequestParam("roomname") String roomname,
                                @RequestParam("roomimage") MultipartFile roomimage,
                                @RequestParam("roomdescription") String roomdescription,
                                @RequestParam("roomaddress") String roomaddress,
                                @RequestParam("roomprice") String roomprice,
                                HttpSession session,
                                HttpServletRequest request) throws IOException {
        logger.debug("enter RoomController============>showmodifyroom method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Room room = roomService.getRoomById(id);
        Room new_room = new Room();
        new_room.setRoomimage(roomService.saveimage(roomimage));
        Double newroomprice = Double.valueOf(roomprice);
        new_room.setId(room.getId());
        new_room.setRoomname(roomname);
        new_room.setRoomdescription(roomdescription);
        new_room.setRoomaddress(roomaddress);
        new_room.setRoomprice(newroomprice);
        new_room.setIson(room.getIson());
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        new_room.setRoommaster(user.getUsername());
        new_room.setRoomdate(room.getRoomdate());
        int updataroom = roomService.modifyroom(new_room);
        if(updataroom>0){
            List<Room> roomList = roomService.getRoomList();
            session.setAttribute(Constants.ROOM_SESSION,roomList);
            List<Room> on_roomList = roomService.getRoomList_on(user.getUsername());
            List<Room> off_roomList = roomService.getRoomList_off(user.getUsername());
            session.setAttribute(Constants.ROOM_On_SESSION,on_roomList);
            session.setAttribute(Constants.ROOM_Off_SESSION,off_roomList);
            return "RoomMaster";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/mycart.html")
    public String mycart(HttpSession session){
        logger.debug("enter RoomController============>showmycart method");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        List<Cart> on_cart = roomService.getCartList_on(user.getId());
        List<Cart> off_cart = roomService.getCartList_off(user.getId());
        session.setAttribute(Constants.CART_On_SESSION,on_cart);
        session.setAttribute(Constants.CART_Off_SESSION,off_cart);
        return "mycart";
    }

    @RequestMapping(value = "/do_roominfo.html")
    public String do_roominfo(HttpSession session){
        logger.debug("enter RoomController============>showDo_RoomInfo method");
        Room room = (Room) session.getAttribute(Constants.ROOMINFO_SESSION);
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Cart cart = new Cart();
        cart.setcart(user.getId(),room.getId(),1,room.getRoomprice(),room.getRoommaster());
        int addcart = roomService.addcart(cart);
        if (addcart>0){
            List<Cart> on_cart = roomService.getCartList_on(user.getId());
            List<Cart> off_cart = roomService.getCartList_off(user.getId());
            session.setAttribute(Constants.CART_On_SESSION,on_cart);
            session.setAttribute(Constants.CART_Off_SESSION,off_cart);
            return "mycart";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/finishcart.html")
    public String finishcart(HttpSession session,HttpServletRequest request){
        logger.debug("enter RoomController============>showFinishCart method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int finishcart = roomService.finishCartById(id);
        if(finishcart>0){
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            List<Cart> on_cart = roomService.getCartList_on(user.getId());
            List<Cart> off_cart = roomService.getCartList_off(user.getId());
            session.setAttribute(Constants.CART_On_SESSION,on_cart);
            session.setAttribute(Constants.CART_Off_SESSION,off_cart);
            return "mycart";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/deletecart.html")
    public String deletecart(HttpSession session,HttpServletRequest request){
        logger.debug("enter RoomController============>showDeleteCart method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int deletecart = roomService.deleteCartById(id);
        if(deletecart>0){
            User user = (User) session.getAttribute(Constants.USER_SESSION);
            List<Cart> on_cart = roomService.getCartList_on(user.getId());
            List<Cart> off_cart = roomService.getCartList_off(user.getId());
            session.setAttribute(Constants.CART_On_SESSION,on_cart);
            session.setAttribute(Constants.CART_Off_SESSION,off_cart);
            return "mycart";
        }
        return "ERROR";
    }

    @RequestMapping(value = "/RoomCartManage.html")
    public String RoomCartManage(HttpSession session){
        logger.debug("enter RoomController============>showRoomCartManage method");
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        List<Cart> ing_cartlist = roomService.getCartList_onByRoommaster(user.getUsername());
        List<Cart> end_cartlist = roomService.getCartList_offByRoommaster(user.getUsername());
        session.setAttribute(Constants.CART_Ing_SESSION,ing_cartlist);
        session.setAttribute(Constants.CART_End_SESSION,end_cartlist);
        return "RoomCartManage";
    }

    @RequestMapping(value = "/do_search.html")
    public String Roomsearch(@RequestParam("search") String search,HttpSession session){
        logger.debug("enter RoomController============>showRoomsearch method");
        if (search==null||search==""){
            return "frame";
        }
        List<Room> roomList = roomService.getRoomListByLike(search);
        session.setAttribute(Constants.Like_ROOMINFO_SESSION,roomList);
        return "Search";
    }


}
