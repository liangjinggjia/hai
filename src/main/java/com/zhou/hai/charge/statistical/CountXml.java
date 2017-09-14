package com.zhou.hai.charge.statistical;

import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.zhou.hai.charge.statistical.CountObjectInfo;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;

public class CountXml {

	/** 在这里定义XMLCOUNT.XML的绝对路径,注意此处代码要修改的哦 */
	private String fileName = "E:\\count\\xmlcount.xml";

	private static CountObjectInfo obj = null;

	private static CountXml instance = null;

	public static CountXml getInstance() {
		if (instance == null) {
			instance = new CountXml();
		}
		return instance;
	}

	private CountXml() {
		try {
			obj = read(fileName);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public int getTotalCount() {
		return obj.getTotalCount();
	}

	public int getDayCount() {
		return obj.getDayCount();
	}

	public int getMonthCount() {
		return obj.getMonthCount();
	}

	public int getWeekCount() {
		return obj.getWeekCount();
	}

	public int getYearCount() {
		return obj.getYearCount();
	}

	public synchronized void addcount(Date da) {// 比较日期增加计数
		if (new SimpleDateFormat("yyyy-MM-dd").format(this.obj.date).equals(
				new SimpleDateFormat("yyyy-MM-dd").format(da)))
			this.obj.setDayCount(this.obj.getDayCount() + 1);
		else
			this.obj.setDayCount(1);

		if (new SimpleDateFormat("yyyy-MM").format(this.obj.date).equals(
				new SimpleDateFormat("yyyy-MM").format(da)))
			this.obj.setMonthCount(this.obj.getMonthCount() + 1);
		else
			obj.setMonthCount(1);

		Calendar ca = Calendar.getInstance();
		ca.setTime(da);
		ca.setFirstDayOfWeek(Calendar.MONDAY);

		if (ca.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY
				&& !new SimpleDateFormat("yyyy-MM-dd").format(this.obj.date)
						.equals(new SimpleDateFormat("yyyy-MM-dd").format(da)))
			obj.setWeekCount(1);
		else
			obj.setWeekCount(obj.getWeekCount() + 1);

		if (new SimpleDateFormat("yyyy").format(this.obj.date).equals(
				new SimpleDateFormat("yyyy").format(da)))
			this.obj.setYearCount(this.obj.getYearCount() + 1);
		else
			obj.setYearCount(1);
			obj.setDate(da);

		obj.setTotalCount(obj.getTotalCount() + 1);
		obj.setTempCount(obj.getTempCount() + 1);
		if (obj.getTempCount() >= 0) {// 只有当临时访问量大于等于10时才保存一次
			obj.setTempCount(0);// 临时计数器置0
			write(fileName);
		}
	}

	private void write(String fileName) {
		try {
			FileWriter writer = new FileWriter(fileName);
			Marshaller.marshal(obj, writer);
			writer.close();
		} catch (Exception e) {
			System.out.println(e);

		}
	}

	private CountObjectInfo read(String fileName) throws Exception {
		FileReader reader = new FileReader(fileName);
		CountObjectInfo result = (CountObjectInfo) Unmarshaller.unmarshal(
				CountObjectInfo.class, reader);
		reader.close();
		return result;
	}

}
