package com.murari.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikesDAO {

	private static final String INSERT_INTO_LIKES="INSERT INTO LIKES(POST_ID,USER_ID) VALUES(?,?)";
	private static final String GET_COUNT_OF_LIKES="SELECT COUNT(*) FROM LIKES WHERE POST_ID=?";
	private static final String IS_LIKED_BY_USER="SELECT * FROM LIKES WHERE POST_ID=? AND USER_ID=?";
	private static final String DELETE_FROM_LIKE="DELETE FROM LIKES WHERE POST_ID=? AND USER_ID=?";
	private Connection con;

	public LikesDAO(Connection con) {
		this.con = con;
	}
	
	public boolean insertLikes(int postId,int userId) {
		PreparedStatement ps=null;
		boolean flag=false;
		try {
			ps=con.prepareStatement(INSERT_INTO_LIKES);
			ps.setInt(1, postId);
			ps.setInt(2, userId);
			ps.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int countLikesOnPost(int postId) {
		int count=0;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(GET_COUNT_OF_LIKES);
			ps.setInt(1, postId);
			rs=ps.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return count;
	}

	public boolean isLikedByUser(int postId,int userId) {
		boolean flag=false;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(IS_LIKED_BY_USER);
			ps.setInt(1,postId );
			ps.setInt(2, userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean 	deleteLike(int postId,int userId) {
		boolean flag=false;
		PreparedStatement ps=null;
		
		try {
			ps=con.prepareStatement(DELETE_FROM_LIKE);
			ps.setInt(1, postId);
			ps.setInt(2, userId);
			ps.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

}
