package org.iclass.dao;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.shelterDto;

import mybatis.SqlSessionBean;

public class shelterDao {
	private static shelterDao dao = new shelterDao();
	private shelterDao() {}
	public static shelterDao getInstance() {
		return dao;
		}
	
	public int insert(shelterDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int id = mapperSession.insert("shelter.insert", dto);
		mapperSession.commit();
		mapperSession.close();
		return id;	
	}
}
