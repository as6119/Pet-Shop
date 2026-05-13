package dao;

import java.util.ArrayList;
import dto.Member;

public class MemberRepository {
    private ArrayList<Member> members = new ArrayList<Member>();
    private static MemberRepository instance = new MemberRepository();

    public static MemberRepository getInstance() {
        return instance;
    }

    private MemberRepository() {
    // 기본 회원 하나 정도 테스트용으로 넣어둘 수 있습니다.
    	Member admin = new Member();
        admin.setId("admin");
        admin.setPassword("1234");
        admin.setName("commander");
        members.add(admin);
    }

    public void addMember(Member member) {
        members.add(member);
    }
    
    public ArrayList<Member> getAllMembers() {
        return members;
    }
}