package cn.RoomManagement.service.room;

import cn.RoomManagement.pojo.Cart;
import cn.RoomManagement.pojo.CleanerCart;
import cn.RoomManagement.pojo.Evalute;
import cn.RoomManagement.pojo.Room;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface RoomService {
    //获取房间列表
    public List<Room> getRoomList();

    //根据房间名字获取
    public Room roominfo(Integer id);

    //根据房东用户名获取已上架的房间
    public List<Room> getRoomList_on(String roommaster);

    //根据房东用户名获取已下架的房间
    public List<Room> getRoomList_off(String roommaster);

    //添加房间
    public int addroom(Room room);

    //修改房间
    public int modifyroom(Room room);

    //通过id删除房间
    public int deleteRoomByid(Integer id);

    //通过id下架房间
    public int offRoomByid(Integer id);

    //通过id上架房间
    public int onRoomByid(Integer id);

    //保存房间图片
    public String saveimage(MultipartFile file) throws IOException;

    //添加房间订单
    public int addcart(Cart cart);

    //查询进行中的订单
    public List<Cart> getCartList_on(Integer userid);

    //查询结束的订单
    public List<Cart> getCartList_off(Integer userid);

    //通过订单id删除订单
    public int deleteCartById(Integer id);

    //通过订单id完成订单
    public int finishCartById(Integer id);

    public List<Cart> getCartList_onByRoommaster(String roommaster);

    public List<Cart> getCartList_offByRoommaster(String roommaster);

    //通过订单号获取订单
    public Cart getCartById(Integer id);

    //通过房间号获取订单
    public Room getRoomById(Integer id);

    //添加留言
    public int AddEvaluteRoom(Evalute evalute);

    //通过订单id号查找留言评价
    public Evalute getEvaluteByCartid(Integer cartid);

    //获取房间的留言评价
    public List<Evalute> getEvaluteByRoomid(Integer roomid);

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> getNoneCleanerCartByUserid(Integer userid);

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> getIngCleanerCartByUserid(Integer userid);

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> getEndCleanerCartByUserid(Integer userid);

    //添加清洁订单
    public int addCleanerCart(CleanerCart cleanerCart);

    //查看特定用户在同一房间下是否重复下单
    public CleanerCart checkCleanerCart(Integer roomid,Integer userid);

    //根据清洁订单id删除订单
    public int DeleteCleancartById(Integer id);

    //获取未被接取的订单
    public List<CleanerCart> getNoneCleanerCart();

    //获取正在进行的订单
    public List<CleanerCart> getIngCleanerCart(String cleaner);

    //获取已结束的订单
    public List<CleanerCart> getEndCleanerCart(String cleaner);

    //接取订单
    public int ModifyCleanerCart(Integer id,String cleaner);

    //完成订单
    public int EndCleanerCart(Integer id);

    public List<Room> getRoomListByLike(String search);

}
