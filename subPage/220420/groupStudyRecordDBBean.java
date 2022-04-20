package subStudyGroup;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class groupStudyRecordDBBean {
	private static groupStudyRecordDBBean instance = new groupStudyRecordDBBean();
	
	public static groupStudyRecordDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	public int insertRecord(groupStudyRecordBean gsr, int gnum) throws Exception{
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "";
		
		gnum = gsr.getGnum();
		int pnum = gsr.getPnum();
		String groupmember = gsr.getGroupmember();

		String tod = gsr.getTod();
		String content = gsr.getContent();
		//글이 있으면 작성 못하게 --> 수정만 할 수 있게
		int re = -1;
		int count = 0;
		
	    try {
			conn = getConnection();
			
			if(tod.length() != 0) {
				re = -1;
				pstm.close();
				conn.close();
			}else {
				sql = "insert into test1 values (?,?,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1,gnum);
				pstm.setInt(2,pnum);
				pstm.setString(3, tod);
				pstm.setString(4, groupmember);
				pstm.setString(5, content);
				
				pstm.executeUpdate();
				re = 1;
				pstm.close();
				conn.close();
			}
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					if(pstm != null) pstm.close();
					if(conn != null) conn.close();
				}catch(Exception e2) {
					e2.printStackTrace();
				}
			}
		return re;
	}
	
	
	public groupStudyRecordBean getRecord(String groupmember,String tod) throws Exception{
		   groupStudyRecordBean gsr = new groupStudyRecordBean();
			
		   Connection conn = null;
		   PreparedStatement pstm = null;
		   ResultSet rs = null;
		   String sql = "";
		   
		   try{
		        conn = getConnection();
		    	sql = "select * from test1 where groupmember=? and tod =?";
		    	pstm = conn.prepareStatement(sql);
		        pstm.setString(1,groupmember);
		        pstm.setString(2,tod);
		        rs = pstm.executeQuery();
		       
		        if(rs.next()){
		        	gsr.setGroupmember(rs.getString("groupmember"));
		        	gsr.setTod(rs.getString("tod"));
		        	gsr.setContent(rs.getString("content"));
		        	}
		        pstm.close();
		        conn.close();
		        }catch(Exception e){
		            e.printStackTrace();
		        }
				finally{
					try {
						if(pstm != null) pstm.close();
						if(conn != null) conn.close();
					}catch(Exception e2) {
						e2.printStackTrace();
					}
				}
			return gsr;
	}
	public ArrayList<groupStudyRecordBean> memlist(int gnum){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select distinct groupmember from test1 where gnum =?";
		ArrayList<groupStudyRecordBean> list = new ArrayList<groupStudyRecordBean>();
		
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,gnum);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				groupStudyRecordBean gsr = new groupStudyRecordBean();
				gsr.setGroupmember(rs.getString(4));
				list.add(gsr);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<groupStudyRecordBean> listRecord(int gnum){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select gnum, pnum, tod, groupmember, content from test1 where gnum =? order by pnum asc";
		ArrayList<groupStudyRecordBean> list = new ArrayList<groupStudyRecordBean>();
		
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,gnum);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				groupStudyRecordBean gsr = new groupStudyRecordBean();
				gsr.setGnum(rs.getInt(1));
				gsr.setPnum(rs.getInt(2));
				gsr.setTod(rs.getString(3));
				gsr.setGroupmember(rs.getString(4));
				gsr.setContent(rs.getString(5));
				
				list.add(gsr);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<groupStudyRecordBean> contentList(String groupmember){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select content,tod from test1 where groupmember=? order by tod asc";
		ArrayList<groupStudyRecordBean> list = new ArrayList<groupStudyRecordBean>();
		
		try {
			conn = getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, groupmember);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				groupStudyRecordBean gsr = new groupStudyRecordBean();
				gsr.setContent(rs.getString(1));
				gsr.setTod(rs.getString(2));
				list.add(gsr);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public int editBoard(groupStudyRecordBean gsrd) throws Exception{
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;

		try {
			conn = getConnection();
					pstm = conn.prepareStatement("update test1 set content=? where tod=?");
					pstm.setString(1, gsrd.getContent());
					pstm.setString(2, gsrd.getTod());

					pstm.executeUpdate();
					pstm.close();
					conn.close();

					re = 1;
			}catch (Exception e) {
			e.printStackTrace();
			System.out.println("변경 실패");
			}
			return re;
	}
}
