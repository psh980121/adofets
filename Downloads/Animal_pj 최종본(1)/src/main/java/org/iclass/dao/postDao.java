package org.iclass.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.postDto;
import mybatis.SqlSessionBean;

public class postDao {
    private static postDao dao = new postDao();

    private postDao() {
    }

    public static postDao getInstance() {
        return dao;
    }

    public List<postDto> list(Map<String, Object> map) {
        SqlSession mapper = SqlSessionBean.getSession();
        List<postDto> list = mapper.selectList("post.list",map);
        mapper.close();
        return list;
    }

    public List<postDto> pagelist(Map<String, Integer> map) {
        SqlSession mapper = SqlSessionBean.getSession();
        List<postDto> list = mapper.selectList("post.pagelist", map);
        mapper.close();
        return list;
    }

    public int count() {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.selectOne("post.count");
        mapper.close();
        return result;
    }

    public postDto selectByIdx(long idx) {
        SqlSession mapper = SqlSessionBean.getSession();
        postDto vo = mapper.selectOne("post.selectByIdx", idx);
        mapper.close();
        return vo;
    }

    public int setReadCount(long idx) {
        SqlSession session = SqlSessionBean.getSession();
        int result = session.update("post.setReadCount", idx);
        session.commit();
        session.close();
        return result;
    }

    public int update(postDto vo) {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.update("post.update", vo);
        mapper.commit();
        mapper.close();
        return result;
    }

    public int delete(long idx) {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.delete("post.delete", idx);
        mapper.commit();
        mapper.close();
        return result;
    }

    public int insert(postDto vo) {
        SqlSession mapper = SqlSessionBean.getSession();
        mapper.insert("post.insert", vo);
        mapper.commit();
        mapper.close();
        return vo.getPostidx();
    }
    public List<postDto> pagelistByCategory(Map<String, Object> map) {
        SqlSession mapper = SqlSessionBean.getSession();
        List<postDto> list = mapper.selectList("post.pagelistByCategory", map);
        mapper.close();
        return list;
    }

    public int countByCategory(String category) {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.selectOne("post.countByCategory", category);
        mapper.close();
        return result;
    }
}
