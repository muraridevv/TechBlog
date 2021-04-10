# TechBlog

TecnBlog is a Stateful app built with [Servlet-Jsp](https://docs.oracle.com/javaee/7/tutorial/servlets.htm), [MySQL](https://www.mysql.com/) and [Bootstrap](https://getbootstrap.com/docs/4.1/getting-started/introduction/).

Features:
- User authentication: Register/Login/Logout
- Creating and deleting users
- Editing user profile
- Searching for Posts
- Creating and deleting posts
- Creating and deleting comments
- Facebook Like and Unlike


The project will be deployed soon.



## Requirements

1. Java 8

2. Mysql server and workbench

## Start the app



#### 1. Set Mysql Database credential

Go to the ConnectionProvider of com.murari.blog.helper:

```bash
$ change connection properties in line 14 and 16.
```
#### 2. Create database table 

```bash
$ create database table mapped with LikesDAO,PostDAO,UserDAO from com.murari.blog.dao
```
#### 3. Run on Server 
```bash
Right click on project name->Run As->Run on Server.
```




## App screenshots

1. **Home Page**

 ![App Screenshot](readme-images/kl-social-network-home-gregor.PNG)

2. **Friends Page**

 ![App Screenshot](readme-images/kl-social-network-friends-gregor.PNG)

3. **Photos Page**

 ![App Screenshot](readme-images/kl-social-network-photos-gregor.PNG)

