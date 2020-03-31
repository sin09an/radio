package model;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class DBConnection {
	private  static SqlSessionFactory sqlMap;//컨테이너 객체 할당
	static {
		//mybatis-config.xml 파일의 위치
		String resource = "model/mapper/mybatis-config.xml";//클래스가아니고 파일이기때문에 파일의 위치를 쫒아가야("/" .이 아님 파일명으로 접근 가능)
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);//리소스 읽어서 가져옴
		}catch (IOException e) {
			e.printStackTrace();
		}
		//build :Connection 객체 설정.
		//       SQL 구문을 저장하는 컨테이너 설정
		sqlMap = new SqlSessionFactoryBuilder().build(reader);
	}
	static SqlSession getConnection() {//접근제어자가 없기 때문에 static 외부 접근 X model 패키지에서만 사용 가능하다
		return sqlMap.openSession(); // 성공하게 되면 실제  데이터 베이스와 연결
	}
	static void close(SqlSession session) {
		session.commit();
		session.close();
	} 
}