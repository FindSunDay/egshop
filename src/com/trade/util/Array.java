package com.trade.util;

public class Array {

	
	public static String arrayToString(String[] ids){
		String id="";
			for(int i=0;i<ids.length;i++){
				if("".equals(id)){
					id=ids[i];
				}else{
					id+=","+ids[i];
				}
		}
		return id;
	}
}
