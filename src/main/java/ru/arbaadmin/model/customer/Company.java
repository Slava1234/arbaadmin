package ru.arbaadmin.model.customer;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "arbaadmin_customer_company")
public class Company {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "company_name")
    private String company_name;

    @Column(name = "company_city")
    private String company_city;

    @Column(name = "company_address")
    private String company_address;

    @Column(name = "contact_person")
    private String contact_person;

    @Column(name = "phone")
    private String phone;

    @Column(name = "site")
    private String site;

    @Column(name = "bin_iin")
    private String bin_iin;


    @OneToMany(mappedBy = "companies", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Order> orders = new ArrayList<>();


    // Methods


    public List<Order> getOrders() {
        return this.orders;
    }

    public void setToNullOrders() {
        this.orders = null;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_city() {
        return company_city;
    }

    public void setCompany_city(String company_city) {
        this.company_city = company_city;
    }

    public String getCompany_address() {
        return company_address;
    }

    public void setCompany_address(String company_address) {
        this.company_address = company_address;
    }

    public String getContact_person() {
        return contact_person;
    }

    public void setContact_person(String contact_person) {
        this.contact_person = contact_person;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getBin_iin() {
        return bin_iin;
    }

    public void setBin_iin(String bin_iin) {
        this.bin_iin = bin_iin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Company company = (Company) o;
        return Objects.equals(id, company.id) &&
                Objects.equals(company_name, company.company_name) &&
                Objects.equals(company_city, company.company_city) &&
                Objects.equals(company_address, company.company_address) &&
                Objects.equals(contact_person, company.contact_person) &&
                Objects.equals(phone, company.phone) &&
                Objects.equals(site, company.site) &&
                Objects.equals(bin_iin, company.bin_iin);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, company_name, company_city, company_address, contact_person, phone, site, bin_iin);
    }

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", company_name='" + company_name + '\'' +
                ", company_city='" + company_city + '\'' +
                ", company_address='" + company_address + '\'' +
                ", contact_person='" + contact_person + '\'' +
                ", phone='" + phone + '\'' +
                ", site='" + site + '\'' +
                ", bin_iin='" + bin_iin + '\'' +
                '}';
    }
}
