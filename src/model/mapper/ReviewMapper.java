package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Review;

public interface ReviewMapper {
	@Insert("insert into review" 
            + "(id, req, num, content, boardtype) "
		    + " values(#{id}, #{req}, #{num}, #{content}, #{boardtype})")
    int insert(Review r); 

	@Select("select ifnull(max(req),0) from review")
	int maxreq();

	@Select({"<script>", 
		"select * from review where boardtype = #{boardtype}",
		"<if test='boardnum != null'> and num =#{boardnum}</if>",
		"<choose>",  
		"<when test='req != null'> and req =#{req} </when>",
		"<otherwise>", 
		" order by req desc limit #{start}, #{limit}", 
	    "</otherwise>", 
	    "</choose>",        
		"</script>"}) 
	List<Review> select(Map<String, Object> map);

	@Select({"<script>", 
		"select count(*) from review where num = #{boardnum} ",
		"</script>"})
	int reqCount(Map<String, Object> map); 
}
 