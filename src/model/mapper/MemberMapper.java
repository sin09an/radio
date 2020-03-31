package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
    @Select({"<script>",
    	     "select * from member ",
    	     "<if test = 'id != null'> where binary id=#{id}</if>",
    	     "</script>"}) 
	List<Member> select(Map<String, Object> map);

	@Insert("insert into member" 
            + "(id,pass,name,nicname,email,tel,picture)"
		    + "values(#{id}, #{pass}, #{name}, #{nicname}, #{email}, #{tel}, #{picture})")
    int insert(Member m);

	@Update("update member set name=#{name}, nicname=#{nicname},"      
	         + "email=#{email}, tel=#{tel}, picture=#{picture} where id=#{id}")
	int update(Member m);     

	@Delete("delete from member where id=#{id}")
	int delete(String id);
	
	@Update("update member set pass = #{pass} where id = #{id}")
	int updatePass(@Param("id") String id, @Param("pass") String pass);
 
	@Select("select id from member where name=#{name} and email = #{email} and tel=#{tel}")
	String idfind(@Param("name") String name,@Param("tel") String tel, @Param("email") String email);
 
	@Select("select pass from member where id=#{id} and tel=#{tel}")
	String pwfind(@Param("id") String id, @Param("tel") String tel);
	
}
