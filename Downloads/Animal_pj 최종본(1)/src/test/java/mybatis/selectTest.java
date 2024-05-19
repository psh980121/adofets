package mybatis;

import static org.junit.jupiter.api.Assertions.*;

import org.iclass.dao.usersDao;

import org.junit.jupiter.api.Test;

class selectTest {

	@Test
	void selectAllId() {
		usersDao dao = usersDao.getInstance();
		System.out.println(dao.selectusersId("admin1"));
	}

}
