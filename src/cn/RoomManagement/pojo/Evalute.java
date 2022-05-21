package cn.RoomManagement.pojo;

public class Evalute {

    private Integer id;
    private Integer cartid;
    private Integer userid;
    private Integer roomid;
    private String roommaster;
    private String message;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Integer getCartid() {
        return cartid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoommaster(String roommaster) {
        this.roommaster = roommaster;
    }

    public String getRoommaster() {
        return roommaster;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setEvalute(Integer cartid,Integer userid,Integer roomid,String roommaster,String message){
        this.cartid=cartid;
        this.roomid=roomid;
        this.userid=userid;
        this.roommaster=roommaster;
        this.message=message;
    }
}
