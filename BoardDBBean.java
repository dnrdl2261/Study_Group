package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean board) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		int number;
		String id = board.getB_id();
		int step = board.getB_step();
		
		try {
			conn = getConnection();
			
			sql="select max(b_id) from boards"; //글번호 추가
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				number = rs.getInt(1)+1;
			} else {
				number = 1;
			}
			BoardBean.listNum = number;
			
			if (id != null) {
				sql="update boards set b_step=b_step+1"
						+ " where b_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, step);
				pstmt.executeUpdate();
				step = step+1;
			} else {
				step = 0;
			}
			
			sql="insert into boards(b_id, b_title, b_content, b_dday, b_startdate, b_finishdate"
					+ ", b_stmember, b_interests, b_goal, b_status, b_step, b_group, b_gmember) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_id());
			pstmt.setString(2, board.getB_title());
			pstmt.setString(3, board.getB_content());
			pstmt.setInt(4, board.getB_dday());
			pstmt.setTimestamp(5, board.getB_startdate());
			pstmt.setTimestamp(6, board.getB_finishdate());
			pstmt.setInt(7, board.getB_stmember());
			pstmt.setString(8, board.getB_interests());
			pstmt.setString(9, board.getB_goal());
			pstmt.setInt(10, board.getB_status());
			pstmt.setInt(11, board.getB_step());
			pstmt.setInt(12, board.getB_group());
			pstmt.setInt(13, board.getB_gmember());
			pstmt.executeUpdate(); //파라미터를 다 넣고 insert문을 실행
			
			re = 1; //제대로 진행되지 않으면 catch로 실행되면서 re가 -1로 됨
 			pstmt.close();
 			conn.close();
 			
			System.out.println("추가 성공");
		} catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public ArrayList<BoardBean> listBoard(String pageNumber){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null;
		
		int dbCount = 0;
		int absolutePage = 1;
		
		String sql = "select * from boards order by b_step asc";
		String sql2 = "select count(b_id) from boards";
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery(sql2);
			
			if (pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
			}
			
			if (dbCount % BoardBean.pageSize == 0) {	//80
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {	//84
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if (pageNumber != null) {
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				//1: 0*10+1=1, 2: 1*10+1=11
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
 			rs = stmt.executeQuery(sql);
 			
 			if (rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				
	 			while (count < BoardBean.pageSize) {
	 				BoardBean board = new BoardBean();
	 				
	 				board.setB_id(rs.getString(1));
	 				board.setB_title(rs.getString(2));
	 				board.setB_content(rs.getString(3));
	 				board.setB_dday(rs.getInt(4));
	 				board.setB_startdate(rs.getTimestamp(5));
	 				board.setB_finishdate(rs.getTimestamp(6));
	 				board.setB_stmember(rs.getInt(7));
	 				board.setB_interests(rs.getString(8));
	 				board.setB_goal(rs.getString(9));
	 				board.setB_status(rs.getInt(10));
	 				board.setB_step(rs.getInt(11));
	 				board.setB_group(rs.getInt(12));
	 				board.setB_gmember(rs.getInt(13));
	 				
	 				boardList.add(board);
	 				
	 				if (rs.isLast()) {
						break;
					} else {
						rs.next();
					}
	 				
	 				count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return boardList;
	}
	
	public BoardBean getBoard(String b_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BoardBean board = null;
		
		try {
			conn = getConnection();
			
			sql="select * from boards where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board=new BoardBean();
				board.setB_id(rs.getString(1));
 				board.setB_title(rs.getString(2));
 				board.setB_content(rs.getString(3));
 				board.setB_dday(rs.getInt(4));
 				board.setB_startdate(rs.getTimestamp(5));
 				board.setB_finishdate(rs.getTimestamp(6));
 				board.setB_stmember(rs.getInt(7));
 				board.setB_interests(rs.getString(8));
 				board.setB_goal(rs.getString(9));
 				board.setB_status(rs.getInt(10));
 				board.setB_step(rs.getInt(11));
 				board.setB_group(rs.getInt(12));
 				board.setB_gmember(rs.getInt(13));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return board;
	}
	
	public int deleteBoard(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "select b_id from boards where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(1);
				if (id.equals(board.getB_id())) {
					sql="delete from boards where b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, board.getB_id());
					pstmt.executeUpdate();
					re = 1;
				}else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public int editBoard(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql="select b_id from boards where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(1);
				if (id.equals(board.getB_id())) {
					sql="update boards set b_title=?, b_content=?, b_dday=?, b_startdate=?, b_finishdate=?"
							+ ", b_goal=?, b_status=? where b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, board.getB_title());
					pstmt.setString(2, board.getB_content());
					pstmt.setInt(3, board.getB_dday());
					pstmt.setTimestamp(4, board.getB_startdate());
					pstmt.setTimestamp(5, board.getB_finishdate());
					pstmt.setString(6, board.getB_goal());
					pstmt.setInt(7, board.getB_status());
					pstmt.executeUpdate();
					re = 1;
				}else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public int setNumber(int groupNum, int memberNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql="select b_group, b_gmember from boards where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(groupNum, 1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString(1);
				if (pwd.equals(b_pwd)) {
					sql="delete from boards where b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, b_id);
					pstmt.executeUpdate();
					re = 1;
				}else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	public int setStatus(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "select b_id from boards where b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_id());;
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(1);
				if (id.equals(board.getB_id())) {
					sql="update b_status set b_status=1 from boards where b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, board.getB_status());
					pstmt.executeUpdate();
					re = 1;
				}else {
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
}
