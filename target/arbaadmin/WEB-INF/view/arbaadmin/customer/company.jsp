<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Компании и заявки</title>


    <style>


        .left-company-list {
            height: 80%;
            overflow: auto;
            margin-top: 62px;
            border: 1px solid #e3e3e3;
            border-radius: 3px;
        }

        .orders-box {

        }

        .badge {
            float: right;
        }
    </style>


</head>
<body>

<div class="container col-md-12">

    <div class="preloader">
        <div id="cssload-contain">
            <div class="cssload-box-loading">
            </div>
        </div>
    </div>






    <div class="row col-md-12">
        <!-- INCLUDE LEFT SIDEBAR -->
        <%@ include file="./parts/left-sidebar.jsp" %>



        <div class="orders-box col-md-9">



            <a style="margin-top: 5px;" class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/customer/add-order?id=${company.id}" style="margin-top: 5px;">
                Добавить заказ для компании <i>${company.company_name}</i>
            </a>
            <h3 style="text-align: center;display: inline-block;margin: 61px 0 30px 100px;">Заказы компании: ${company.company_name}<u>${сcompany.company_name}</u></h3>


            <table class="table table-striped" style="width: 3500px" id="arbaadmin-data-table">
                <thead>
                <tr>
                    <th class="text-size-14 font-size-13" scope="col">#</th>
                    <th class="text-size-14 font-size-13" scope="col">Действие</th>
                    <th class="text-size-14 font-size-13" scope="col">Статус заявки</th>
                    <th class="text-size-14 font-size-13" scope="col">Откуда</th>
                    <th class="text-size-14 font-size-13" scope="col">Куда</th>
                    <th class="text-size-14 font-size-13" scope="col">Расстояние КМ</th>
                    <th class="text-size-14 font-size-13" scope="col">Описание груза</th>
                    <th class="text-size-14 font-size-13" scope="col">Вес</th>
                    <th class="text-size-14 font-size-13" scope="col">Объем</th>
                    <th class="text-size-14 font-size-13" scope="col">Дата отправки</th>
                    <th class="text-size-14 font-size-13" scope="col">Дата доставки</th>
                    <th class="text-size-14 font-size-13" scope="col">ФИО Водителя</th>
                    <th class="text-size-14 font-size-13" scope="col">Телефон водителя</th>
                    <th class="text-size-14 font-size-13" scope="col">GPS</th>
                    <th class="text-size-14 font-size-13" scope="col">Марка автомобиля</th>
                    <th class="text-size-14 font-size-13" scope="col">Гос.номер авто</th>
                    <th class="text-size-14 font-size-13" scope="col">Стоимость перевозки</th>
                    <th class="text-size-14 font-size-13" scope="col">Валюта</th>
                    <th class="text-size-14 font-size-13" scope="col">Способ оплаты</th>
                    <th class="text-size-14 font-size-13" scope="col">Количество запрошенного авто</th>
                    <th class="text-size-14 font-size-13" scope="col">Способ погрузки</th>
                    <th class="text-size-14 font-size-13" scope="col">Вид транспорта</th>
                    <th class="text-size-14 font-size-13" scope="col">Калькулятор</th>
                    <th class="text-size-14 font-size-13" scope="col">Стоимость заказчика</th>
                    <th class="text-size-14 font-size-13" scope="col">% от туда и обратно</th>
                    <th hidden class="text-size-14 font-size-13" scope="col">company_id</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order">
                    <tr>
                        <th class="text-size-14 font-size-13 order-id" name="order-id" scope="col">${order.id}</th>
                        <th class="text-size-14 font-size-13" scope="col">
                            <button class="btn btn-primary btn-xs update-order" data-toggle="modal" data-target="#updateOrder">Обновить</button>
                            <button class="btn btn-danger btn-xs delete-order" data-toggle="modal" data-target="#deleteOrderToBeSure" >Удалить</button>
                        </th>
                        <th class="text-size-14 font-size-13" scope="col">${order.request_status}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.direction_from}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.direction_to}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.km}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.description_of_cargo}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.weight}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.volume}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.departure_date}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.delivery_date }</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.driver_full_name}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.driver_phone}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.gps}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.car_brand}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.car_number}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.cost_of_transportation}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.currency}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.payment_method}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.number_of_requested_cars}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.loading_method}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.type_of_transport}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.calculator}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.customer_price}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.percentage_of_round_trip}</th>
                        <th hidden class="text-size-14 font-size-13 company_id" scope="col">${company.id}</th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>


    </div>

</div>


</div>

