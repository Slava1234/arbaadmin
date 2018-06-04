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



            <a style="margin-top: 5px;" class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/add-order?id=${company.id}" style="margin-top: 5px;">
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
                    <th class="text-size-14 font-size-13" scope="col">Цена перевозчика</th>
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
                        <th class="text-size-14 font-size-13" scope="col">${order.brand_of_machine}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.car_number}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.cost_of_transportation}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.currency}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.payment_method}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.number_of_requested_cars}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.loading_method}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.type_of_transport}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.calculator}</th>
                        <th class="text-size-14 font-size-13" scope="col">${order.carrier_price}</th>
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
                    <input readonly name="view_company_name" type="text" class="form-control" id="view_company_name" placeholder="Название компании">
                </div>

                <div class="form-group">
                    <label for="view_company_city">Город</label>
                    <input readonly name="view_company_city" type="text" class="form-control" id="view_company_city" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_company_address">Адрес</label>
                    <input readonly name="view_company_address" type="text" class="form-control" id="view_company_address" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_contact_person">Контактное лицо</label>
                    <input readonly name="view_contact_person" type="text" class="form-control" id="view_contact_person" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_phone">Телефон</label>
                    <input readonly name="view_phone" type="text" class="form-control" id="view_phone" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_site">Сайт</label>
                    <input readonly name="view_site" type="text" class="form-control" id="view_site" placeholder="Сайт">
                </div>

                <div class="form-group">
                    <label for="view_bin_iin">Бин/иин</label>
                    <input readonly name="view_bin_iin" type="text" class="form-control" id="view_bin_iin" placeholder="Бин/иин">
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










                <div class="form-group">
                    <label for="direction_from">Откуда</label>
                    <input name="direction_from" type="text" class="form-control" id="direction_from" placeholder="Откуда">
                </div>

                <div class="form-group">
                    <label for="direction_to">Куда</label>
                    <input name="direction_to" type="text" class="form-control" id="direction_to" placeholder="Куда">
                </div>

                <div class="form-group">
                    <label for="request_status">Статус заявки</label>
                    <select style="width: 100px;border: 1px solid #cccccc;border-radius: 3px;" id="request_status" name="request_status">
                        <option request_status="0"></option>
                        <option request_status="1">Открыта</option>
                        <option request_status="2">Закрыта</option>
                    </select>
                </div>


                <div class="form-group">
                    <label for="description_of_cargo">Описание груза</label>
                    <input name="description_of_cargo" type="text" class="form-control" id="description_of_cargo" placeholder="Описание груза">
                </div>


                <div class="form-group">
                    <label for="weight">Вес</label>
                    <input name="weight" type="text" class="form-control" id="weight" placeholder="Вес">
                </div>

                <div class="form-group">
                    <label for="volume">Объем</label>
                    <input name="volume" type="text" class="form-control" id="volume" placeholder="Объем">
                </div>

                <div class="form-group">
                    <label for="number_of_requested_cars">Кол-во запрашиваемого авто</label>
                    <input type="text" name="number_of_requested_cars"  class="form-control" id="number_of_requested_cars" placeholder="Кол-во авто в автопарке">
                </div>


                <div class="form-group">
                    <label for="km">Расстояние</label>
                    <input type="text" name="km"  class="form-control" id="km" placeholder="Расстояние">
                </div>

                <div class="form-group">
                    <label for="departure_date">Дата Отправки</label>
                    <input type="text" name="departure_date" class="form-control datepicker" id="departure_date" placeholder="Дата Отправки">
                </div>

                <div class="form-group">
                    <label for="delivery_date">Дата Доставки</label>
                    <input type="text" name="delivery_date" class="form-control datepicker" id="delivery_date" placeholder="Дата Доставки">
                </div>


                <div class="form-group">
                    <label for="driver_full_name">ФИО Водителя</label>
                    <input type="text" name="driver_full_name" class="form-control" id="driver_full_name" placeholder="ФИО Водителя">
                </div>


                <div class="form-check">
                    <label for="gps">GPS</label>
                    <select style="width: 100px;border: 1px solid #cccccc;border-radius: 3px;" id="gps" name="gps">
                        <option gps="1">Нету</option>
                        <option gps="2">Есть</option>
                    </select>



                </div>


                <div class="form-group">
                    <label for="driver_phone">Телефон водителя</label>
                    <input name="driver_phone" type="text" class="form-control" id="driver_phone" placeholder="Телефон водителя">
                </div>

                <div class="form-group">
                    <label for="vehicle_type1">Марка Авто</label>
                    <input name="vehicle_type1" type="text" class="form-control" id="vehicle_type1" placeholder="Марка Авто">
                </div>

                <div class="form-group">
                    <label for="car_number">Гос.номер авто</label>
                    <input name="car_number" type="text" class="form-control" id="car_number" placeholder="Гос.номер авто">
                </div>

                <div class="form-group">
                    <label for="cost_of_transportation">Стоимость перевозки</label>
                    <input name="cost_of_transportation" type="text" class="form-control" id="cost_of_transportation" placeholder="Стоимость перевозки">
                </div>

                <div class="form-group">
                    <label for="currency">Валюта</label>
                    <select class="selectpicker" style="width: 100px;border: 1px solid #cccccc;border-radius: 3px;" id="currency">
                        <option currency="1">KZT</option>
                        <option currency="2">RUB</option>
                        <option currency="3">USD</option>
                    </select>
                </div>


                <div class="form-group">
                    <label for="request_status">Способ оплаты</label>
                    <select class="selectpicker" style="width: 250px;border: 1px solid #cccccc;border-radius: 3px;" id="payment_method">
                        <option payment_method="1">Нал. На выгрузку</option>
                        <option payment_method="2">Нал. На погрузку</option>
                        <option payment_method="3">Нал. До выгрузки</option>
                        <option payment_method="4">Нал. На карту</option>
                        <option payment_method="5">Перечислением на счет</option>
                        <option payment_method="6">Предоплата (Нал. Перечисление, на карту)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="request_status">Способ погрузки</label>
                    <select class="selectpicker" style="width: 100px;border: 1px solid #cccccc;border-radius: 3px;" id="loading_method">
                        <option loading_method="1">Боковая</option>
                        <option loading_method="2">Верхняя</option>
                        <option loading_method="3">Задняя</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="request_status">Вид транспорта</label>
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





                <div class="form-group">
                    <label for="carrier_price">Цена перевозчика</label>
                    <input name="carrier_price" type="text" class="form-control" id="carrier_price" placeholder="Цена перевозчика">
                </div>

                <div class="form-group">
                    <label for="percentage_of_round_trip">% от туда и обратно</label>
                    <input name="percentage_of_round_trip" type="text" class="form-control" id="percentage_of_round_trip" placeholder="% от туда и обратно">
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


<script>
    $('.preloader').fadeOut(500);


    $('#arbaadmin-data-table').DataTable();

    $(".datepicker").datepicker({
        dateFormat: 'dd.mm.yy',
        changeMonth: true,
        changeYear: true,
        //yearRange: '-100y:c+nn',
        //maxDate: '-1d'
        maxDate: '@maxDate',
        minDate: '@minDate'
    });


    // preloader



    //arbaadmin

    var addOrderForCompany = $('.add-order-for-company');

    $(".left-company-list ul li").click(function () {

        addOrderForCompany.show(100);
        addOrderForCompany.attr('company-id', 1);

    });

    addOrderForCompany.click(function () {
        alert()
    });




    $(document).ready(function () {

    });


</script>







</body>
</html>
