package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://127.0.0.1:3306/EBS?serverTimezone=UTC";
			String dbID = "아이디";
			String dbPassword = "패스워드";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String sql = "select NOW()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String sql = "select bbsID from board order by bbsID desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String Title, String ID, String Content) {
		String sql = "insert into board values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			pstmt.setString(2, getDate());
			pstmt.setString(3, Title);
			pstmt.setString(4, Content);
			pstmt.setInt(5, getNext());
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<board> getList(int pageNumber){
		String sql = "select * from board where bbsID < ? and bbsavailable=1 order by bbsID desc limit 10";
		ArrayList<board> list = new ArrayList<board>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board bbs = new board();
				bbs.setID(rs.getString(1));
				bbs.setDate(rs.getString(2));
				bbs.setTitle(rs.getString(3));
				bbs.setContent(rs.getString(4));
				bbs.setBbsID(rs.getInt(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where bbsID < ? and bbsavailable=1";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public board getbbs(int bbsID) {
		String sql = "select * from board where bbsID=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board bbs = new board();
				bbs.setID(rs.getString(1));
				bbs.setDate(rs.getString(2));
				bbs.setTitle(rs.getString(3));
				bbs.setContent(rs.getString(4));
				bbs.setBbsID(rs.getInt(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
}
