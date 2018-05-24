package ru.arbaadmin.model;


import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "arbaadmin_order")
public class Order {


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "request_status")
    private String request_status;

    @Column(name = "direction_to")
    private String direction_to;


    @Column(name = "direction_from")
    private String direction_from;

    @Column(name = "km ")
    private String km;

    @Column(name = "description_of_cargo")
    private String description_of_cargo;


    @Column(name = "weight")
    private String weight;

    @Column(name = "volume")
    private String volume;


    @Column(name = "departure_date")
    private String departure_date;

    @Column(name = "delivery_date")
    private String delivery_date;

    @Column(name = "driver_full_name")
    private String driver_full_name;


    @Column(name = "gps")
    private String gps;


    @Column(name = "driver_phone")
    private String driver_phone;

    @Column(name = "vehicle_type1")
    private String brand_of_machine;


    @Column(name = "car_number")
    private String car_number;

    @Column(name = "cost_of_transportation")
    private String cost_of_transportation;

    @Column(name = "currency")
    private String currency;

    @Column(name = "payment_method")
    private String payment_method;

    @Column(name = "number_of_requested_cars")
    private String number_of_requested_cars;

    @Column(name = "loading_method")
    private String loading_method;

    @Column(name = "type_of_transport")
    private String type_of_transport;


    @Column(name = "calculator")
    private String calculator;

    @Column(name = "carrier_price")
    private String carrier_price;

    @Column(name = "percentage_of_round_trip")
    private String percentage_of_round_trip;

    @Column(name = "company_id", insertable = false, updatable = false)
    private Integer company_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "company_id")
    private Company companies;


    // Methods



    public Company getCompanies() {
        return this.companies;
    }


    public Integer getCompany_id() {
        return company_id;
    }

    public void setCompany_id(Integer company_id) {
        this.company_id = company_id;
    }

    public void setCompanies(Company companies) {
        this.companies = companies;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRequest_status() {
        return request_status;
    }

    public void setRequest_status(String request_status) {
        this.request_status = request_status;
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

    public String getKm() {
        return km;
    }

    public void setKm(String km) {
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

    public String getDeparture_date() {
        return departure_date;
    }

    public void setDeparture_date(String departure_date) {
        this.departure_date = departure_date;
    }

    public String getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) {
        this.delivery_date = delivery_date;
    }

    public String getDriver_full_name() {
        return driver_full_name;
    }

    public void setDriver_full_name(String driver_full_name) {
        this.driver_full_name = driver_full_name;
    }

    public String getGps() {
        return gps;
    }

    public void setGps(String gps) {
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

    public String getCost_of_transportation() {
        return cost_of_transportation;
    }

    public void setCost_of_transportation(String cost_of_transportation) {
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

    public String getNumber_of_requested_cars() {
        return number_of_requested_cars;
    }

    public void setNumber_of_requested_cars(String number_of_requested_cars) {
        this.number_of_requested_cars = number_of_requested_cars;
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

    public String getCarrier_price() {
        return carrier_price;
    }

    public void setCarrier_price(String carrier_price) {
        this.carrier_price = carrier_price;
    }

    public String getPercentage_of_round_trip() {
        return percentage_of_round_trip;
    }

    public void setPercentage_of_round_trip(String percentage_of_round_trip) {
        this.percentage_of_round_trip = percentage_of_round_trip;
    }


}
