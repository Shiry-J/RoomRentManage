package cn.RoomManagement.pojo;

public class Cart {

    private Integer id;
    private Integer userid;
    private Integer roomid;
    private Integer status;
    private double price;
    private String roommaster;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRoommaster() {
        return roommaster;
    }

    public void setRoommaster(String roommaster) {
        this.roommaster = roommaster;
    }

    public void setcart(Integer userid, Integer roomid, Integer status, double price,String roommaster){
        this.userid = userid;
        this.roomid = roomid;
        this.status = status;
        this.price = price;
        this.roommaster=roommaster;
    }

}
