package org.iclass.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.buyDto;

import mybatis.SqlSessionBean;

public class buyDao {
    
	private static buyDao dao = new buyDao();
	private buyDao() {}
	public static buyDao getInstance() {
		return dao;
	}
	
	
	 
	//구매내역 조회
	public List<buyDto> selectBuyByUSERID(String buy) {
		SqlSession mapperSession = SqlSessionBean.getSession();
        List<buyDto> result = mapperSession.selectList("Buy.selectBuyByUSERID", buy);
        mapperSession.close();
        return result;
    }
	
	//장바구니 구매
	public int insertBuy(buyDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("Buy.insertBuy", dto);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

}