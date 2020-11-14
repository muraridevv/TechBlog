package com.murari.blog.bo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserInfoBO {
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private Timestamp dateTime;
	private String about;
	private String profile;
}
