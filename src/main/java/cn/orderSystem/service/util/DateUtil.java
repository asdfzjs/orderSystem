/**
 * Project Name:orderSystem
 * File Name:DateUtil.java
 * Package Name:cn.orderSystem.service.util
 * Date:2016年11月15日下午2:34:50
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
*/

package cn.orderSystem.service.util;
/**
 * ClassName:DateUtil <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason:	 TODO ADD REASON. <br/>
 * Date:     2016年11月15日 下午2:34:50 <br/>
 * @author   Administrator
 * @version  
 * @since    JDK 1.6
 * @see 	 
 */

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    
    public static  String formatDate(Date date)throws ParseException{
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
    
    public static Date parse(String strDate) throws ParseException{
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(strDate);
    }
    public static void main(String[] args) throws ParseException {
		Date a = new Date();
		System.out.println(formatDate(a));
	}
}

