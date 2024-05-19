package org.iclass.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.AdoptDto;
import org.iclass.dto.Animal;

import mybatis.SqlSessionBean;


public class animalDao {
	private static animalDao dao = new animalDao();
	private animalDao() {}
	public static animalDao getInstance() {
		return dao;
	}
	
	public int insert(Animal vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("animal.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
	public List<Animal> selectAll() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<Animal> list = mapper.selectList("animal.selectAll");
		mapper.close();
		return list;
	}
	
	public int insertMeeting(AdoptDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("animal.insertMeeting",vo);
		mapper.commit();
		mapper.close();
		return idx;
}
	
	public List<AdoptDto> infoAdopt() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<AdoptDto> list = mapper.selectList("animal.infoAdopt");
		mapper.close();
		return list;
	}
}