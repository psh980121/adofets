package org.iclass.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.Message;
import org.iclass.dto.usersDto;

import mybatis.SqlSessionBean;


public class usersDao {
	private static usersDao dao = new usersDao();
	private usersDao() {}
	public static usersDao getInstance() {
		return dao;
		}
	
	public int insert(usersDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int id = mapperSession.insert("users.insert", dto);
		mapperSession.commit();
		mapperSession.close();
		return id;	
	}
	
	public usersDto login(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		usersDto dto = mapperSession.selectOne("users.login", map);
		mapperSession.close();
		return dto;
	}
	
	public int selectusersId(String id){
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result =  mapperSession.selectOne("users.selectusersId",id);
		mapperSession.close();
		return result;
	}
	
	public int selectusersNick(String nick){
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result =  mapperSession.selectOne("users.selectusersNick",nick);
		mapperSession.close();
		return result;
	}
	
	public int selectusersPass(String pass){
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result =  mapperSession.selectOne("users.selectusersPass",pass);
		mapperSession.close();
		return result;
	}
	
	//String userid로 수정하기
	public int deleteUserById(String userId) {
		SqlSession mapperSession = SqlSessionBean.getSession();
	    int result = mapperSession.delete("users.deleteUserById", userId);
	    mapperSession.commit();
	    mapperSession.close();
	    return result;
	}
	
	 public int updateUser(usersDto user) {
		 	SqlSession mapperSession = SqlSessionBean.getSession();
		    int result = mapperSession.update("users.updateUser", user);
		    mapperSession.commit();
		    mapperSession.close();
		    return result;
	    }
	 
	    public usersDto selectUserByUSERID(String update) {
	    	SqlSession mapperSession = SqlSessionBean.getSession();	        
	        usersDto result1 = mapperSession.selectOne("users.selectUserByUSERID", update);	        
	        mapperSession.close();
	        return result1;
	    }
	    
        public String selectuserPhone(String id) {
            SqlSession mapperSession = SqlSessionBean.getSession();           
            String result = mapperSession.selectOne("users.selectuserPhone", id);           
            mapperSession.close();
            return result;
         }
          
          public int sendMessage(Message vo) {
      		SqlSession mapper = SqlSessionBean.getSession();
      		int idx = mapper.insert("users.sendMessage",vo);
      		mapper.commit();
      		mapper.close();
      		return idx;
      	}
          
          public List<Message> checkMessage(String userid) {
      		SqlSession mapper = SqlSessionBean.getSession();
      		List<Message> list = mapper.selectList("users.checkMessage", userid);
      		mapper.close();
      		return list;
      	}
          
          public int deleteAdopt(int adoptidx) {
          	SqlSession mapper = SqlSessionBean.getSession();
      		int idx = mapper.insert("users.deleteAdopt", adoptidx);
      		mapper.commit();
      		mapper.close();
      		return idx;
          	
          }
          public int countMessage(String userid) {
        	  SqlSession mapper = SqlSessionBean.getSession();
        		int result = mapper.selectOne("users.countMessage", userid);
        		mapper.close();
        		return result;

        	  
          }
}
