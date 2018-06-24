package com.trade.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getNowDate(){
		DateFormat format=new SimpleDateFormat("yyyy-mm-dd");
		String date=format.format(new Date());
		return date;
	}
}
