package cn.RoomManagement.service.user;

import cn.RoomManagement.dao.user.UserMapper;
import cn.RoomManagement.pojo.Cleanner;
import cn.RoomManagement.pojo.RoomMaster;
import cn.RoomManagement.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(String username, String password) {
        User user = userMapper.getUserByUserName(username);
        if (user != null && !user.getPassword().equals(password)) {
            //当用户存在，但密码错误，赋值为null
            user = null;
        }
        return user;
    }

    public User register(User user) {
        User checkuser = userMapper.getUserByUserName(user.getUsername());
        if (checkuser == null) {
            //当用户不存在时
            int count = userMapper.addUser(user);
            if (count > 0) {
                return user;
            }
        }
        return null;
    }

    public RoomMaster registerroommaster(RoomMaster roommaster){
        RoomMaster checkuser = userMapper.getRoomMasterByUserName(roommaster.getUsername());
        if(checkuser == null) {//用户不存在
            int count = userMapper.addRoomMaster(roommaster);
            if (count > 0)
                return roommaster;
        }
        return null;
    }

    public Cleanner registercleanner(Cleanner cleanner){
        Cleanner checkuser = userMapper.getCleannerByUserName(cleanner.getUsername());
        if(checkuser == null) {//用户不存在
            int count = userMapper.addCleanner(cleanner);
            if (count > 0)
                return cleanner;
        }
        return null;
    }

    public RoomMaster ifroommaster(String username){
        RoomMaster checkuser = userMapper.getRoomMasterByUserName(username);
        if (checkuser != null){//用户存在
            return checkuser;
        }
        return null;
    }

    public Cleanner ifcleanner(String username){
        Cleanner checkuser = userMapper.getCleannerByUserName(username);
        if (checkuser != null){//用户存在
            return checkuser;
        }
        return null;
    }

    public int modifypassword(String username,String password){
        int count = userMapper.modifypassword(username,password);
        if(count > 0){
            return count;
        }
        return 0;
    }


}
