package com.guowenjie.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.javafx.collections.MappingChange.Map;

public class FileAction  extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File file;
	private String fileFileName;
	private String fileFileContentType;
	private String message = "0"; // 0格式错误 1成功(文件路径)  2失败
	private String filePath;
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileFileContentType() {
		return fileFileContentType;
	}

	public void setFileFileContentType(String fileFileContentType) {
		this.fileFileContentType = fileFileContentType;
	}
	@Override
	public String execute() throws Exception{
		String realPath = "E:/Myeclipse/files/struts2/WebRoot/upload";  
		String serverPath=ServletActionContext.getServletContext().getRealPath("upload");
		System.out.println("文件："+this.file);
		System.out.println("文件名称："+this.fileFileName);
		System.out.println("文件类型："+this.fileFileContentType);
		System.out.println("realpath:" + realPath);
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(new File(realPath,fileFileName));
		OutputStream oo = new FileOutputStream(new File(serverPath,fileFileName));
		byte[] buffer = new byte[500];
		int length = 0;

		while(-1 != (length = is.read(buffer, 0, buffer.length)))
		{
			os.write(buffer);
			oo.write(buffer);
		}
		os.close();
		is.close();
		//HashMap<String, Object> data = new HashMap<String, Object>();
		//data.put("message", realPath+"\\"+this.getFileFileName());
		//message=realPath+"/"+this.getFileFileName();
		message = fileFileName;
		return SUCCESS;
	}

	public String display() {
		return NONE;
	}
}
