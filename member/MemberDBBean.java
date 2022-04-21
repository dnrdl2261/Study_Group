package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();

	public static MemberDBBean getInstance() {//값을 입력받는 메소드
		return instance; //getInstance()를 호출하면 MemberDBBean의 객체를 받음
	}
	public Connection getConnection() throws Exception{
		//쿼리 작업에 사용할 Connection객체 리턴하는 메소드
		//따로 만든 이유 -> 여러번 사용하기 위해서
		
		Context ctx = new InitialContext();  //DBCP를 사용하기 위해서
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();	
	}
	public int insertMember(MemberBean Member) throws Exception{ //데이터를 삽입하기 위한 메소드
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into STMEMBERS values(STUDY_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
		//PreparedStatment를 사용했기 때문에 ?로 값을 받아서 넣음
		int re = -1; //re -> 회원가입이면 1아니면 -1로 나타냄
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql); //prepareStatmenet 사용
			pstmt.setString(1, Member.getMem_id()); //get으로 값을 파라미터로 넣음
			pstmt.setString(2, Member.getMem_pw());
			pstmt.setString(3, Member.getMem_name());
			pstmt.setString(4, Member.getMem_jumin());
			pstmt.setString(5, Member.getMem_tel());
			pstmt.setString(6, Member.getMem_email());
			pstmt.setString(7, Member.getMem_interests());
			pstmt.setString(8, Member.getMem_introduce());
			pstmt.setInt(9, Member.getMem_report());
			
			pstmt.executeUpdate(); //파라미터를 다 넣고 insert문을 실행
			re = 1; //제대로 진행되지 않으면 catch로 실행되면서 re가 -1로 됨
			
			pstmt.close();
			con.close();
			System.out.println("추가 성공");
		}catch(Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}
		return re;
	}
	
	public int confirmID(String id) throws Exception{ //아이디 중복확인을 위한 메소드
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select mem_id from stmembers where mem_id=?";
		//파라미터값을 ?로 받음
		int re= -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //sql의 결과값
		
			if(rs.next()) {
				re = 1;
			}
			else {
				re = -1;
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
			return re;
	}
	
	//로그인 할 때, 아이디가 존재하는지 확인 여부 메소드
	public int userCheck(String id, String pw) throws Exception {
		int re = -1;
		String sql = "select mem_pw from stmembers where mem_id=?";
			try {
				Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) { //아이디가 일치하는 로우 존재
					String db_mem_pw = rs.getString("mem_pw");
					if (db_mem_pw.equals(pw)) { //패스워드 일치
						re = 1;
					}else { //패스워드 불일치
						re = 0;
					}
				}else { //아이디가 존재하지 않음
					re = -1;
				}

				con.close();
				ps.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return re;
		}

	//아이디가 일치하는 멤버의 정보를 얻어오는 메소드
	public MemberBean getMember(String id) throws Exception {
		String sql = "select * from stmembers where mem_id=?";
		MemberBean member = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) { //아이디가 일치하는 로우 존재
				member = new MemberBean();
				member.setMem_num(rs.getInt("mem_num"));
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_pw(rs.getString("mem_pw"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_jumin(rs.getString("mem_jumin"));
				member.setMem_tel(rs.getString("mem_tel"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_interests(rs.getString("mem_interests"));
				member.setMem_introduce(rs.getString("mem_introduce"));
				member.setMem_report(rs.getInt("mem_report"));
			}
			con.close();
			ps.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int updateMember(MemberBean member) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int re=-1;
		
		String sql="update stmembers set mem_pw=?, mem_tel=?, mem_email=?, mem_interests=?, mem_introduce=? where mem_id=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_pw());
			pstmt.setString(2, member.getMem_tel());
			pstmt.setString(3, member.getMem_email());
			pstmt.setString(4, member.getMem_interests());
			pstmt.setString(5, member.getMem_introduce());
			pstmt.setString(6, member.getMem_id());
			re = pstmt.executeUpdate();
			
			System.out.println("변경 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("변경 실패");
		}
		
		return re;
	}
	
	public MemberBean getUserInfo(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean member = null;
 
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM STMEMBERS WHERE MEM_ID=?");
 
            conn = getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) {   // 회원정보를 DTO에 담는다.
               
                
                // 자바빈에 정보를 담는다.
            	member = new MemberBean();
				member.setMem_num(rs.getInt("mem_num"));
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_pw(rs.getString("mem_pw"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_jumin(rs.getString("mem_jumin"));
				member.setMem_tel(rs.getString("mem_tel"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_interests(rs.getString("mem_interests"));
				member.setMem_introduce(rs.getString("mem_introduce"));
				member.setMem_report(rs.getInt("mem_report"));
            }
 
            return member;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }    // end getUserInfo
	
	@SuppressWarnings("resource")
    public int deleteMember(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = -1;
 
        try {
            // 비밀번호 조회
            StringBuffer query1 = new StringBuffer();
            query1.append("SELECT MEM_PW FROM STMEMBERS WHERE MEM_ID=?");
 
            // 회원 삭제
            StringBuffer query2 = new StringBuffer();
            query2.append("DELETE FROM STMEMBERS WHERE MEM_ID=?");
 
            conn = getConnection();
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 1. 아이디에 해당하는 비밀번호를 조회한다.
            pstmt = conn.prepareStatement(query1.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) 
            {
                dbpw = rs.getString("mem_pw");
                if (dbpw.equals(pw)) { // 입력된 비밀번호와 DB비번 비교
                	
                    // 같을경우 회원삭제 진행
                    pstmt = conn.prepareStatement(query2.toString());
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    conn.commit(); 
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호 비교결과 - 다름
                }
            }
 
            return x;
 
        } catch (Exception sqle) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end deleteMember
}
