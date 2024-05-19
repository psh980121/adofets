package mybatis;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dao.usersDao;
import org.iclass.dto.usersDto;
import org.junit.jupiter.api.Test;

class loginTest {

	@Test
	void connect() {
		SqlSession sqlsession = SqlSessionBean.getSession();
		assertNotNull(sqlsession);
		
	}
	
	@Test
	void write() {
	 	usersDao dao = usersDao.getInstance();
	 	usersDto dto = usersDto.builder()
	 			.userid("아이디")
	 			.userpass("아이디")
	 			.username("아이디")
	 			.usernick("아이디")
	 			.useremail("아이디")
	 			.userphone("아이디")
	 			.usercate("아이디")
	 			.usercity("아이디")
	 			.userage(22)
	 			.build();
	 	
	 	int result = dao.insert(dto);

	}

}
