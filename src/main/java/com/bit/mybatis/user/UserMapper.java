package com.bit.mybatis.user;


import com.bit.user.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    public String userCheck(String id);

    public UserDTO myPage(String userid);

    public UserDTO info(String userid);

    public int infoUpdate(UserDTO user);

    public int register(UserDTO user);

    public int loginTest(UserDTO user);

    public int userDelete(String id);

    public String idCheck(String id);

    public List<UserDTO> userList();


}
