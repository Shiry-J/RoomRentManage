package cn.RoomManagement.dao.user;

import cn.RoomManagement.pojo.Cleanner;
import cn.RoomManagement.pojo.RoomMaster;
import cn.RoomManagement.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    //根据用户名获得用户
    public User getUserByUserName(@Param("username") String username);
    public RoomMaster getRoomMasterByUserName(@Param("username") String username);
    public Cleanner getCleannerByUserName(@Param("username") String username);

    //添加用户
    public int addUser(User user);
    public int addRoomMaster(RoomMaster roommaster);
    public int addCleanner(Cleanner cleanner);

    //修改密码
    public int modifypassword(@Param("username") String username,@Param("password") String password);

}
