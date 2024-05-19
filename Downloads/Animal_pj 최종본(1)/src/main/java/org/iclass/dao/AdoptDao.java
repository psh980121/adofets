package org.iclass.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.iclass.dto.AdoptDto;

import mybatis.SqlSessionBean;

public class AdoptDao {
    
	private static AdoptDao dao = new AdoptDao();
	private AdoptDao() {}	
	public static AdoptDao getInstance() {
		return dao;
	}
	
	 //리뷰작성
    public AdoptDto selectAdoptByAdoptIdx(int adoptIdx) {
    	SqlSession mapperSession = SqlSessionBean.getSession();
        return mapperSession.selectOne("Adopt.selectAdoptByAdoptIdx", adoptIdx);
    }


	//분양내역
	 public List<AdoptDto> selectAdoptByUSERID(String adopt) {
		 SqlSession mapperSession = SqlSessionBean.getSession();
	        List<AdoptDto> result = mapperSession.selectList("Adopt.selectAdoptByUSERID", adopt);
	        mapperSession.close();
	        return result;
	    }
	
}
