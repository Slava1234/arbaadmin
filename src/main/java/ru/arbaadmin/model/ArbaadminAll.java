package ru.arbaadmin.model;


import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "arbaadmin_all")
public class ArbaadminAll {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "company_name")
    private String company_name;

    @Column(name = "contact_person")
    private String contact_person;

    @Column(name = "phone")
    private String phone;

    @Column(name = "site")
    private String site;

    @Column(name = "request_status")
    private String request_status;

    @Column(name = "bin_iin")
    private String bin_iin;

    @Column(name = "direction_to")
    private String direction_to;

    @Column(name = "direction_from")
    private String direction_from;

    @Column(name = "km ")
    private Integer km ;

    @Column(name = "description_of_cargo")
    private String description_of_cargo;

    @Column(name = "weight")
    private String weight;

    @Column(name = "volume")
    private String volume;

    @Column(name = "date")
    private Date date;

    @Column(name = "driver_full_name")
    private String driver_full_name;

    @Column(name = "gps")
    private Boolean gps;

    @Column(name = "driver_phone")
    private String driver_phone;

    @Column(name = "vehicle_type1")
    private String  brand_of_machine;

    @Column(name = "car_number")
    private String  car_number;

    @Column(name = "cost_of_transportation")
    private Integer cost_of_transportation;

    @Column(name = "currency")
    private String  currency;

    @Column(name = "payment_method")
    private String  payment_method;

    @Column(name = "number_of_cars_in_the_vehicle_fleet")
    private String  number_of_cars_in_the_vehicle_fleet;

    @Column(name = "loading_method")
    private String  loading_method;

    @Column(name = "type_of_transport")
    private String  type_of_transport;

    @Column(name = "calculator")
    private String  calculator;

    @Column(name = "carrier_price")
    private Integer  carrier_price;

    @Column(name = "percentage_of_round_trip")
    private String  percentage_of_round_trip;

    @Column(name = "carrier__or_shipper")
    private String  carrier__or_shipper;


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

    public String getRequest_status() {
        return request_status;
    }

    public void setRequest_status(String request_status) {
        this.request_status = request_status;
    }

    public String getBin_iin() {
        return bin_iin;
    }

    public void setBin_iin(String bin_iin) {
        this.bin_iin = bin_iin;
    }

    public String getDirection_to() {
        return direction_to;
    }

    public void setDirection_to(String direction_to) {
        this.direction_to = direction_to;
    }

    public String getDirection_from() {
        return direction_from;
    }

    public void setDirection_from(String direction_from) {
        this.direction_from = direction_from;
    }

    public Integer getKm() {
        return km;
    }

    public void setKm(Integer km) {
        this.km = km;
    }

    public String getDescription_of_cargo() {
        return description_of_cargo;
    }

    public void setDescription_of_cargo(String description_of_cargo) {
        this.description_of_cargo = description_of_cargo;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDriver_full_name() {
        return driver_full_name;
    }

    public void setDriver_full_name(String driver_full_name) {
        this.driver_full_name = driver_full_name;
    }

    public Boolean getGps() {
        return gps;
    }

    public void setGps(Boolean gps) {
        this.gps = gps;
    }

    public String getDriver_phone() {
        return driver_phone;
    }

    public void setDriver_phone(String driver_phone) {
        this.driver_phone = driver_phone;
    }

    public String getBrand_of_machine() {
        return brand_of_machine;
    }

    public void setBrand_of_machine(String brand_of_machine) {
        this.brand_of_machine = brand_of_machine;
    }

    public String getCar_number() {
        return car_number;
    }

    public void setCar_number(String car_number) {
        this.car_number = car_number;
    }

    public Integer getCost_of_transportation() {
        return cost_of_transportation;
    }

    public void setCost_of_transportation(Integer cost_of_transportation) {
        this.cost_of_transportation = cost_of_transportation;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getNumber_of_cars_in_the_vehicle_fleet() {
        return number_of_cars_in_the_vehicle_fleet;
    }

    public void setNumber_of_cars_in_the_vehicle_fleet(String number_of_cars_in_the_vehicle_fleet) {
        this.number_of_cars_in_the_vehicle_fleet = number_of_cars_in_the_vehicle_fleet;
    }

    public String getLoading_method() {
        return loading_method;
    }

    public void setLoading_method(String loading_method) {
        this.loading_method = loading_method;
    }

    public String getType_of_transport() {
        return type_of_transport;
    }

    public void setType_of_transport(String type_of_transport) {
        this.type_of_transport = type_of_transport;
    }

    public String getCalculator() {
        return calculator;
    }

    public void setCalculator(String calculator) {
        this.calculator = calculator;
    }

    public Integer getCarrier_price() {
        return carrier_price;
    }

    public void setCarrier_price(Integer carrier_price) {
        this.carrier_price = carrier_price;
    }

    public String getPercentage_of_round_trip() {
        return percentage_of_round_trip;
    }

    public void setPercentage_of_round_trip(String percentage_of_round_trip) {
        this.percentage_of_round_trip = percentage_of_round_trip;
    }

    public String getCarrier__or_shipper() {
        return carrier__or_shipper;
    }

    public void setCarrier__or_shipper(String carrier__or_shipper) {
        this.carrier__or_shipper = carrier__or_shipper;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ArbaadminAll that = (ArbaadminAll) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(company_name, that.company_name) &&
                Objects.equals(contact_person, that.contact_person) &&
                Objects.equals(phone, that.phone) &&
                Objects.equals(site, that.site) &&
                Objects.equals(request_status, that.request_status) &&
                Objects.equals(bin_iin, that.bin_iin) &&
                Objects.equals(direction_to, that.direction_to) &&
                Objects.equals(direction_from, that.direction_from) &&
                Objects.equals(km, that.km) &&
                Objects.equals(description_of_cargo, that.description_of_cargo) &&
                Objects.equals(weight, that.weight) &&
                Objects.equals(volume, that.volume) &&
                Objects.equals(date, that.date) &&
                Objects.equals(driver_full_name, that.driver_full_name) &&
                Objects.equals(gps, that.gps) &&
                Objects.equals(driver_phone, that.driver_phone) &&
                Objects.equals(brand_of_machine, that.brand_of_machine) &&
                Objects.equals(car_number, that.car_number) &&
                Objects.equals(cost_of_transportation, that.cost_of_transportation) &&
                Objects.equals(currency, that.currency) &&
                Objects.equals(payment_method, that.payment_method) &&
                Objects.equals(number_of_cars_in_the_vehicle_fleet, that.number_of_cars_in_the_vehicle_fleet) &&
                Objects.equals(loading_method, that.loading_method) &&
                Objects.equals(type_of_transport, that.type_of_transport) &&
                Objects.equals(calculator, that.calculator) &&
                Objects.equals(carrier_price, that.carrier_price) &&
                Objects.equals(percentage_of_round_trip, that.percentage_of_round_trip) &&
                Objects.equals(carrier__or_shipper, that.carrier__or_shipper);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, company_name, contact_person, phone, site, request_status, bin_iin, direction_to, direction_from, km, description_of_cargo, weight, volume, date, driver_full_name, gps, driver_phone, brand_of_machine, car_number, cost_of_transportation, currency, payment_method, number_of_cars_in_the_vehicle_fleet, loading_method, type_of_transport, calculator, carrier_price, percentage_of_round_trip, carrier__or_shipper);
    }

    @Override
    public String toString() {
        return "ArbaadminAll{" +
                "id=" + id +
                ", company_name='" + company_name + '\'' +
                ", contact_person='" + contact_person + '\'' +
                ", phone='" + phone + '\'' +
                ", site='" + site + '\'' +
                ", request_status='" + request_status + '\'' +
                ", bin_iin='" + bin_iin + '\'' +
                ", direction_to='" + direction_to + '\'' +
                ", direction_from='" + direction_from + '\'' +
                ", km=" + km +
                ", description_of_cargo='" + description_of_cargo + '\'' +
                ", weight='" + weight + '\'' +
                ", volume='" + volume + '\'' +
                ", date=" + date +
                ", driver_full_name='" + driver_full_name + '\'' +
                ", gps=" + gps +
                ", driver_phone='" + driver_phone + '\'' +
                ", brand_of_machine='" + brand_of_machine + '\'' +
                ", car_number='" + car_number + '\'' +
                ", cost_of_transportation=" + cost_of_transportation +
                ", currency='" + currency + '\'' +
                ", payment_method='" + payment_method + '\'' +
                ", number_of_cars_in_the_vehicle_fleet='" + number_of_cars_in_the_vehicle_fleet + '\'' +
                ", loading_method='" + loading_method + '\'' +
                ", type_of_transport='" + type_of_transport + '\'' +
                ", calculator='" + calculator + '\'' +
                ", carrier_price=" + carrier_price +
                ", percentage_of_round_trip='" + percentage_of_round_trip + '\'' +
                ", carrier__or_shipper='" + carrier__or_shipper + '\'' +
                '}';
    }
}
