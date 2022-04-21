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

	public static MemberDBBean getInstance() {//���� �Է¹޴� �޼ҵ�
		return instance; //getInstance()�� ȣ���ϸ� MemberDBBean�� ��ü�� ����
	}
	public Connection getConnection() throws Exception{
		//���� �۾��� ����� Connection��ü �����ϴ� �޼ҵ�
		//���� ���� ���� -> ������ ����ϱ� ���ؼ�
		
		Context ctx = new InitialContext();  //DBCP�� ����ϱ� ���ؼ�
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();	
	}
	public int insertMember(MemberBean Member) throws Exception{ //�����͸� �����ϱ� ���� �޼ҵ�
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into STMEMBERS values(STUDY_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)";
		//PreparedStatment�� ����߱� ������ ?�� ���� �޾Ƽ� ����
		int re = -1; //re -> ȸ�������̸� 1�ƴϸ� -1�� ��Ÿ��
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql); //prepareStatmenet ���
			pstmt.setString(1, Member.getMem_id()); //get���� ���� �Ķ���ͷ� ����
			pstmt.setString(2, Member.getMem_pw());
			pstmt.setString(3, Member.getMem_name());
			pstmt.setString(4, Member.getMem_jumin());
			pstmt.setString(5, Member.getMem_tel());
			pstmt.setString(6, Member.getMem_email());
			pstmt.setString(7, Member.getMem_interests());
			pstmt.setString(8, Member.getMem_introduce());
			pstmt.setInt(9, Member.getMem_report());
			
			pstmt.executeUpdate(); //�Ķ���͸� �� �ְ� insert���� ����
			re = 1; //����� ������� ������ catch�� ����Ǹ鼭 re�� -1�� ��
			
			pstmt.close();
			con.close();
			System.out.println("�߰� ����");
		}catch(Exception e) {
			System.out.println("�߰� ����");
			e.printStackTrace();
		}
		return re;
	}
	
	public int confirmID(String id) throws Exception{ //���̵� �ߺ�Ȯ���� ���� �޼ҵ�
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select mem_id from stmembers where mem_id=?";
		//�Ķ���Ͱ��� ?�� ����
		int re= -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //sql�� �����
		
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
	
	//�α��� �� ��, ���̵� �����ϴ��� Ȯ�� ���� �޼ҵ�
	public int userCheck(String id, String pw) throws Exception {
		int re = -1;
		String sql = "select mem_pw from stmembers where mem_id=?";
			try {
				Connection con = getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) { //���̵� ��ġ�ϴ� �ο� ����
					String db_mem_pw = rs.getString("mem_pw");
					if (db_mem_pw.equals(pw)) { //�н����� ��ġ
						re = 1;
					}else { //�н����� ����ġ
						re = 0;
					}
				}else { //���̵� �������� ����
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

	//���̵� ��ġ�ϴ� ����� ������ ������ �޼ҵ�
	public MemberBean getMember(String id) throws Exception {
		String sql = "select * from stmembers where mem_id=?";
		MemberBean member = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) { //���̵� ��ġ�ϴ� �ο� ����
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
			
			System.out.println("���� ����");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���� ����");
		}
		
		return re;
	}
	
	public MemberBean getUserInfo(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean member = null;
 
        try {
            // ����
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM STMEMBERS WHERE MEM_ID=?");
 
            conn = getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) {   // ȸ�������� DTO�� ��´�.
               
                
                // �ڹٺ� ������ ��´�.
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
            // Connection, PreparedStatement�� �ݴ´�.
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
 
        String dbpw = ""; // DB���� ��й�ȣ�� ��Ƶ� ����
        int x = -1;
 
        try {
            // ��й�ȣ ��ȸ
            StringBuffer query1 = new StringBuffer();
            query1.append("SELECT MEM_PW FROM STMEMBERS WHERE MEM_ID=?");
 
            // ȸ�� ����
            StringBuffer query2 = new StringBuffer();
            query2.append("DELETE FROM STMEMBERS WHERE MEM_ID=?");
 
            conn = getConnection();
 
            // �ڵ� Ŀ���� false�� �Ѵ�.
            conn.setAutoCommit(false);
            
            // 1. ���̵� �ش��ϴ� ��й�ȣ�� ��ȸ�Ѵ�.
            pstmt = conn.prepareStatement(query1.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) 
            {
                dbpw = rs.getString("mem_pw");
                if (dbpw.equals(pw)) { // �Էµ� ��й�ȣ�� DB��� ��
                	
                    // ������� ȸ������ ����
                    pstmt = conn.prepareStatement(query2.toString());
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    conn.commit(); 
                    x = 1; // ���� ����
                } else {
                    x = 0; // ��й�ȣ �񱳰�� - �ٸ�
                }
            }
 
            return x;
 
        } catch (Exception sqle) {
            try {
                conn.rollback(); // ������ �ѹ�
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
