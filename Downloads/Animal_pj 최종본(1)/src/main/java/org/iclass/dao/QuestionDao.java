package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.QuestionDto;

import mybatis.SqlSessionBean;



public class QuestionDao {
	
	private static QuestionDao dao = new QuestionDao();
	private QuestionDao() {}
	public static QuestionDao getInstance() {
		return dao;
	}
	
	public int insert(QuestionDto vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int idx = mapper.insert("question.insert",vo);
		mapper.commit();
		mapper.close();
		return idx;
	}
	public int delete(long idx) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("question.delete",idx);
		mapper.commit();
		mapper.close();
		return result;
	}

	public List<QuestionDto> getAllQuestions() {//문의목록조회
	    SqlSession sqlSession = SqlSessionBean.getSession();
	    List<QuestionDto> questions = sqlSession.selectList("question.selectAll");
	    sqlSession.close();
	    return questions;
	}
	
	public List<QuestionDto> selectAllbyId(String id) {//문의목록조회
	    SqlSession sqlSession = SqlSessionBean.getSession();
	    List<QuestionDto> question = sqlSession.selectList("question.selectAllByID",id);
	    sqlSession.close();
        return question;
    }
	
	public List<QuestionDto> selectProcessAd(String process) {//문의목록조회
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<QuestionDto> question = sqlSession.selectList("question.selectProcessAd",process);
		sqlSession.close();
		return question;
	}
	
	public QuestionDto selectByQsID(int id) {
		 SqlSession sqlSession = SqlSessionBean.getSession();
		 QuestionDto qs = sqlSession.selectOne("question.selectByQsId",id);
		 sqlSession.close();
		 return qs;
	}
	
	public int Update(QuestionDto dto) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.update("question.update",dto);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public QuestionDto selectDetail(int id) {//문의내용상세조
	    SqlSession sqlSession = SqlSessionBean.getSession();
	    QuestionDto question = sqlSession.selectOne("question.selectByQsId",id);
	    sqlSession.close();
        return question;
    }
	
	public List<QuestionDto> selectProcess(Map<String,String> map) {//사용자페이지문의상태에따라보여주
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<QuestionDto> question = sqlSession.selectList("question.selectProcess",map);
		sqlSession.close();
		return question;
	}
	
	//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
		public List<QuestionDto> pagelist(Map<String,Integer> map) {
			SqlSession mapper = SqlSessionBean.getSession();
			List<QuestionDto> list = mapper.selectList("question.pagelist",map);
			mapper.close();
			return list;
		}
		//전체, 처리중, 답변 완료 동일하게 검색과 페이징 
		public List<QuestionDto> processList(Map<String,Object> map) {
			SqlSession mapper = SqlSessionBean.getSession();
			List<QuestionDto> list = mapper.selectList("question.processList",map);
			mapper.close();
			return list;
		}

		//전체 글 갯수 전체, 처리중, 답변 완료 동일하게 구하기 
		public int count(Map<String,Object> map) {
				SqlSession mapper = SqlSessionBean.getSession();
				int result = mapper.selectOne("question.count",map);
				mapper.close();
				return result;
		}
		}

	  
	

