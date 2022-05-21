package cn.RoomManagement.service.room;

import cn.RoomManagement.dao.room.RoomMapper;
import cn.RoomManagement.pojo.*;
import cn.RoomManagement.service.user.UserService;
import cn.RoomManagement.tools.Constants;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class RoomServiceImp implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    public List<Room> getRoomList(){
        return roomMapper.getroomList();
    }

    public Room roominfo(Integer id){
        Room room = roomMapper.getRoomByRoomName(id);
        if(room != null)
        {
            return room;
        }
        return null;
    }

    public List<Room> getRoomList_on(String roommaster){
        return roomMapper.getRoomList_on(roommaster);
    }

    public List<Room> getRoomList_off(String roommaster){
        return roomMapper.getRoomList_off(roommaster);
    }

    public int addroom(Room room){
        return roomMapper.AddRoom(room);
    }

    //修改房间
    public int modifyroom(Room room){
        return roomMapper.ModifyRoom(room);
    }

    //通过id删除房间
    public int deleteRoomByid(Integer id){
        return roomMapper.do_deleteRoomByid(id);
    }

    //通过id下架房间
    public int offRoomByid(Integer id){
        return roomMapper.do_offRoomByid(id);
    }

    //通过id上架房间
    public int onRoomByid(Integer id){
        return roomMapper.do_onRoomByid(id);
    }

    //保存房间图片
    public String saveimage(MultipartFile roomimage) throws IOException {
        String filePath="D:/IdeaProjects/RoomManagement/web/statics/img/";
        String localPath="/statics/img/";
        String originalFilename = roomimage.getOriginalFilename();
        String newFileName = UUID.randomUUID()+originalFilename;
        File targetFile = new File(filePath,newFileName);
        roomimage.transferTo(targetFile);
        return localPath+newFileName;
    }

    //添加房间订单
    public int addcart(Cart cart){
        return roomMapper.do_addcart(cart);
    }

    //查询进行中的订单
    public List<Cart> getCartList_on(Integer userid){
        return roomMapper.do_getCartList_on(userid);
    }

    //查询结束的订单
    public List<Cart> getCartList_off(Integer userid){
        return roomMapper.do_getCartList_off(userid);
    }

    //通过订单id删除订单
    public int deleteCartById(Integer id){
        return roomMapper.do_deleteCartById(id);
    }

    //通过订单id完成订单
    public int finishCartById(Integer id){
        return roomMapper.do_finishCartById(id);
    }

    public List<Cart> getCartList_onByRoommaster(String roommaster){
        return roomMapper.do_getCartList_onByRoommaster(roommaster);
    }

    public List<Cart> getCartList_offByRoommaster(String roommaster){
        return roomMapper.do_getCartList_offByRoommaster(roommaster);
    }

    //通过订单号获取订单
    public Cart getCartById(Integer id){
        return roomMapper.do_getCartById(id);
    }

    //通过房间号获取订单
    public Room getRoomById(Integer id){
        return roomMapper.do_getRoomById(id);
    }

    //添加留言
    public int AddEvaluteRoom(Evalute evalute){
        return roomMapper.do_AddEvaluteRoom(evalute);
    }

    //通过订单id号查找留言评价
    public Evalute getEvaluteByCartid(Integer cartid){
        return roomMapper.do_getEvaluteByCartid(cartid);
    }

    //获取房间的留言评价
    public List<Evalute> getEvaluteByRoomid(Integer roomid){
        return roomMapper.do_getEvaluteByRoomid(roomid);
    }

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> getNoneCleanerCartByUserid(Integer userid){
        return roomMapper.do_getNoneCleanerCartByUserid(userid);
    }

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> getIngCleanerCartByUserid(Integer userid){
        return roomMapper.do_getIngCleanerCartByUserid(userid);
    }

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> getEndCleanerCartByUserid(Integer userid){
        return roomMapper.do_getEndCleanerCartByUserid(userid);
    }

    //添加清洁订单
    public int addCleanerCart(CleanerCart cleanerCart){
        return roomMapper.do_addCleanerCart(cleanerCart);
    }

    //查看特定用户在同一房间下是否重复下单
    public CleanerCart checkCleanerCart(Integer roomid,Integer userid){
        return roomMapper.do_checkCleanerCart(roomid,userid);
    }

    //根据清洁订单id删除订单
    public int DeleteCleancartById(Integer id){
        return roomMapper.do_DeleteCleancartById(id);
    }

    //获取未被接取的订单
    public List<CleanerCart> getNoneCleanerCart(){
        return roomMapper.do_getNoneCleanerCart();
    }

    //获取正在进行的订单
    public List<CleanerCart> getIngCleanerCart(String cleaner){
        return roomMapper.do_getIngCleanerCart(cleaner);
    }

    //获取已结束的订单
    public List<CleanerCart> getEndCleanerCart(String cleaner){
        return roomMapper.do_getEndCleanerCart(cleaner);
    }

    //接取订单
    public int ModifyCleanerCart(Integer id,String cleaner){
        return roomMapper.do_ModifyCleanerCart(id,cleaner);
    }

    //完成订单
    public int EndCleanerCart(Integer id){
        return roomMapper.do_EndCleanerCart(id);
    }

    public List<Room> getRoomListByLike(String search){
        return roomMapper.do_getRoomListByLike(search);
    }


}
