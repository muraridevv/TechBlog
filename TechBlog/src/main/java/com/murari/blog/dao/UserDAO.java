package com.murari.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.murari.blog.bo.UserInfoBO;

public class UserDAO {
	private static final String INSERT_USER_INFO="INSERT INTO USER_INFO(NAME,EMAIL,PASSWORD,GENDER,ABOUT) VALUES(?,?,?,?,?)";
	private static final String GET_USER_DETAILS="SELECT * FROM USER_INFO WHERE EMAIL=? AND PASSWORD=?";
	private static final String UPDATE_USER="UPDATE USER_INFO SET NAME=?,EMAIL=?,PASSWORD=?,GENDER=?,ABOUT=?, PROFILE=? WHERE ID=?";
	private static final String GET_USER_BY_POST_ID="SELECT * FROM USER_INFO WHERE ID=?";
	private Connection con;
	private PreparedStatement ps=null;
	
	public UserDAO(Connection con) {
		this.con=con;
	}
	
	public boolean saveUser(UserInfoBO bo) {
		boolean flag=false;
		try {
			
			ps=con.prepareStatement(INSERT_USER_INFO);
			ps.setString(1, bo.getName());
			ps.setString(2, bo.getEmail());
			ps.setString(3, bo.getPassword());
			ps.setString(4, bo.getGender());
			ps.setString(5, bo.getAbout());
			ps.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	//get user by username and password
	public UserInfoBO getUserByEmailAndPassword(String email,String password) {
		UserInfoBO bo=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement(GET_USER_DETAILS);
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()) {
				bo=new UserInfoBO();
				bo.setId(rs.getInt("id"));
				bo.setName(rs.getString("name"));
				bo.setEmail(rs.getString("email"));
				bo.setPassword(rs.getString("password"));
				bo.setGender(rs.getString("gender"));
				bo.setAbout(rs.getString("about"));
				bo.setDateTime(rs.getTimestamp("reg_date"));
				bo.setProfile(rs.getString("profile"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return bo;
	}

	public boolean updateUser(UserInfoBO bo) {
		boolean flag=false;
		try {
			ps=con.prepareStatement(UPDATE_USER);
			ps.setString(1, bo.getName());
			ps.setString(2, bo.getEmail());
			ps.setString(3, bo.getPassword());
			ps.setString(4, bo.getGender());
			ps.setString(5, bo.getAbout());
			ps.setString(6, bo.getProfile());
			ps.setInt(7, bo.getId());
			
			ps.executeUpdate();
			flag=true;
		} catch (SQLException sqe) {
			
			sqe.printStackTrace();
		}
		return flag;
	}

	public UserInfoBO getUserNameByUserId(int userId) {
		UserInfoBO userInfoBO=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(GET_USER_BY_POST_ID);
			ps.setInt(1, userId);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				userInfoBO=new UserInfoBO();
				
				userInfoBO.setId(rs.getInt("id"));
				userInfoBO.setName(rs.getString("name"));
				userInfoBO.setEmail(rs.getString("email"));
				userInfoBO.setPassword(rs.getString("password"));
				userInfoBO.setGender(rs.getString("gender"));
				userInfoBO.setAbout(rs.getString("about"));
				userInfoBO.setDateTime(rs.getTimestamp("reg_date"));
				userInfoBO.setProfile(rs.getString("profile"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return userInfoBO;
	}
}
