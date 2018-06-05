$(function () {

    var locationURL = location.origin + location.pathname;

    // operations with comments
    $('.save-comment').click(function () {

        var cvId = $(this).closest('tr').find('.cv_id').text();
        var commentValue = $(this).parent().find('textarea').val();

        var commentZone = $(this).closest('.text-size-14').find('.cv-row-comment');
        var commentDate = $(this).closest('.text-size-14').find('.cv-row-comment-date');

        $.ajax({
            url: locationURL + '/cv/update-comment/' + cvId,
            type: 'POST',
            data: {
                comment: commentValue
            },
            dataType: 'text',
            success: function (response) {
                console.log("success from send " + response);
                $.ajax({
                    url: locationURL + '/cv/get-comment/' + cvId,
                    type: 'POST',
                    dataType: 'text',
                    success: function (response) {
                        console.log("updated comment = " + response);

                        var res = JSON.parse(response);

                        commentZone.text(res.comment);
                        commentDate.text(res.last_comment_update);


                    },
                    error: function (error) {
                        console.log("error from get comment: " + error);
                    }
                });
            },
            error: function (error) {
                console.log("error from update comment : " + error);
            }
        });
    });


    // get cv data by id
    $('.fio').click(function () {
        if (locationURL.search(/bookmarks/)) {
            locationURL = locationURL.replace("bookmarks", '');
        }

        var cvId = $(this).closest('tr').find('.cv_id').text();
        $.ajax({
            url: locationURL + '/cv/get-cv/' + cvId,
            type: 'POST',
            data: '',
            contentType: "application/json",
            dataType: 'text',
            success: function (response) {
                var res = JSON.parse(response);

                var fio = res.fio;
                var birthdate = res.birthdate;
                var phone = res.phone;
                var email = res.email;
                var sellary = res.sellary;
                var experiance_years = res.experiance_years;
                var experiance_places = res.experiance_places;
                var skills = res.skills;
                var about = res.about;
                var comment = res.comment;
                var filename = res.filename;


                $('.cv-view-fio').text(fio);
                $('.cv-view-email').text(email);
                $('.cv-view-phone').text(phone);
                $('.cv-view-sellary').text(sellary);
                $('.cv-view-birthday').text(birthdate);
                $('.cv-view-experiance-years').text(experiance_years);
                $('.cv-view-experiance-place').text(experiance_places);
                $('.cv-view-skills').text(skills);
                $('.cv-view-about').text(about);
                $('.cv-view-comment').text(comment);


                var filenameArr = filename.split("\\");

                /**
                 * set link to download file
                 * if file doesn't present than remove download link
                 */
                if (filenameArr[filenameArr.length - 1] != 'null')
                    $('.cv-view-file-download').show().attr('href', locationURL + filename);
                else
                    $('.cv-view-file-download').hide();


                // highlight searched words
                var mark = function () {

                    // Read the keyword
                    var keyword = $("#cv-data-table_filter input[type='search']").val();

                    // Determine selected options
                    /*var options = {};
                    $("input[name='opt[]']").each(function() {
                        options[$(this).val()] = $(this).is(":checked");
                    });*/

                    // Remove previous marked elements and mark
                    // the new keyword inside the context
                    var context = "#dataInfo";
                    $(context).unmark({
                        done: function () {
                            $(context).mark(keyword);
                        }
                    });
                };

                mark();

            },
            error: function (error) {
                console.log("error from update comment : " + error);
            }
        });
    });


    var cvId;
    var fio;
    var email;
    var phone;
    var sellary;
    var birthdate;
    var experiance_years;
    var experiance_places;
    var skills;
    var about;
    var comment;
    var birth;

    var editable_fio;
    var editable_email;
    var editable_phone;
    var editable_sellary;
    var editable_birthdate;
    var editable_experiance_years;
    var editable_experiance_places;
    var editable_skills;
    var editable_about;
    var editable_comment;
    var editable_birth;


    $('.edit-cv-btn').click(function () {

        cvId = $(this).closest('tr').find('.cv_id').text();


        fio = $(this).closest('tr').find('.cv-fio');
        email = $(this).closest('tr').find('.cv-email');
        phone = $(this).closest('tr').find('.cv-phone');
        sellary = $(this).closest('tr').find('.cv-sellary');
        birthdate = $(this).closest('tr').find('.cv-birthdate');
        experiance_years = $(this).closest('tr').find('.cv-experiance_years');
        experiance_places = $(this).closest('tr').find('.cv-experiance_places');
        skills = $(this).closest('tr').find('.cv-skills');
        about = $(this).closest('tr').find('.cv-about');
        comment = $(this).closest('tr').find('.cv-row-comment');
        birth = $(this).closest('tr').find('.cv-birth');

        editable_fio = $('#dataInfoEdit .cv-edit-fio .form-control');
        editable_email = $('#dataInfoEdit .cv-edit-email .form-control');
        editable_phone = $('#dataInfoEdit .cv-edit-phone .form-control');
        editable_sellary = $('#dataInfoEdit .cv-edit-sellary .form-control');
        editable_birthdate = $('#dataInfoEdit .cv-edit-birthday .form-control');
        editable_experiance_years = $('#dataInfoEdit .cv-edit-experiance-years .form-control');
        editable_experiance_places = $('#dataInfoEdit .cv-edit-experiance-place');
        editable_skills = $('#dataInfoEdit .cv-edit-skills');
        editable_about = $('#dataInfoEdit .cv-edit-about');
        editable_comment = $('#dataInfoEdit .cv-edit-comment .form-control');
        editable_birth = $('#dataInfoEdit .datepicker');
        editable_file = $('#dataInfoEdit #file');


        editable_fio.val(fio.text());
        editable_email.val(email.text());
        editable_phone.val(phone.text());
        editable_sellary.val(sellary.text());
        editable_birthdate.val(birthdate.text());
        editable_experiance_years.val(experiance_years.text());
        editable_experiance_places.val(experiance_places.text());
        editable_skills.val(skills.text());
        editable_about.val(about.text());
        editable_comment.val(comment.text());

        // make good looking date format
        var oldDate = birth.text();
        var newDate = "";
        var a = oldDate.split("-");
        for (var i = a.length - 1; i >= 0; i--) {
            var dash = "";
            if (i != 0)
                dash = ".";
            newDate += a[i] + dash;
        }
        editable_birth.val(newDate);
    });

    $('.cv-edit-save').click(function () {
        $.ajax({
            url: locationURL + '/cv/update',
            type: 'POST',
            data: {
                cvId: cvId,
                editable_fio: editable_fio.val(),
                editable_email: editable_email.val(),
                editable_phone: editable_phone.val(),
                editable_sellary: editable_sellary.val(),
                editable_birthdate: editable_birthdate.val(),
                editable_experiance_years: editable_experiance_years.val(),
                editable_experiance_places: editable_experiance_places.val(),
                editable_skills: editable_skills.val(),
                editable_about: editable_about.val(),
                editable_comment: editable_comment.val(),
                editable_birth: editable_birth.val()
            },
            success: function (response) {
                console.log("cv has been successfully updated + " + response);
                fio.children('a').text(editable_fio.val());
                email.text(editable_email.val());
                phone.text(editable_phone.val());
                sellary.text(editable_sellary.val());
                birthdate.text(editable_birthdate.val());
                experiance_years.text(editable_experiance_years.val());
                experiance_places.text(editable_experiance_places.val());
                skills.text(editable_skills.val());
                about.text(editable_about.val());
                comment.text(editable_comment.val());
                birth.text(editable_birth.val());
            },
            error: function (error) {
                console.log("error! cv has not been updated : " + error);
            }
        });
    });


    $('.bookmark-cv').click(function () {
        var cvId = $(this).closest('tr').find('.cv_id').text();
        if ($(this).attr('state') == 1) { // добавить резюме в закладки

            if (locationURL.search(/bookmarks/)) {
                locationURL = locationURL.replace("bookmarks", '');
            }

            $(this).attr('src', locationURL + '/resources/img/add_new_star.png');
            $(this).attr('state', 0);

            $.ajax({
                url: locationURL + '/cv/change-bookmark-state',
                type: 'POST',
                data: {
                    cvId: cvId,
                    state: '0'
                },
                success: function (response) {
                    console.log("cv has successfully removed bookmark");
                },
                error: function (error) {
                    console.log("error! cv has not been bookmarked");
                }
            });
        } else { // удалить резюме из закладок

            if (locationURL.search(/bookmarks/)) {
                locationURL = locationURL.replace("bookmarks", '');
            }
            $(this).attr('src', locationURL + '/resources/img/star_added.png');
            $(this).attr('state', 1);

            $.ajax({
                url: locationURL + '/cv/change-bookmark-state',
                type: 'POST',
                data: {
                    cvId: cvId,
                    state: '1'
                },
                success: function (response) {
                    console.log("cv has been successfully bookmarked");
                },
                error: function (error) {
                    console.log("error! cv has not been bookmarked");
                }
            });
        }
    });


    /**
     *  Arbaadmin
     *  *****************************************
     */

    //var serverAddress = "https://lotmaster.kz:8181/arbaadmin/";
    var serverAddress = "http://localhost:8080/arbaadmin/";

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
            url: serverAddress+'customer/ajax_get_company',
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
                url: serverAddress + 'customer/ajax_update_company',
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
                        alert("Компания обновлена")
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
            url: serverAddress + '/ajax_delete_company',
            type: 'POST',
            data: {
                id: id
            },
            success: function (response) {
                if (response == "true") {
                    alert("Компания удалена");
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
    var customer_price;
    var percentage_of_round_trip;


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
        driver_full_name = modal.find("input[name='driver_full_name']");
        driver_phone = modal.find("input[name='driver_phone']");
        brand_of_machine = modal.find("input[name='brand_of_machine']");
        car_number = modal.find("input[name='car_number']");
        cost_of_transportation = modal.find("input[name='cost_of_transportation']");
        number_of_requested_cars = modal.find("input[name='number_of_requested_cars']");
        calculator = modal.find("input[name='calculator']");
        customer_price = modal.find("input[name='customer_price']");
        percentage_of_round_trip = modal.find("input[name='percentage_of_round_trip']");

        orderId = $(this).closest("tr").find('.order-id').text();
        company_id = $(this).closest("tr").find('.company_id').text();

        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+'customer/ajax-get-order',
            type: 'POST',
            data: {
                orderId: orderId
            },
            success: function (response) {

                //request_status.val(response.request_status);

                //request_status.attr().attr("selected", "selected");

                modal.find("*[request_status='2']").attr("selected", "selected");

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

                driver_full_name.val(response.driver_full_name);
                driver_phone.val(response.driver_phone);
                brand_of_machine.val(response.car_brand);
                car_number.val(response.car_number);

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
        driver_full_name = modal.find("input[name='driver_full_name']");
        driver_phone = modal.find("input[name='driver_phone']");
        brand_of_machine = modal.find("input[name='brand_of_machine']");
        car_number = modal.find("input[name='car_number']");
        cost_of_transportation = modal.find("input[name='cost_of_transportation']");
        number_of_requested_cars = modal.find("input[name='number_of_requested_cars']");
        calculator = modal.find("input[name='calculator']");
        customer_price = modal.find("input[name='customer_price']");
        percentage_of_round_trip = modal.find("input[name='percentage_of_round_trip']");

        var id = orderId;
        var companyId = company_id;

        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+ 'customer/update-order',
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
                driver_full_name: driver_full_name.val(),
                driver_phone: driver_phone.val(),
                gps: gps.val(),
                brand_of_machine: brand_of_machine.val(),
                car_number: car_number.val(),
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
            url: serverAddress+'customer/ajax-delete-order',
            type: 'POST',
            data: {
                id: orderIdToDelete
            },
            success: function (response) {
                if (response == "true") {
                    alert("Заявка удалена");
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
        var request_status = $("input[name='request_status']:checked").val();
        var description_of_cargo = $("textarea[name='description_of_cargo']").val();
        var weight = $("input[name='weight']").val();
        var volume = $("input[name='volume']").val();
        var number_of_requested_cars = $("input[name='number_of_requested_cars']").val();
        var km = $("input[name='km']").val();
        var departure_date = $("input[name='departure_date']").val();
        var delivery_date = $("input[name='delivery_date']").val();
        var driver_full_name = $("input[name='driver_full_name']").val();
        var gps = $("input[name='gps']:checked").val();
        var driver_phone = $("input[name='driver_phone']").val();
        var vehicle_type1 = $("input[name='vehicle_type1']").val();
        var car_number = $("input[name='car_number']").val();
        var cost_of_transportation = $("input[name='cost_of_transportation']").val();
        var currency = $("input[name='currency']:checked").val();
        var payment_method = $("#payment_method option:selected").text();
        var loading_method = $("input[name='loading_method']:checked").val();
        var type_of_transport = $("#type_of_transport option:selected").text();
        var customer_price = $("input[name='customer_price']").val();
        var percentage_of_round_trip = $("input[name='percentage_of_round_trip']").val();



        $.ajax({
            // todo fix this to url independent structure
            url: serverAddress+'/customer/add-new-order',
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
                driver_full_name: driver_full_name,
                gps: gps,
                driver_phone: driver_phone,
                vehicle_type1: vehicle_type1,
                car_number: car_number,
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




