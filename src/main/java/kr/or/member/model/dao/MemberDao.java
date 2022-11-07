package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.ChatRecord;
import kr.or.member.model.vo.Delivery;
import kr.or.member.model.vo.Member;
import oracle.net.aso.d;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> getAllMembers(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.allMembmerList",map);
		return (ArrayList<Member>)list;
	}

	public int selectMembersCnt() {
		int totalCount = sqlSession.selectOne("member.totalCount");
		return totalCount;
	}

	public int changeLevel(Member m) {
		int result = sqlSession.update("member.changeLevel",m);
		return result;
	}
	// 로그인
	public Member loginCheck(Member m) {
		Member member = sqlSession.selectOne("member.selectLogin",m);
		return member;
	}
	
	//마이페이지 가기
	public Member selectOneMember(Member m1) {
		System.out.println("m1:"+m1);
		Member member = sqlSession.selectOne("member.selectOneMember",m1);
		System.out.println("member:"+member);
		return member;
	}

	public int updateMember(Member member) {
		int result = sqlSession.update("member.updateMember",member);
		return result;
	}

	public int insertMember(Member m) {
		System.out.println("dao m:"+m);
		int result = sqlSession.insert("member.insertMember",m);
		System.out.println("dao result:"+result);
		return result;
	}

	public int changePw(Member m) {
		int result = sqlSession.update("member.changePw",m);
		return result;
	}


	public ArrayList<Member> getAllAdmin() {
		List list = sqlSession.selectList("member.getAllAdmin");
		return (ArrayList<Member>)list;
	}
	
	public int updatePw(Member member) {
		int result = sqlSession.update("member.updatePw",member);
		return result;
	}

	public int insertAddr(Delivery delivery) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("delivery.insertAddr",delivery);
		return result;
	}

	public int updateAddr(Delivery delivery) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("delivery.updateAddr",delivery);
		return result;
	}

	public ArrayList<Delivery> selectAllDelivery(Member m) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("delivery.selectAllDelivery",m);
		return (ArrayList<Delivery>)list;
	}

	public int deleteAddr(Integer deliveryNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("delivery.deleteAddr",deliveryNo);
		return result;
	}

	public Delivery selectOneDelivery(Integer deliveryNo) {
		// TODO Auto-generated method stub
		Delivery d = sqlSession.selectOne("delivery.selectOneDelivery",deliveryNo);
		return d;
	}

	public int updateAddr(Integer deliveryNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("delivery.updateOneAddr",deliveryNo);
		return result;
	}


	
}
