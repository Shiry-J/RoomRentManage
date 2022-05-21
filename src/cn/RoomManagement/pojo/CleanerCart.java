package cn.RoomManagement.pojo;

public class CleanerCart {

    private Integer id;
    private Integer userid;
    private Integer roomid;
    private String roomaddress;
    private String cleaner;//未被接取时为”无“
    private Double price;
    private Integer status;//0表示结束，1表示进行中，2表示未被接取

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getUserid() {
        return userid;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public String getRoomaddress() {
        return roomaddress;
    }

    public void setRoomaddress(String roomaddress) {
        this.roomaddress = roomaddress;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getPrice() {
        return price;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public String getCleaner() {
        return cleaner;
    }

    public void setCleaner(String cleanner) {
        this.cleaner = cleaner;
    }

    public void setCleanCart(Integer userid,Integer roomid,String roomaddress,String cleaner,Double price,Integer status){
        this.userid=userid;
        this.roomid=roomid;
        this.roomaddress=roomaddress;
        this.cleaner=cleaner;
        this.price=price;
        this.status=status;
    }

}
