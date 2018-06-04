package ru.arbaadmin.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.arbaadmin.dao.customer.CustomerCompanyDao;
import ru.arbaadmin.dao.customer.CustomerOrderDao;
import ru.arbaadmin.model.customer.CustomerCompany;
import ru.arbaadmin.model.customer.CustomerOrder;

import java.util.List;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {


    private CustomerCompanyDao companyServiceImpl;
    private CustomerOrderDao orderServiceImpl;

    @Autowired(required = true)
    @Qualifier(value = "customerCompanyServiceImpl")
    public void setCompanyService(CustomerCompanyDao companyServiceImpl) {
        this.companyServiceImpl = companyServiceImpl;
    }

    @Autowired(required = true)
    @Qualifier(value = "customerOrderServiceImpl")
    public void setOrderService(CustomerOrderDao orderServiceImpl) {
        this.orderServiceImpl = orderServiceImpl;
    }





    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView company() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("arbaadmin/customer/index");
        List<CustomerCompany> companies = this.companyServiceImpl.listCompany();
        modelAndView.addObject("companies", companies);
        return modelAndView;
    }


    @RequestMapping(value = "/company/{id}", method = RequestMethod.GET)
    public ModelAndView companyOrders(@PathVariable("id") int id) {
        List<CustomerOrder> orders = this.orderServiceImpl.listOrderById(id);
        CustomerCompany company = this.companyServiceImpl.getCompanyById(id);
        List<CustomerCompany> companies = this.companyServiceImpl.listCompany();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("arbaadmin/customer/company");

        modelAndView.addObject("orders", orders);
        modelAndView.addObject("company", company);
        modelAndView.addObject("companies", companies);
        return modelAndView;
    }



    @RequestMapping(value = "/add-order", method = RequestMethod.GET)
    public ModelAndView addNewOrder(@RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("arbaadmin/customer/add_order");

        CustomerCompany company = this.companyServiceImpl.getCompanyById(id);
        // todo fix this trash
        company.setToNullOrders();
        // todo is this worth ? could get the company name by javascript (btw)
        modelAndView.addObject("company", company);

        return modelAndView;
    }

    @RequestMapping(value = "/add-new-order", method = RequestMethod.POST)
    @ResponseBody
    public String addNewOrder2(
            @RequestParam(value = "company_id") Integer company_id,
            @RequestParam(value = "direction_from", required = false) String direction_from,
            @RequestParam(value = "direction_to", required = false) String direction_to,
            @RequestParam(value = "request_status", required = false) String request_status,
            @RequestParam(value = "description_of_cargo" , required = false) String description_of_cargo,
            @RequestParam(value = "weight", required = false) String weight,
            @RequestParam(value = "volume", required = false) String volume,
            @RequestParam(value = "number_of_requested_cars", required = false) String number_of_requested_cars,
            @RequestParam(value = "km", required = false) String km,
            @RequestParam(value = "departure_date", required = false) String departure_date,
            @RequestParam(value = "delivery_date", required = false) String delivery_date,
            @RequestParam(value = "driver_full_name", required = false) String driver_full_name,
            @RequestParam(value = "gps", required = false) String gps,
            @RequestParam(value = "driver_phone", required = false) String driver_phone,
            @RequestParam(value = "vehicle_type1", required = false) String vehicle_type1,
            @RequestParam(value = "car_number", required = false) String car_number,
            @RequestParam(value = "cost_of_transportation", required = false) String cost_of_transportation,
            @RequestParam(value = "currency", required = false) String currency,
            @RequestParam(value = "payment_method", required = false) String payment_method,
            @RequestParam(value = "loading_method", required = false) String loading_method,
            @RequestParam(value = "type_of_transport", required = false) String type_of_transport,
            @RequestParam(value = "customer_price", required = false) String customer_price,
            @RequestParam(value = "percentage_of_round_trip", required = false) String percentage_of_round_trip
    ) {
        CustomerOrder order = new CustomerOrder();
        order.setDirection_from(direction_from);
        order.setDirection_to(direction_to);
        order.setRequest_status(request_status);
        order.setDescription_of_cargo(description_of_cargo);
        order.setWeight(weight);
        order.setVolume(volume);
        order.setNumber_of_requested_cars(number_of_requested_cars);
        order.setKm(km);
        order.setDeparture_date(departure_date);
        order.setDelivery_date(delivery_date);
        order.setDriver_full_name(driver_full_name);
        order.setGps(gps);
        order.setDriver_phone(driver_phone);
        order.setCar_brand(vehicle_type1);
        order.setCar_number(car_number);
        order.setCost_of_transportation(cost_of_transportation);
        order.setCurrency(currency);
        order.setPayment_method(payment_method);
        order.setLoading_method(loading_method);
        order.setType_of_transport(type_of_transport);
        order.setCustomer_price(customer_price);
        order.setPercentage_of_round_trip(percentage_of_round_trip);

        CustomerCompany company = this.companyServiceImpl.getCompanyById(company_id);
        order.setCompanies(company);

        this.orderServiceImpl.addOrder(order);
        return "true";
    }



    // todo to something with this big request params
    @RequestMapping(value = "/update-order", method = RequestMethod.POST)
    @ResponseBody
    public String updateOrder(
            @RequestParam(value = "order_id") Integer order_id,
            @RequestParam(value = "company_id") Integer company_id,
            @RequestParam(value = "direction_from", required = false) String direction_from,
            @RequestParam(value = "direction_to", required = false) String direction_to,
            @RequestParam(value = "request_status", required = false) String request_status,
            @RequestParam(value = "description_of_cargo" , required = false) String description_of_cargo,
            @RequestParam(value = "weight", required = false) String weight,
            @RequestParam(value = "volume", required = false) String volume,
            @RequestParam(value = "number_of_requested_cars", required = false) String number_of_requested_cars,
            @RequestParam(value = "km", required = false) String km,
            @RequestParam(value = "departure_date", required = false) String departure_date,
            @RequestParam(value = "delivery_date", required = false) String delivery_date,
            @RequestParam(value = "driver_full_name", required = false) String driver_full_name,
            @RequestParam(value = "gps", required = false) String gps,
            @RequestParam(value = "driver_phone", required = false) String driver_phone,
            @RequestParam(value = "vehicle_type1", required = false) String vehicle_type1,
            @RequestParam(value = "car_number", required = false) String car_number,
            @RequestParam(value = "cost_of_transportation", required = false) String cost_of_transportation,
            @RequestParam(value = "currency", required = false) String currency,
            @RequestParam(value = "payment_method", required = false) String payment_method,
            @RequestParam(value = "loading_method", required = false) String loading_method,
            @RequestParam(value = "type_of_transport", required = false) String type_of_transport,
            @RequestParam(value = "customer_price", required = false) String customer_price,
            @RequestParam(value = "percentage_of_round_trip", required = false) String percentage_of_round_trip
    ) {


        CustomerOrder order = new CustomerOrder();
        order.setId(order_id);
        order.setDirection_from(direction_from);
        order.setDirection_to(direction_to);
        order.setRequest_status(request_status);
        order.setDescription_of_cargo(description_of_cargo);
        order.setWeight(weight);
        order.setVolume(volume);
        order.setNumber_of_requested_cars(number_of_requested_cars);
        order.setKm(km);
        order.setDeparture_date(departure_date);
        order.setDelivery_date(delivery_date);
        order.setDriver_full_name(driver_full_name);
        order.setGps(gps);
        order.setDriver_phone(driver_phone);
        order.setCar_brand(vehicle_type1);
        order.setCar_number(car_number);
        order.setCost_of_transportation(cost_of_transportation);
        order.setCurrency(currency);
        order.setPayment_method(payment_method);
        order.setLoading_method(loading_method);
        order.setType_of_transport(type_of_transport);
        order.setCustomer_price(customer_price);
        order.setPercentage_of_round_trip(percentage_of_round_trip);

        CustomerCompany company = this.companyServiceImpl.getCompanyById(company_id);
        order.setCompanies(company);

        this.orderServiceImpl.updateOrder(order);
        return "true";
    }

    @RequestMapping(value = "/ajax-get-order", method = RequestMethod.POST)
    @ResponseBody
    public CustomerOrder ajaxGetOrder(@RequestParam("orderId") Integer id) {
        CustomerOrder order = this.orderServiceImpl.getOrderById(id);
        order.setCompanies(null);
        return order;
    }

    // Delete order
    @RequestMapping(value = "/ajax-delete-order", method = RequestMethod.POST)
    @ResponseBody
    public String ajaxDeleteOrder(@RequestParam("id") Integer id) {
        this.orderServiceImpl.removeOrder(id);
        return "true";
    }


    @RequestMapping(value = "/add-company", method = RequestMethod.GET)
    public ModelAndView addNewCompany() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("arbaadmin/customer/add_company");
        return modelAndView;
    }

    @RequestMapping(value = "/add-company-post", method = RequestMethod.POST)
    public String addNewCompanyPost(@ModelAttribute("Company") CustomerCompany company) {
        this.companyServiceImpl.addCompany(company);
        return "redirect:/";
    }

    @RequestMapping(value = "/ajax_get_company", method = RequestMethod.POST)
    @ResponseBody
    public CustomerCompany ajaxGetCompany(@RequestParam(value = "id") int id) {
        CustomerCompany company = this.companyServiceImpl.getCompanyById(id);
        company.setToNullOrders();

        return company;
    }


    @RequestMapping(value = "/ajax_update_company", method = RequestMethod.POST)
    @ResponseBody
    public String ajaxUpdateCompany(
            @RequestParam("id") int id,
            @RequestParam("view_company_name") String view_company_name,
            @RequestParam("view_company_city") String view_company_city,
            @RequestParam("view_company_address") String view_company_address,
            @RequestParam("view_contact_person") String view_contact_person,
            @RequestParam("view_phone") String view_phone,
            @RequestParam("view_site") String view_site,
            @RequestParam("view_bin_iin") String view_bin_iin
    ) {


        CustomerCompany company = new CustomerCompany();
        company.setId(id);
        company.setCompany_name(view_company_name);
        company.setCompany_city(view_company_city);
        company.setCompany_address(view_company_address);
        company.setContact_person(view_contact_person);
        company.setPhone(view_phone);
        company.setSite(view_site);
        company.setBin_iin(view_bin_iin);

        this.companyServiceImpl.updateCompany(company);
        return "true";
    }


    @RequestMapping(value = "/ajax_delete_company", method = RequestMethod.POST)
    @ResponseBody
    public String ajaxUpdateCompany(@RequestParam("id") int id) {
        this.companyServiceImpl.removeCompany(id);
        return "true";
    }

}





















