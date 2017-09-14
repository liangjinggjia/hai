package com.zhou.hai.charge.statistical;

import java.util.Date;

public class CountObjectInfo {

	// �ܷ������ϼ�
	protected int totalCount = 0;
	// �շ�����
	protected int dayCount = 0;
	// �ܷ�����
	protected int weekCount = 0;
	// �·�����
	protected int monthCount = 0;
	// �������
	protected int yearCount = 0;
	// ��ʱ������
	protected int tempCount = 0;

	protected Date date = new Date();

	public int getDayCount() {
		return dayCount;
	}

	public int getMonthCount() {
		return monthCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getWeekCount() {
		return weekCount;
	}

	public int getYearCount() {
		return yearCount;
	}

	public void setDayCount(int i) {
		dayCount = i;
	}

	public void setMonthCount(int i) {
		monthCount = i;
	}

	public void setTotalCount(int i) {
		totalCount = i;
	}

	public void setWeekCount(int i) {
		weekCount = i;
	}

	public void setYearCount(int i) {
		yearCount = i;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getTempCount() {
		return tempCount;
	}

	public void setTempCount(int i) {
		tempCount = i;
	}

}
