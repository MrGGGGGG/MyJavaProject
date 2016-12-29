package com.guowenjie.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport implements ServletContextAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File myfile;
	private String myfileFileName;
	private String myfileContentType;
	protected ServletContext servletcontext;
	public File getMyfile() {
		return myfile;
	}

	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}

	public String getMyfileFileName() {
		return myfileFileName;
	}

	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}

	public String getMyfileContentType() {
		return myfileContentType;
	}

	public void setMyfileContentType(String myfileContentType) {
		this.myfileContentType = myfileContentType;
	}
	
	
	public String execute() throws Exception{
		//String realPath=ServletActionContext.getServletContext().getRealPath("upload");
		String realPath = "E:/Myeclipse/files/struts2/WebRoot/upload";  
		//String savePath = realPath + "/" + uploadFileName  
		System.out.println(this.myfileFileName);
		System.out.println(this.myfileContentType);
		System.out.println(this.getMyfile());
		System.out.println("realpath:" + realPath);
		InputStream is = new FileInputStream(myfile);
		OutputStream os = new FileOutputStream(new File(realPath,myfileFileName));
//		File destFile  = new File(realPath, filename);
//		try {
//            //±£´æÎÄ¼þ
//            FileUtils.copyFile(myfile,destFile);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
		byte[] buffer = new byte[500];
        int length = 0;
        
        while(-1 != (length = is.read(buffer, 0, buffer.length)))
        {
            os.write(buffer);
        }
        os.close();
        is.close();
         
		return SUCCESS;
		
	}
	
	public String display() {
		return NONE;
	}

	@Override
	public void setServletContext(ServletContext servletcontext) {
		this.servletcontext = servletcontext;
		
	}
}
