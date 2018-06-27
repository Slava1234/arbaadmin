$(function () {

    var locationURL = location.origin + location.pathname;

    var serverAddress = "https://lotmaster.kz:8181/arbaadmin/";
    //var serverAddress = "http://localhost:8080/arbaadmin/";




    // view company info
    $('.view-company-btn').click(function () {
        var id = $(this).attr("company_id");
        var modal = $('#companyInfo');

        modal.find("button[name='update-company']").attr("class", 'btn btn-primary');

        modal.find("input[name='view_company_name']").attr("readonly", "true");
        modal.find("input[name='view_company_city']").attr("readonly", "true");
        modal.find("input[name='view_company_address']").attr("readonly", "true");
        modal.find("input[name='view_contact_person']").attr("readonly", "true");
        modal.find("input[name='view_phone']").attr("readonly", "true");
        modal.find("input[name='view_site']").attr("readonly", "true");
        modal.find("input[name='view_bin_iin']").attr("readonly", "true");

        $.ajax({
            // todo check this url
            url: serverAddress+'carrier/ajax_get_company',
            type: 'POST',
            data: {
                id: id
            },
            success: function (response) {
                console.log(response.company_name);

                var modal = $('#companyInfo');
                modal.find("input[name='view_company_id']").val(response.id);
                modal.find("input[name='view_company_name']").val(response.company_name);
                modal.find("input[name='view_company_city']").val(response.company_city);
                modal.find("input[name='view_company_address']").val(response.company_address);
                modal.find("input[name='view_contact_person']").val(response.contact_person);
                modal.find("input[name='view_phone']").val(response.phone);
                modal.find("input[name='view_site']").val(response.site);
                modal.find("input[name='view_bin_iin']").val(response.bin_iin);

            },
            error: function (error) {
                console.log("error! " + error);
            }
        });

    });


    $("button[name='update-company']").click(function () {


        // todo this selectors are repeated
        var modal = $('#companyInfo');

        var id = modal.find("input[name='view_company_id']").val();

        var view_company_name = modal.find("input[name='view_company_name']").val();
        var view_company_city = modal.find("input[name='view_company_city']").val();
        var view_company_address = modal.find("input[name='view_company_address']").val();
        var view_contact_person = modal.find("input[name='view_contact_person']").val();
        var view_phone = modal.find("input[name='view_phone']").val();
        var view_site = modal.find("input[name='view_site']").val();
        var view_bin_iin = modal.find("input[name='view_bin_iin']").val();


        if ($(this).hasClass("ready_to_update_company")) {
            $.ajax({
                url: serverAddress + 'carrier/ajax_update_company',
                type: 'POST',
                data: {
                    id: id,
                    view_company_name: view_company_name,
                    view_company_city: view_company_city,
                    view_company_address: view_company_address,
                    view_contact_person: view_contact_person,
                    view_phone: view_phone,
                    view_site: view_site,
                    view_bin_iin: view_bin_iin
                },
                success: function (response) {
                    if (response == "true") {
                        alert("Компания обноалена")
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log("error! " + error);
                }
            });
        }


        modal.find("input[name='view_company_name']").removeAttr("readonly");
        modal.find("input[name='view_company_city']").removeAttr("readonly");
        modal.find("input[name='view_company_address']").removeAttr("readonly");
        modal.find("input[name='view_contact_person']").removeAttr("readonly");
        modal.find("input[name='view_phone']").removeAttr("readonly");
        modal.find("input[name='view_site']").removeAttr("readonly");
        modal.find("input[name='view_bin_iin']").removeAttr("readonly");

        $(this).attr('class', 'btn btn-success ready_to_update_company');


    });


    $('.view-company-delete').click(function () {
        var modal = $('#companyInfo');

        var id = modal.find("input[name='view_company_id']").val();

        $('.view-company-delete-no').trigger('click');

        $.ajax({
            url: serverAddress + '/carrier/ajax_delete_company',
            type: 'POST',
            data: {
                id: id
            },
            success: function (response) {
                if (response == "true") {
                    console.log("Компания удалена");
                    location.reload();
                }
            },
            error: function (error) {
                console.log("error! " + error);
            }
        });


    });


    /**
     * Update order
     * @type {*|jQuery|HTMLElement}
     * *****************************************
     */

    var modal;
    var request_status;
    var gps;
    var currency;
    var payment_method;
    var loading_method;
    var type_of_transport;


    var direction_to;
    var direction_from;
    var km;
    var description_of_cargo;
    var weight;
    var volume;
    var departure_date;
    var delivery_date;
    var driver_full_name;
    var driver_phone;
    var brand_of_machine;
    var car_number;
    var cost_of_transportation;
    var number_of_requested_cars;
    var calculator;
    var carrier_price;
    var percentage_of_round_trip;
    var customer_price;


    var orderId;
    var company_id;
    // update order
    $('.update-order').click(function () {

        modal = $('#updateOrder');
        request_status = $("input[name='request_status']:checked").val();
        gps = modal.find("#gps option:selected");
        currency = modal.find("#currency option:selected");
        payment_method = modal.find("#payment_method option:selected");
        loading_method = modal.find("#loading_method option:selected");
        type_of_transport = modal.find("#type_of_transport option:selected");
        direction_to = modal.find("input[name='direction_to']");
        direction_from = modal.find("input[name='direction_from']");
        km = modal.find("input[name='km']");
        description_of_cargo = modal.find("textarea[name='description_of_cargo']");
        weight = modal.find("input[name='weight']");
        volume = modal.find("input[name='volume']");
        departure_date = modal.find("input[name='departure_date']");
        delivery_date = modal.find("input[name='delivery_date']");
        cost_of_transportation = modal.find("input[name='cost_of_transportation']");
        number_of_requested_cars = modal.find("input[name='number_of_requested_cars']");
        calculator = modal.find("input[name='calculator']");
        customer_price = modal.find("input[name='customer_price']");
        percentage_of_round_trip = modal.find("input[name='percentage_of_round_trip']");


        orderId = $(this).closest("tr").find('.order-id').text();
        company_id = $(this).closest("tr").find('.company_id').text();

        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+'carrier/ajax-get-order',
            type: 'POST',
            data: {
                orderId: orderId
            },
            success: function (response) {
                //request_status.val(response.request_status);

                //request_status.attr().attr("selected", "selected");


                // set request_status

                if (response.request_status == "Открыта") {
                    modal.find("#request_status").prop('checked', true);
                    modal.find("#request_status2").prop('checked', false);
                } else if (response.request_status == "Закрыта") {
                    modal.find("#request_status").prop('checked', false);
                    modal.find("#request_status2").prop('checked', true);
                } else {
                    modal.find("#request_status").prop('checked', false);
                    modal.find("#request_status2").prop('checked', false);
                }

                // set gps
                if (response.gps == "Есть") {
                    modal.find("#gps_1").prop('checked', true);
                    modal.find("#gps_2").prop('checked', false);
                } else {
                    modal.find("#gps_1").prop('checked', false);
                    modal.find("#gps_2").prop('checked', true);
                }

                // set currency
                if (response.currency == "KZT") {
                    modal.find("#currency_KZT").prop('checked', true);
                    modal.find("#currency_RUB").prop('checked', false);
                    modal.find("#currency_USD").prop('checked', false);
                }
                if (response.currency == "RUB") {
                    modal.find("#currency_KZT").prop('checked', false);
                    modal.find("#currency_RUB").prop('checked', true);
                    modal.find("#currency_USD").prop('checked', false);
                }
                if (response.currency == "USD") {
                    modal.find("#currency_KZT").prop('checked', false);
                    modal.find("#currency_RUB").prop('checked', false);
                    modal.find("#currency_USD").prop('checked', true);
                }


                // set payment_method
                if (response.payment_method == "Нал. На выгрузку") {
                    modal.find("*[payment_method='1']").attr("selected", "selected");
                    modal.find("*[payment_method='2']").removeAttr("selected");
                    modal.find("*[payment_method='3']").removeAttr("selected");
                    modal.find("*[payment_method='4']").removeAttr("selected");
                    modal.find("*[payment_method='5']").removeAttr("selected");
                    modal.find("*[payment_method='6']").removeAttr("selected");
                }
                if (response.payment_method == "Нал. На погрузку") {
                    modal.find("*[payment_method='2']").attr("selected", "selected");
                    modal.find("*[payment_method='1']").removeAttr("selected");
                    modal.find("*[payment_method='3']").removeAttr("selected");
                    modal.find("*[payment_method='4']").removeAttr("selected");
                    modal.find("*[payment_method='5']").removeAttr("selected");
                    modal.find("*[payment_method='6']").removeAttr("selected");
                }
                if (response.payment_method == "Нал. До выгрузки") {
                    modal.find("*[payment_method='3']").attr("selected", "selected");
                    modal.find("*[payment_method='1']").removeAttr("selected");
                    modal.find("*[payment_method='2']").removeAttr("selected");
                    modal.find("*[payment_method='4']").removeAttr("selected");
                    modal.find("*[payment_method='5']").removeAttr("selected");
                    modal.find("*[payment_method='6']").removeAttr("selected");
                }
                if (response.payment_method == "Нал. На карту") {
                    modal.find("*[payment_method='4']").attr("selected", "selected");
                    modal.find("*[payment_method='1']").removeAttr("selected");
                    modal.find("*[payment_method='2']").removeAttr("selected");
                    modal.find("*[payment_method='3']").removeAttr("selected");
                    modal.find("*[payment_method='5']").removeAttr("selected");
                    modal.find("*[payment_method='6']").removeAttr("selected");
                }
                if (response.payment_method == "Перечислением на счет") {
                    modal.find("*[payment_method='5']").attr("selected", "selected");
                    modal.find("*[payment_method='1']").removeAttr("selected");
                    modal.find("*[payment_method='2']").removeAttr("selected");
                    modal.find("*[payment_method='3']").removeAttr("selected");
                    modal.find("*[payment_method='4']").removeAttr("selected");
                    modal.find("*[payment_method='6']").removeAttr("selected");
                }
                if (response.payment_method == "Предоплата (Нал. Перечисление, на карту)") {
                    modal.find("*[payment_method='6']").attr("selected", "selected");
                    modal.find("*[payment_method='1']").removeAttr("selected");
                    modal.find("*[payment_method='2']").removeAttr("selected");
                    modal.find("*[payment_method='3']").removeAttr("selected");
                    modal.find("*[payment_method='4']").removeAttr("selected");
                    modal.find("*[payment_method='5']").removeAttr("selected");
                }

                // set loading_method
                if (response.loading_method == "Боковая") {
                    modal.find("#loading_method_1").prop('checked', true);
                    modal.find("#loading_method_2").prop('checked', false);
                    modal.find("#loading_method_3").prop('checked', false);
                }
                if (response.loading_method == "Верхняя") {
                    modal.find("#loading_method_1").prop('checked', false);
                    modal.find("#loading_method_2").prop('checked', true);
                    modal.find("#loading_method_3").prop('checked', false);
                }
                if (response.loading_method == "Задняя") {
                    modal.find("#loading_method_1").prop('checked', false);
                    modal.find("#loading_method_2").prop('checked', false);
                    modal.find("#loading_method_3").prop('checked', true);
                }


                // set type_of_transport
                if (response.type_of_transport == "Тент") {
                    modal.find("*[type_of_transport='1']").attr("selected", "selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Термо") {
                    modal.find("*[type_of_transport='2']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Холодильник") {
                    modal.find("*[type_of_transport='3']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Площадка") {
                    modal.find("*[type_of_transport='4']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Трал") {
                    modal.find("*[type_of_transport='5']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Самосвал") {
                    modal.find("*[type_of_transport='6']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Длинномер") {
                    modal.find("*[type_of_transport='7']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Трубовоз") {
                    modal.find("*[type_of_transport='8']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='9']").removeAttr("selected");
                }
                if (response.type_of_transport == "Другое") {
                    modal.find("*[type_of_transport='9']").attr("selected", "selected");
                    modal.find("*[type_of_transport='1']").removeAttr("selected");
                    modal.find("*[type_of_transport='2']").removeAttr("selected");
                    modal.find("*[type_of_transport='3']").removeAttr("selected");
                    modal.find("*[type_of_transport='4']").removeAttr("selected");
                    modal.find("*[type_of_transport='5']").removeAttr("selected");
                    modal.find("*[type_of_transport='6']").removeAttr("selected");
                    modal.find("*[type_of_transport='7']").removeAttr("selected");
                    modal.find("*[type_of_transport='8']").removeAttr("selected");
                }




                direction_to.val(response.direction_to);
                direction_from.val(response.direction_from);
                km.val(response.km);
                description_of_cargo.text(response.description_of_cargo);
                weight.val(response.weight);
                volume.val(response.volume);
                departure_date.val(response.departure_date);
                delivery_date.val(response.delivery_date);
                gps.val(response.gps);
                cost_of_transportation.val(response.cost_of_transportation);
                currency.val(response.currency);
                payment_method.val(response.payment_method);
                number_of_requested_cars.val(response.number_of_requested_cars);
                loading_method.val(response.loading_method);
                type_of_transport.val(response.type_of_transport);
                calculator.val(response.calculator);
                customer_price.val(response.customer_price);
                percentage_of_round_trip.val(response.percentage_of_round_trip);
            },
            error: function (error) {
                console.log("error! " + error);
            }
        });


    });


    $('.update-order-ready').click(function () {

        modal = $('#updateOrder');
        request_status = $("input[name='request_status']:checked");
        gps = modal.find("input[name='gps']:checked");
        currency = modal.find("input[name='currency']:checked");
        payment_method = modal.find("#payment_method option:selected");
        loading_method = modal.find("input[name='loading_method']:checked");
        type_of_transport = modal.find("#type_of_transport option:selected");
        direction_to = modal.find("input[name='direction_to']");
        direction_from = modal.find("input[name='direction_from']");
        km = modal.find("input[name='km']");
        description_of_cargo = modal.find("textarea[name='description_of_cargo']");
        weight = modal.find("input[name='weight']");
        volume = modal.find("input[name='volume']");
        departure_date = modal.find("input[name='departure_date']");
        delivery_date = modal.find("input[name='delivery_date']");
        cost_of_transportation = modal.find("input[name='cost_of_transportation']");
        number_of_requested_cars = modal.find("input[name='number_of_requested_cars']");
        calculator = modal.find("input[name='calculator']");
        customer_price = modal.find("input[name='customer_price']");
        percentage_of_round_trip = modal.find("input[name='percentage_of_round_trip']");

        var id = orderId;
        var companyId = company_id;


        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+ 'carrier/update-order',
            type: 'POST',
            data: {
                order_id: id,
                company_id: companyId,
                request_status: request_status.val(),
                direction_to: direction_to.val(),
                direction_from: direction_from.val(),
                km: km.val(),
                description_of_cargo: description_of_cargo.val(),
                weight: weight.val(),
                volume: volume.val(),
                departure_date: departure_date.val(),
                delivery_date: delivery_date.val(),
                gps: gps.val(),
                cost_of_transportation: cost_of_transportation.val(),
                currency: currency.val(),
                payment_method: payment_method.val(),
                number_of_requested_cars: number_of_requested_cars.val(),
                loading_method: loading_method.val(),
                type_of_transport: type_of_transport.val(),
                calculator: calculator.val(),
                customer_price: customer_price.val(),
                percentage_of_round_trip: percentage_of_round_trip.val()
            },
            success: function (response) {
                if (response == "true") {
                    alert("Заявка обновлена");
                    location.reload();
                }
            },
            error: function (error) {
                console.log("error! " + error);
            }
        });
    });


    // delete order ajax
    var orderIdToDelete;
    $('.delete-order').click(function () {
        orderIdToDelete = $(this).closest('tr').find('.order-id').text();
    });


    $('.order-delete-yes').click(function () {

        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+'carrier/ajax-delete-order',
            type: 'POST',
            data: {
                id: orderIdToDelete
            },
            success: function (response) {
                if (response == "true") {
                    console.log("Заявка удалена");
                    location.reload();
                }
            },
            error: function (error) {
                console.log("error! " + error);
            }
        });
    });

    // add new order
    $(".add-new-order").click(function () {

        var company_id = $("input[name='company_id']").val();
        var direction_from = $("input[name='direction_from']").val();
        var direction_to = $("input[name='direction_to']").val();
        var description_of_cargo = $("textarea[name='description_of_cargo']").val();
        var weight = $("input[name='weight']").val();
        var volume = $("input[name='volume']").val();
        var number_of_requested_cars = $("input[name='number_of_requested_cars']").val();
        var km = $("input[name='km']").val();
        var departure_date = $("input[name='departure_date']").val();
        var delivery_date = $("input[name='delivery_date']").val();
        var gps = $("input[name='gps']:checked").val();
        var request_status = $("input[name='request_status']:checked").val();
        var cost_of_transportation = $("input[name='cost_of_transportation']").val();
        var currency = $("input[name='currency']:checked").val();
        var payment_method = $("#payment_method option:selected").text();
        var loading_method = $("input[name='loading_method']:checked").val();
        var type_of_transport = $("#type_of_transport option:selected").text();
        var customer_price = $("input[name='customer_price']").val();
        var percentage_of_round_trip = $("input[name='percentage_of_round_trip']").val();


        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+'carrier/add-new-order',
            type: 'POST',
            data: {
                company_id: company_id,
                direction_from: direction_from,
                direction_to: direction_to,
                request_status: request_status,
                description_of_cargo: description_of_cargo,
                weight: weight,
                volume: volume,
                number_of_requested_cars: number_of_requested_cars,
                km: km,
                departure_date: departure_date,
                delivery_date: delivery_date,
                gps: gps,
                cost_of_transportation: cost_of_transportation,
                currency: currency,
                payment_method: payment_method,
                loading_method: loading_method,
                type_of_transport: type_of_transport,
                customer_price: customer_price,
                percentage_of_round_trip: percentage_of_round_trip
            },
            success: function (response) {
                if (response == "true") {
                    alert("Заявка добавлена");
                    location.reload();
                }
            },
            error: function (error) {
                console.log("error! " + error);
            }
        });
    });






















});
