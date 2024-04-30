package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderImpl implements BookOrderDAO {

	private Connection conn;

	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	@Override
	public boolean saveOrder(List<BookOrder> cart) {
boolean f=false;

try {
	String sql="insert into book_orders(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
	
	conn.setAutoCommit(false);
	PreparedStatement ps=conn.prepareStatement(sql);
	for(BookOrder b:cart) {
		ps.setString(1, b.getOrder_id());
		ps.setString(2, b.getUserName());
		ps.setString(3, b.getEmail());
		ps.setString(4, b.getFullAddress());
		ps.setString(5, b.getPhone());
		ps.setString(6, b.getBookName());
		ps.setString(7, b.getAuthor());
		ps.setString(8, b.getPrice());
		ps.setString(9, b.getPaymentType());
		ps.addBatch();
	}
	
	int[] count=ps.executeBatch();
	conn.commit();
	f=true;
	conn.setAutoCommit(true);
	
}catch(Exception e) {
	e.printStackTrace();
}

		return f;
	}



	@Override
	public List<BookOrder> getBook(String email) {
		
		List<BookOrder>list=new ArrayList<BookOrder>();
		BookOrder o=null;
		
		try {
			String sql="select * from book_orders where email=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				o=new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookOrder> getAllOrder() {
		List<BookOrder>list=new ArrayList<BookOrder>();
		BookOrder o=null;
		
		try {
			String sql="select * from book_orders ";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				o=new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
}
