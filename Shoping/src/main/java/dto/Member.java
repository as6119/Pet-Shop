package dto;

import java.io.Serializable;

public class Member implements Serializable {
    private static final long serialVersionUID = 1L;

    // 1. 필드(변수) 선언
    private String id;
    private String password;
    private String name;
    private String mail;
    private String phone;

    // 2. 기본 생성자
    public Member() {
        super();
    }

    // 3. Getter & Setter (대소문자 규칙 준수: getId)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}