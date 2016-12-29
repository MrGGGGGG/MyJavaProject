package test;


import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
	@org.junit.Test
	public void producttest(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		System.out.println(sdf.format(date));
	}
}
