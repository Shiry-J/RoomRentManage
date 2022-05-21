package cn.RoomManagement.dao.room;

import cn.RoomManagement.pojo.Cart;
import cn.RoomManagement.pojo.CleanerCart;
import cn.RoomManagement.pojo.Evalute;
import cn.RoomManagement.pojo.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {

    //列表形式获得房间信息
    public List<Room> getroomList();

    //根据房间id获取
    public Room getRoomByRoomName(@Param("id") Integer id);

    //根据房东用户名获取已上架的房间
    public List<Room> getRoomList_on(@Param("roommaster") String roommaster);

    //根据房东用户名获取已下架的房间
    public List<Room> getRoomList_off(@Param("roommaster") String roommaster);

    //添加房间
    public int AddRoom(Room room);

    public int ModifyRoom(Room room);

    public int do_deleteRoomByid(@Param("id") Integer id);

    public int do_offRoomByid(@Param("id") Integer id);

    public int do_onRoomByid(@Param("id") Integer id);

    //添加房间订单
    public int do_addcart(Cart cart);

    public List<Cart> do_getCartList_off(@Param("userid") Integer userid);

    public List<Cart> do_getCartList_on(@Param("userid") Integer userid);

    //通过订单id删除订单
    public int do_deleteCartById(@Param("id") Integer id);

    //通过订单id完成订单
    public int do_finishCartById(@Param("id") Integer id);

    public List<Cart> do_getCartList_onByRoommaster(@Param("roommaster") String roommaster);

    public List<Cart> do_getCartList_offByRoommaster(@Param("roommaster") String roommaster);

    //通过订单号获取订单
    public Cart do_getCartById(@Param("id") Integer id);

    //通过房间号获取订单
    public Room do_getRoomById(@Param("id") Integer id);

    //添加留言
    public int do_AddEvaluteRoom(Evalute evalute);

    //通过订单id号查找留言评价
    public Evalute do_getEvaluteByCartid(@Param("cartid") Integer cartid);

    //获取房间的留言评价
    public List<Evalute> do_getEvaluteByRoomid(Integer roomid);

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> do_getNoneCleanerCartByUserid(@Param("userid") Integer userid);

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> do_getIngCleanerCartByUserid(@Param("userid") Integer userid);

    //通过用户id获取未被接取清洁订单
    public List<CleanerCart> do_getEndCleanerCartByUserid(@Param("userid") Integer userid);

    //添加清洁订单
    public int do_addCleanerCart(CleanerCart cleanerCart);

    //查看特定用户在同一房间下是否重复下单
    public CleanerCart do_checkCleanerCart(@Param("roomid") Integer roomid,@Param("userid") Integer userid);

    //根据清洁订单id删除订单
    public int do_DeleteCleancartById(@Param("id") Integer id);

    //获取未被接取的订单
    public List<CleanerCart> do_getNoneCleanerCart();

    //获取正在进行的订单
    public List<CleanerCart> do_getIngCleanerCart(@Param("cleaner") String cleaner);

    //获取已结束的订单
    public List<CleanerCart> do_getEndCleanerCart(@Param("cleaner") String cleaner);

    //接取订单
    public int do_ModifyCleanerCart(@Param("id") Integer id,@Param("cleaner") String cleaner);

    //完成订单
    public int do_EndCleanerCart(@Param("id") Integer id);

    public List<Room> do_getRoomListByLike(@Param("search") String search);

}
