package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.ecsite.dto.UserInfoDTO;
import com.internousdev.ecsite.util.DBConnector;

public class UserListDAO {
	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	public List<UserInfoDTO> getUserList() throws SQLException {
		List<UserInfoDTO> userInfoDTOList = new ArrayList<UserInfoDTO>();

		String sql = "select * from login_user_transaction order by id";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			UserInfoDTO dto = new UserInfoDTO();
			dto.setId(rs.getString("id"));
			dto.setLoginId(rs.getString("login_Id"));
			dto.setLoginPass(rs.getString("login_Pass"));
			dto.setUserName(rs.getString("user_name"));
			dto.setInsert_date(rs.getString("insert_date"));
			dto.setUpdate_date(rs.getString("updated_date"));
			userInfoDTOList.add(dto);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		con.close();
	}
		return userInfoDTOList;
  }
}