<!-- View company -->
<div class="modal fade" id="companyInfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel">Modeal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <input type="text" hidden name="view_company_id" class="view_company_id" value="">

                <div class="form-group">
                    <label for="view_company_name">Название компании</label>
                    <input maxlength="255" readonly name="view_company_name" type="text" class="form-control" id="view_company_name" placeholder="Название компании">
                </div>

                <div class="form-group">
                    <label for="view_company_city">Город</label>
                    <input maxlength="255" readonly name="view_company_city" type="text" class="form-control" id="view_company_city" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_company_address">Адрес</label>
                    <input maxlength="255" readonly name="view_company_address" type="text" class="form-control" id="view_company_address" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_contact_person">Контактное лицо</label>
                    <input maxlength="255" readonly name="view_contact_person" type="text" class="form-control" id="view_contact_person" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_phone">Телефон</label>
                    <input maxlength="255" readonly name="view_phone" type="text" class="form-control" id="view_phone" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_site">Сайт</label>
                    <input maxlength="255" readonly name="view_site" type="text" class="form-control" id="view_site" placeholder="Сайт">
                </div>

                <div class="form-group">
                    <label for="view_bin_iin">Бин/иин</label>
                    <input maxlength="255" readonly name="view_bin_iin" type="text" class="form-control" id="view_bin_iin" placeholder="Бин/иин">
                </div>

                <button class="btn btn-primary" name="update-company">Update</button>
                <button class="btn btn-danger" data-toggle="modal" data-target="#deleteCompanyToBeSure">Delete</button>
            </div>
        </div>
    </div>
</div>


<!-- Make sure to delete company -->
<div class="modal fade" id="deleteCompanyToBeSure" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <h3 style="text-align: center">Удалить компанию?</h3>

            <div style="text-align: center; display: block; width: 100%;margin-bottom: 50px;">
                <button class="btn btn-success btn-lg view-company-delete-no" data-dismiss="modal" aria-label="Close" >Нет</button>
                <button class="btn btn-danger btn-lg view-company-delete">Да</button>
            </div>
        </div>
    </div>
</div>
</div>


