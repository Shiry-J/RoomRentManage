package cn.RoomManagement.pojo;

import java.util.Date;

public class Room {

    private Integer id;
    private String roomname;
    private Double roomprice;
    private String roomimage;
    private Date roomdate;
    private String roomdescription;
    private String roommaster;
    private String roomaddress;
    private Integer ison;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setRoomname(String roomname){
        this.roomname = roomname;
    }

    public String getRoomname(){
        return roomname;
    }

    public void setRoomprice(Double roomprice){
        this.roomprice = roomprice;
    }

    public Double getRoomprice(){
        return roomprice;
    }

    public void setRoomimage(String roomimage){
        this.roomimage=roomimage;
    }

    public String getRoomimage(){
        return  roomimage;
    }

    public void setRoomdate(Date roomdate){
        this.roomdate=roomdate;
    }

    public Date getRoomdate(){
        return  roomdate;
    }

    public void setRoomdescription(String roomdescription){
        this.roomdescription=roomdescription;
    }

    public String getRoomdescription(){
        return roomdescription;
    }

    public void setRoommaster(String roommaster){
        this.roommaster=roommaster;
    }

    public String getRoommaster() {
        return roommaster;
    }

    public void setRoomaddress(String roomaddress) {
        this.roomaddress = roomaddress;
    }

    public String getRoomaddress() {
        return roomaddress;
    }

    public Integer getIson() {
        return ison;
    }

    public void setIson(Integer ison) {
        this.ison = ison;
    }
}
