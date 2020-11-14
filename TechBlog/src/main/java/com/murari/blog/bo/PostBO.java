package com.murari.blog.bo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostBO {

	private int postId;
	private String postTitle;
	private String postContent;
	private String postCode;
	private String postPic;
	private Timestamp postDate;
	private int catId;
	private int userId;
}