<!-- update order -->
<div class="modal fade" id="updateOrder" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel3">Modeal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">








                <input type="text" name="company_id" hidden value="${company.id}">

                <div class="form-group">
                    <label for="direction_from">Откуда</label>
                    <input maxlength="255" name="direction_from" type="text" class="form-control" id="direction_from" placeholder="Откуда">
                </div>

                <div class="form-group">
                    <label for="direction_to">Куда</label>
                    <input maxlength="255" name="direction_to" type="text" class="form-control" id="direction_to" placeholder="Куда">
                </div>

                <div class="form-group">
                    <label for="percentage_of_round_trip">% от туда и обратно</label>
                    <input maxlength="255" name="percentage_of_round_trip" type="text" class="form-control" id="percentage_of_round_trip" placeholder="% от туда и обратно">
                </div>

                <div class="form-group">
                    <label for="description_of_cargo">Описание груза</label>
                    <!--input name="description_of_cargo" type="text" class="form-control" id="description_of_cargo" placeholder="Описание груза"-->
                    <textarea class="form-control" name="description_of_cargo" id="description_of_cargo" cols="30" rows="6" placeholder="Описание груза"></textarea>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="weight">Вес</label>
                            <input name="weight" maxlength="255" type="text" class="form-control" id="weight" placeholder="Вес">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="volume">Объем</label>
                            <input name="volume" maxlength="255" type="text" class="form-control" id="volume" placeholder="Объем">
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="number_of_requested_cars">Кол-во запрашиваемого авто</label>
                            <input type="text" maxlength="255" name="number_of_requested_cars"  class="form-control" id="number_of_requested_cars" placeholder="Кол-во авто в автопарке">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="km">Расстояние</label>
                            <input type="text" maxlength="255" name="km"  class="form-control" id="km" placeholder="Расстояние">
                        </div>
                    </div>
                </div>


                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="departure_date">Дата Отправки</label>
                            <input type="text" maxlength="255" name="departure_date" class="form-control datepicker" id="departure_date" placeholder="Дата Отправки">
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label for="delivery_date">Дата Доставки</label>
                            <input type="text" maxlength="255" name="delivery_date" class="form-control datepicker" id="delivery_date" placeholder="Дата Доставки">
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="cost_of_transportation">Стоимость перевозки</label>
                            <input maxlength="255" name="cost_of_transportation" type="text" class="form-control" id="cost_of_transportation" placeholder="Стоимость перевозки">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="customer_price">Стоимость заказчика</label>
                            <input maxlength="255" name="customer_price" type="text" class="form-control" id="customer_price" placeholder="Стоимость заказчика">
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="driver_full_name">ФИО Водителя</label>
                            <input maxlength="255" type="text" name="driver_full_name" class="form-control" id="driver_full_name" placeholder="ФИО Водителя">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="driver_phone">Телефон водителя</label>
                            <input maxlength="255" name="driver_phone" type="text" class="form-control" id="driver_phone" placeholder="Телефон водителя">
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="brand_of_machine">Марка Авто</label>
                            <input maxlength="255" name="brand_of_machine" type="text" class="form-control" id="brand_of_machine" placeholder="Марка Авто">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="car_number">Гос.номер авто</label>
                            <input maxlength="255" name="car_number" type="text" class="form-control" id="car_number" placeholder="Гос.номер авто">
                        </div>
                    </div>
                </div>

                <!-- select options below -->
                <div class="col-md-12" style="margin: 10px 0 10px 0;">
                    <div class="col-md-6">
                        <div class="form-group" style="text-align: center">
                            <label for="type_of_transport">Вид транспорта</label><br>
                            <select class="selectpicker" style="width: 120px;border: 1px solid #cccccc;border-radius: 3px;" id="type_of_transport">
                                <option type_of_transport="1">Тент</option>
                                <option type_of_transport="2">Термо</option>
                                <option type_of_transport="3">Холодильник</option>
                                <option type_of_transport="4">Площадка</option>
                                <option type_of_transport="5">Трал</option>
                                <option type_of_transport="6">Самосвал</option>
                                <option type_of_transport="7">Длинномер</option>
                                <option type_of_transport="8">Трубовоз</option>
                                <option type_of_transport="9">Другое</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" style="text-align: center">
                            <label for="payment_method">Способ оплаты</label>
                            <select class="selectpicker" style="width: 250px;border: 1px solid #cccccc;border-radius: 3px;" id="payment_method">
                                <option payment_method="1">Нал. На выгрузку</option>
                                <option payment_method="2">Нал. На погрузку</option>
                                <option payment_method="3">Нал. До выгрузки</option>
                                <option payment_method="4">Нал. На карту</option>
                                <option payment_method="5">Перечислением на счет</option>
                                <option payment_method="6">Предоплата (Нал. Перечисление, на карту)</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="col-md-12" style="margin: 10px 0 10px 0;">
                    <div class="col-md-3">
                        <div class="form-check" style="text-align: center">
                            <b>Валюта</b><br>
                            <input class="form-check-input" name="currency" type="radio" id="currency_KZT" value="KZT">
                            <label class="form-check-label" for="currency_KZT">KZT</label><br>
                            <input class="form-check-input" name="currency" type="radio" id="currency_RUB" value="RUB">
                            <label class="form-check-label" for="currency_RUB">RUB</label><br>
                            <input class="form-check-input" name="currency" type="radio" id="currency_USD" value="USD">
                            <label class="form-check-label" for="currency_USD">USD</label>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-check" style="text-align: center">
                            <b>GPS</b><br>
                            <input class="form-check-input" name="gps" type="radio" id="gps_1" value="Есть">
                            <label class="form-check-label" for="gps_1">Есть</label><br>
                            <input class="form-check-input" name="gps" type="radio" id="gps_2" value="Нету">
                            <label class="form-check-label" for="gps_2">Нету</label><br>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-check" style="text-align: center">
                            <b>Способ погрузки</b><br>
                            <input class="form-check-input" name="loading_method" type="radio" id="loading_method_1" value="Боковая">
                            <label class="form-check-label" for="loading_method_1">Боковая</label><br>
                            <input class="form-check-input" name="loading_method" type="radio" id="loading_method_2" value="Верхняя">
                            <label class="form-check-label" for="loading_method_2">Верхняя</label><br>
                            <input class="form-check-input" name="loading_method" type="radio" id="loading_method_3" value="Задняя">
                            <label class="form-check-label" for="loading_method_3">Задняя</label>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="form-check" style="text-align: center">
                            <b>Статус заявки</b><br>
                            <input class="form-check-input" name="request_status" type="radio" id="request_status" value="Открыта">
                            <label class="form-check-label" for="request_status">Открыта</label><br>
                            <input class="form-check-input" name="request_status" type="radio" id="request_status2" value="Закрыта">
                            <label class="form-check-label" for="request_status2">Закрыта</label>
                        </div>
                    </div>
                </div>














                <button class="btn btn-primary update-order-ready">Обновить заказ</button>
            </div>
        </div>
    </div>
</div>


<!-- Make sure to delete company -->
<div class="modal fade" id="deleteOrderToBeSure" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <h3 style="text-align: center">Удалить заказ?</h3>

            <div style="text-align: center; display: block; width: 100%;margin-bottom: 50px;">
                <button class="btn btn-success btn-lg order-delete-no" data-dismiss="modal" aria-label="Close" >Нет</button>
                <button class="btn btn-danger btn-lg order-delete-yes">Да</button>
            </div>
        </div>
    </div>
</div>
</div>




<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="https://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.es6.min.js"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>
<script src="<c:url value="/resources/js/customer/script.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>

<script>
    $('.preloader').fadeOut(500);


    $('#arbaadmin-data-table').DataTable();

    $(function() {
        $( ".datepicker" ).datepicker({
            dateFormat : 'dd.mm.yy',
            changeMonth : true,
            changeYear : true,
            //yearRange: '-100y:c+nn',
            yearRange: '2017:2025',
            // maxDate: '-1d'
            // maxDate: '@maxDate',
            // minDate: '@minDate'
        });
    });


    $('#driver_phone').mask('0000-000-00-00');


    var addOrderForCompany = $('.add-order-for-company');

    $(".left-company-list ul li").click(function () {

        addOrderForCompany.show(100);
        addOrderForCompany.attr('company-id', 1);

    });


</script>







</body>
</html>
