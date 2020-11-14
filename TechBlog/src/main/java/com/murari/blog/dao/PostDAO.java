package com.murari.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.murari.blog.bo.CategoryBO;
import com.murari.blog.bo.PostBO;


public class PostDAO {

	private static final String GET_CATEGORIES="SELECT * FROM CATEGORY";
	private static final String INSERT_INTO_POST="INSERT INTO POST (POST_TITLE,POST_CONTENT,POST_CODE,POST_PIC,CAT_ID,USER_ID) VALUES(?,?,?,?,?,?)";
	private static final String GET_ALL_POSTS="SELECT * FROM POST ORDER BY POST_ID";
	private static final String GET_POST_BY_CATEGORY="SELECT * FROM POST WHERE CAT_ID=?";
	private static final String GET_POST_BY_POSTID="SELECT * FROM POST WHERE POST_ID=?";
	private Connection con;
	
	
	public PostDAO(Connection con) {
		this.con=con;
	}
	
	
	public ArrayList<CategoryBO> getAllCategory(){
		ArrayList<CategoryBO> catBOList=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		CategoryBO catBO=null;
		catBOList=new ArrayList<CategoryBO>();
		
		try {
			ps=con.prepareStatement(GET_CATEGORIES);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				catBO=new CategoryBO();
				
				catBO.setCatId(rs.getInt(1));
				catBO.setCatName(rs.getString(2));
				catBO.setCatDescription(rs.getString(3));
				catBOList.add(catBO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return catBOList;
	}

	public boolean savePost(PostBO postBO) {
		PreparedStatement ps=null;
		boolean flag=false;
		try {
			ps=con.prepareStatement(INSERT_INTO_POST);
			ps.setString(1, postBO.getPostTitle());
			ps.setString(2, postBO.getPostContent());
			ps.setString(3, postBO.getPostCode());
			ps.setString(4, postBO.getPostPic());
			ps.setInt(5, postBO.getCatId());
			ps.setInt(6, postBO.getUserId());
			ps.executeUpdate();
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	//get All the posts
	public ArrayList<PostBO> getAllPosts(){
		
		ArrayList<PostBO>postBOList=new ArrayList<PostBO>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		PostBO postBO=null;
		
		//fetch all the posts
		try {
			ps=con.prepareStatement(GET_ALL_POSTS);
			rs=ps.executeQuery();
			
			
			while(rs.next()) {
				postBO=new PostBO();
				postBO.setPostId(rs.getInt("POST_ID"));
				postBO.setPostTitle(rs.getString("POST_TITLE"));
				postBO.setPostContent(rs.getString("POST_CONTENT"));
				postBO.setPostCode(rs.getString("POST_CODE"));
				postBO.setPostPic(rs.getString("POST_PIC"));
				postBO.setPostDate(rs.getTimestamp("POST_DATE"));
				postBO.setCatId(rs.getInt("CAT_ID"));
				postBO.setUserId(rs.getInt("USER_ID"));
				
				postBOList.add(postBO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postBOList;
	}
	
	//get posts by categories
	public ArrayList<PostBO> getPostsByCategory(int catId){
		ArrayList<PostBO>postBOList=new ArrayList<PostBO>();
		PostBO postBO=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		//fetch post by catId
		try {
			ps=con.prepareStatement(GET_POST_BY_CATEGORY);
			ps.setInt(1, catId);
			rs=ps.executeQuery();
			
			
			while(rs.next()) {
				postBO=new PostBO();
				postBO.setCatId(rs.getInt("POST_ID"));
				postBO.setPostTitle(rs.getString("POST_TITLE"));
				postBO.setPostContent(rs.getString("POST_CONTENT"));
				postBO.setPostCode(rs.getString("POST_CODE"));
				postBO.setPostPic(rs.getString("POST_PIC"));
				postBO.setPostDate(rs.getTimestamp("POST_DATE"));
				postBO.setUserId(rs.getInt("USER_ID"));
				
				postBOList.add(postBO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return postBOList;
	}

	public PostBO getPostByPostId(int postId) {
		PreparedStatement ps=null;
		PostBO postBO=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(GET_POST_BY_POSTID);
			ps.setInt(1, postId);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				postBO=new PostBO();
				postBO.setPostId(rs.getInt("POST_ID"));
				postBO.setPostTitle(rs.getString("POST_TITLE"));
				postBO.setPostContent(rs.getString("POST_CONTENT"));
				postBO.setPostCode(rs.getString("POST_CODE"));
				postBO.setPostPic(rs.getString("POST_PIC"));
				postBO.setPostDate(rs.getTimestamp("POST_DATE"));
				postBO.setCatId(rs.getInt("CAT_ID"));
				postBO.setUserId(rs.getInt("USER_ID"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postBO;
	}
}
