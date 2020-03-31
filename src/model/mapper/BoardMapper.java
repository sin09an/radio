package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Member;

public interface BoardMapper {

	@Select("select ifnull(max(num),0) from board")
	int maxnum();

	@Insert("insert into board"  
	        + "(boardtype, num, genre, title, content, poto, id, date, cnt, " 
			+ " plus, calender, grp, grplevel, grpstep)" 
	        + " values(#{boardtype}, #{num}, #{genre}, #{title}, #{content},"  
	        + " #{poto}, #{id}, now(), 0, 0, 0, #{grp}, #{grplevel}, #{grpstep})") 
	int insert(Board board);

	@Select({"<script>", 
			"select count(*) from board where boardtype = #{boardtype} ",
			"<if test='col1 !=null'> and ${col1} like '%${find}%'</if>",
			"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
			"</script>"})
	int boardCount(Map<String,Object> map);

	 
	@Select({"<script>", 
			"select * from board where boardtype = #{boardtype}",
			"<if test='col1 !=null'> and ${col1} like '%${find}%'</if>",
			"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
			"<choose>",
			"<when test='num != null'> and num =#{num} </when>",
			"<otherwise>",
			" order by grp desc, grpstep asc limit #{start}, #{limit}",
		    "</otherwise>",
		    "</choose>",       
			"</script>"}) 
	List<Board> select(Map<String, Object> map);
	
	@Update("update board "
			+"set cnt = cnt +1 where num =#{num}")
	 void readcntadd(int num);
	
	@Update("update board set grpstep = grpstep + 1"
	    +" where grp=#{grp} and grpstep > #{grpstep}")
	void grpStepAdd(@Param("grp") int grp, @Param("grpstep") int grpstep);
	
	@Update("update board set "
			+ "id=#{id}, title=#{title}, content=#{content}, genre=#{genre}, poto=#{poto}," 
            +" where num=#{num}")
	int update(Board board);
	 
	@Delete("delete  from board where num=#{num}")
	int delete(int num); 

	@Select("select genre, count(*) cnt "
			+ "from board group by genre "
			+ "having count(*) > 1 order by cnt asc")
	List<Map<String, Integer>> graph();

	@Update("update board "
			+"set plus = plus +1 where num =#{num}")
	void plusaddcnt(int num);

	@Select({"<script>", 
		"select * from board where id = #{id} and boardtype = #{boardtype}",
		"<if test='col1 !=null'> and ${col1} like '%${find}%'</if>",
		"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
		"<choose>",
		"<when test='num != null'> and num =#{num} </when>",
		"<otherwise>",   
		" order by grp desc, grpstep asc limit #{start}, #{limit}",
	    "</otherwise>",
	    "</choose>",       
		"</script>"})   
	List<Board> select_my(Map<String, Object> map);
	
	@Select({"<script>", 
		"select count(*) from board  where id = #{id} and boardtype = #{boardtype} ",
		"<if test='col1 !=null'> and ${col1} like '%${find}%'</if>",
		"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
		"</script>"}) 
     int boardCountmy(Map<String,Object> map); 
	
	@Select({"<script>", 
		"select * from board where id = #{id} and boardtype = #{boardtype}",
		"<if test='col1 !=null'> and ${col1} like '%${find}%'</if>",
		"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
		"<choose>",
		"<when test='num != null'> and num =#{num} </when>",
		"<otherwise>",   
		" order by num desc",
	    "</otherwise>",
	    "</choose>",       
		"</script>"})     
	List<Board> info_my(Map<String, Object> map);

   




	
	

} 
