package org.iclass.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.commentDto;
import mybatis.SqlSessionBean;

public class commentDao {
    private static commentDao dao = new commentDao();

    private commentDao() {
    }

    public static commentDao getInstance() {
        return dao;
    }

    public int insert(commentDto dto) {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.insert("comment.insert", dto);
        mapper.commit();
        mapper.close();
        return result;
    }

    public int delete(int idx) {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.delete("comment.delete", idx);
        mapper.commit();
        mapper.close();
        return result;
    }

    public int maxOf() {
        SqlSession mapper = SqlSessionBean.getSession();
        int result = mapper.selectOne("comment.maxOf");
        mapper.close();
        return result;
    }

    public List<commentDto> commentsList(int idx) {
        SqlSession mapper = SqlSessionBean.getSession();
        List<commentDto> list = mapper.selectList("comment.commentsList", idx);
        mapper.close();
        return list;
    }

    public int setCommentCount(int idx) {
        SqlSession session = SqlSessionBean.getSession();
        int result = session.update("comment.setCommentCount", idx);
        session.commit();
        session.close();
        return result;
    }
}
