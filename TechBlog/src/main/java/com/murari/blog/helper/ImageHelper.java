package com.murari.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ImageHelper {

	public static boolean deleteFile(String path) {
		boolean flag=false;
		try {
			File file=new File(path);
			flag=file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static boolean saveFile(InputStream is,String path) {
		boolean flag=false;
		FileOutputStream fos=null;
		try {
			
			byte[] b=new byte[is.available()];
			
			is.read(b);
			fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			flag=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
}
