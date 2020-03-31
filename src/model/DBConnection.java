package model;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class DBConnection {
	private  static SqlSessionFactory sqlMap;//�����̳� ��ü �Ҵ�
	static {
		//mybatis-config.xml ������ ��ġ
		String resource = "model/mapper/mybatis-config.xml";//Ŭ�������ƴϰ� �����̱⶧���� ������ ��ġ�� �i�ư���("/" .�� �ƴ� ���ϸ����� ���� ����)
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);//���ҽ� �о ������
		}catch (IOException e) {
			e.printStackTrace();
		}
		//build :Connection ��ü ����.
		//       SQL ������ �����ϴ� �����̳� ����
		sqlMap = new SqlSessionFactoryBuilder().build(reader);
	}
	static SqlSession getConnection() {//���������ڰ� ���� ������ static �ܺ� ���� X model ��Ű�������� ��� �����ϴ�
		return sqlMap.openSession(); // �����ϰ� �Ǹ� ����  ������ ���̽��� ����
	}
	static void close(SqlSession session) {
		session.commit();
		session.close();
	} 
}