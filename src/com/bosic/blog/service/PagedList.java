package com.bosic.blog.service;

import java.util.List;

public class PagedList<T> {
	//当前页
	private int index;
	//总页数
	private int total;
	//总记录数
	private long count;
	//当前页数据
	private List<T> rows;
	
	public PagedList(int pageIndex, int pageSize, long totalCount, List<T> rows){
		this.index = pageIndex;
		
		this.count = totalCount;
		
		this.total = (int)((totalCount - 1)/pageSize + 1);
		
		this.rows = rows;
		
		this.index = Math.max(this.index, 1);
	
		this.index = Math.min(this.index, this.total);
	}

	/**
	 * 当前页
	 * @return
	 */
	public int getIndex() {
		return index;
	}

	/**
	 * 总页数
	 * @return
	 */
	public int getTotal() {
		return total;
	}
	
	/**
	 * 总记录数
	 */
	public long getCount() {
		return count;
	}
	
	/**
	 * 当前页数据
	 * @return
	 */
	public List<T> getRows() {
		return rows;
	}
	
	/**
	 * 首页
	 * @return
	 */
	public int getFirst() {
		return 1;
	}
	
	/**
	 * 前一页  ${page.prev}
	 * @return
	 */
	public int getPrev(){
		return Math.max(index-1, 1);
	}
	
	/**
	 * 后一页
	 * @return
	 */
	public int getNext(){
		return Math.min(index+1, total);
	}
	
	/**
	 * 尾页
	 * @return
	 */
	public int getLast(){
		return total;
	}
}
