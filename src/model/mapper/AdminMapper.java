package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Admin;
import model.Board;


public interface AdminMapper {
	
	@Insert("insert into admin"  
	        + "(num, calender, todayti)" 
	        + " values(#{num}, #{calender}, #{todayti})") 
	int insert(Admin admin); 
	
	@Select({"<script>", 
		"select * from admin",
		"<if test='boardnum1 != null'> and num =#{boardnum1}</if>",
		"<choose>",  
		"<otherwise>", 
		" order by calender desc limit #{start}, #{limit}", 
	    "</otherwise>", 
	    "</choose>",           
		"</script>"}) 
	List<Admin> select(Map<String, Object> map);

	@Select("select ifnull(max(num),0) from admin")
	int maxnum();

	@Select({"<script>", 
		"select todayti from admin",
		"<if test='calender != null'> "
		+ "where calender =#{calender}"
		+ "</if>",
		"<if test='start != null'> ",
		" order by num desc limit #{start}, #{limit}", 
		"</if>",
	"</script>"}) 
	String select_todayti(Map<String, Object> map); 
	
	@Select({"<script>", 
		"select * from admin",
		"<if test='col1 !=null'> where ${col1} like '%${find}%'</if>",
		"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
		"<choose>",
		"<when test='num != null'> and num =#{num} </when>",
		"<otherwise>",
		" order by grp desc, grpstep asc limit #{start}, #{limit}",
	    "</otherwise>",
	    "</choose>",       
		"</script>"}) 
	List<Admin> select_cal(Map<String, Object> map);
	
	@Select({"<script>", 
		"select count(*) from admin ",
		"<if test='col1 !=null'> where ${col1} like '%${find}%'</if>",
		"<if test='col2 !=null'> OR ${col2} like '%${find}%'</if>",
		"</script>"})
int adminCount(Map<String,Object> map);
	
}
