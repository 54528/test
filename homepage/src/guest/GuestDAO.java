package guest;

import java.awt.print.PrinterAbortException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class GuestDAO {
	
	public GuestDTO read(int num){
		GuestDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from guest  ");
		sql.append(" where num = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
            rs = pstmt.executeQuery();
            
            if(rs.next()){
            	dto = new GuestDTO();
            	dto.setNum(rs.getInt("num"));
            	dto.setId(rs.getString("id"));
            	dto.setTitle(rs.getString("title"));
            	dto.setContent(rs.getString("content"));
            	dto.setFname(rs.getString("fname"));
            }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}
	
	public boolean updateFile(Map map){
		boolean flag= false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		String num = (String)map.get("num");
		String fname = (String)map.get("fname");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guest  ");
		sql.append(" set fname= ?  ");
		sql.append(" where num= ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, num);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}	
		return flag;
	}
	
	public boolean create(GuestDTO dto){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guest(num, id, title, content, gdate, fname) ");
		sql.append(" values((select nvl(max(num),0)+1 from guest), ?, ?, ?, sysdate, ?)  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	
	
	public List<GuestDTO> list(Map map){
		List<GuestDTO> list = new ArrayList<GuestDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select num,id, fname, title, content, gdate, r ");
		sql.append(" from ( ");
		sql.append(" 	select num,id, fname, title, content, gdate, rownum r ");
		sql.append(" 	from ( ");
		sql.append(" 			select num,id, fname, title, content, gdate ");
		sql.append(" 			from guest ");
		if(word.trim().length()>0)
			sql.append("		 where "+col+" like '%'||?||'%'  ");
		sql.append(" 			 order by gdate desc  ");
		sql.append("          )  ");
		sql.append("     )  ");
		sql.append(" where r>=? and r<= ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 1;
			if(word.trim().length()>0)
				pstmt.setString(i++, word);
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				GuestDTO dto = new GuestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setFname(rs.getString("fname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setGdate(rs.getString("gdate"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return list;	
	}
	
	
	public boolean update(GuestDTO dto){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update guest  ");
		sql.append(" set title= ?,  ");
		sql.append(" id= ?,  ");
		sql.append(" content=?  ");
		sql.append(" where num = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());
			
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		return flag;
		
	}
	
	public boolean delete(int num){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from guest where num = ? ");
	    
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public int total(Map map){
		int total=0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from guest  ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
			
			try {
				pstmt = con.prepareStatement(sql.toString());
				if(word.trim().length()>0)
					pstmt.setString(1, word);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					total = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBClose.close(con, pstmt, rs);
				}	
		return total;
}
	
	public String getFname(int num){
		String fname = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname from guest where num = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				fname = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return fname;
	}
	
}
