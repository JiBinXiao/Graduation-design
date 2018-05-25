package com.trs.rwsc.modules.book.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.regex.Pattern;


public class CrwalUtil {
	
	
	public int crwal(String type ,String keyword,String pythonpash, int sum) {
		System.out.println(type+"\t"+keyword+"\t正在爬取");
		int re=0;
		int result=0;
		Pattern pattern = Pattern.compile("[0-9]+");
		try {
	   
		File file = new File(pythonpash+"\\newSpider.py");		
		String[] arguments = new String[] {"python", file.getAbsolutePath(), type, keyword,sum+""};
	
	    Process process = Runtime.getRuntime().exec(arguments);
	 
	    BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
	    String line = null;  
		while ((line = in.readLine()) != null) {  
		      System.out.println(line);  
		      if(line!=null && !"".equals(line) && pattern.matcher(line).matches())
		    	  result=Integer.parseInt(line.trim());
		  }  
		  in.close();  
		  re = process.waitFor();  

		} catch (Exception e) {
		    e.printStackTrace();
		} 
	
		return result;

	}
	
	
	
	public static void main(String[] args) {
		CrwalUtil crwalUtil=new CrwalUtil();
		int sum=crwalUtil.crwal("dangdang","python","F:\\毕设\\graduationWorkplace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\rwsc\\static\\python",3);
		System.out.println(sum);
	}
}
