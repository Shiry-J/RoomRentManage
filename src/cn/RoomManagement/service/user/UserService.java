package cn.RoomManagement.service.user;

import cn.RoomManagement.pojo.Cleanner;
import cn.RoomManagement.pojo.RoomMaster;
import cn.RoomManagement.pojo.User;

public interface UserService {
    //登录验证
    public User login(String username,String password);
    //注册验证，判断user表上是否存在该用户
    public User register(User user);
    //注册房东，判断该用户是否为房东
    public RoomMaster registerroommaster(RoomMaster roommaster);
    //注册清洁人员，判断该用户是否为清洁人员
    public Cleanner registercleanner(Cleanner cleanner);
    //根据用户名判断房东数据库中是否存在该用户
    public RoomMaster ifroommaster(String username);
    //根据用户名判断清洁人员数据库中是否存在该用户
    public Cleanner ifcleanner(String username);
    //修改密码
    public int modifypassword(String username,String password);
}
