package org.iclass.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.ProductDto;
import org.iclass.dto.buyCartDto;
import org.iclass.dto.productsSalesDto;

import mybatis.SqlSessionBean;

// 추가, 수정, 등록
public class ProductDao {
	
	private static ProductDao dao = new ProductDao();
	private ProductDao() {}
	public static ProductDao getProductDao() {
		return dao;
	}
	
	public List<ProductDto> getProducts(){
		SqlSession mapper = SqlSessionBean.getSession();
		
		List<ProductDto> list = mapper.selectList("products.getProducts");
		
		mapper.close();
		return list;
	}
	
	public int insert(ProductDto dto) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		int result = mapper.insert("products.insert", dto);
		
		mapper.commit();	// commit 필수.
		mapper.close();
		return result;
	}
	
	// 동일한 상품명이 여러 개이면 오류 생깁니다.
	public ProductDto getByPdtcode(int pdtcode) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		ProductDto dto = mapper.selectOne("products.getByPdtcode", pdtcode);
		
		mapper.close();
		return dto;
	}
	
	public ProductDto getByPdtcate(String pdtcate) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		ProductDto dto = mapper.selectOne("products.getByPdtcate", pdtcate);
		
		mapper.close();
		return dto;
	}
	
	public List<ProductDto> getByPdttype(String pdttype) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		List<ProductDto> dto = mapper.selectList("products.getByPdttype", pdttype);
		
		mapper.close();
		return dto;
	}
	
	public buyCartDto getCart(int pdtcode) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		buyCartDto dto = mapper.selectOne("products.getCart", pdtcode);
		
		mapper.close();
		return dto;
	}
	
	public int update(ProductDto dto){
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("products.update", dto);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public int delete(int pdtcode) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("products.delete",pdtcode);
		
		mapper.commit();
		mapper.close();
		return result;
	}
	
	public List<productsSalesDto> Sales() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<productsSalesDto> list = mapper.selectList("products.selectSales");
		mapper.close();
		return list;
	}
}














