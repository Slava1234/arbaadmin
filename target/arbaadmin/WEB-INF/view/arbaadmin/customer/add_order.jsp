<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Добавить заказ</title>
</head>
<body>

<div class="container col-md-6 col-md-offset-3">
    <a style="margin-top: 5px;" href="${pageContext.request.contextPath}/customer/main"  class="btn btn-primary">Назад</a><br><br>
    <form>

        <h2>Заказ для компании "${company.company_name}"</h2>

        <input type="text" name="company_id" hidden value="${company.id}">

        <div class="form-group">
            <label for="direction_from">Откуда</label>
            <input name="direction_from" type="text" class="form-control" id="direction_from" placeholder="Откуда" maxlength="255">
        </div>

        <div class="form-group">
            <label for="direction_to">Куда</label>
            <input name="direction_to" type="text" class="form-control" id="direction_to" placeholder="Куда" maxlength="255">
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
                    <label for="weight">Вес (10 кг / 20 тонн)</label>
                    <input name="weight" maxlength="255" type="text" class="form-control" id="weight" placeholder="Вес">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="volume">Объем (3 км (м³) / 7 кс (см³) )</label>
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
                    <label for="km">Расстояние (500 км / 800 м)</label>
                    <input type="text" maxlength="255" name="km"  class="form-control" id="km" placeholder="Расстояние">
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="departure_date">Дата Отправки</label>
                    <input maxlength="255" type="text" name="departure_date" class="form-control datepicker" id="departure_date" placeholder="Дата Отправки">
                </div>
            </div>
            <div class="col-md-6">

                <div class="form-group">
                    <label for="delivery_date">Дата Доставки</label>
                    <input maxlength="255" type="text" name="delivery_date" class="form-control datepicker" id="delivery_date" placeholder="Дата Доставки">
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="vehicle_type1">Марка Авто</label>
                    <input maxlength="255" name="vehicle_type1" type="text" class="form-control" id="vehicle_type1" placeholder="Марка Авто">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="car_number">Гос.номер авто</label>
                    <input maxlength="255" name="car_number" type="text" class="form-control" id="car_number" placeholder="Гос.номер авто">
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

        <!-- select options below -->
        <div class="col-md-12" style="margin: 10px 0 10px 0;">
            <div class="col-md-6">
                <div class="form-group" style="text-align: center">
                    <label for="type_of_transport">Вид транспорта</label><br>
                    <select class="selectpicker" style="width: 120px;border: 1px solid #cccccc;border-radius: 3px;" id="type_of_transport">
                        <option>Тент</option>
                        <option>Термо</option>
                        <option>Холодильник</option>
                        <option>Площадка</option>
                        <option>Трал</option>
                        <option>Самосвал</option>
                        <option>Длинномер</option>
                        <option>Трубовоз</option>
                        <option>Другое</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group" style="text-align: center">
                    <label for="payment_method">Способ оплаты</label>
                    <select class="selectpicker" style="width: 250px;border: 1px solid #cccccc;border-radius: 3px;" id="payment_method">
                        <option>Нал. На выгрузку</option>
                        <option>Нал. На погрузку</option>
                        <option>Нал. До выгрузки</option>
                        <option>Нал. На карту</option>
                        <option>Перечислением на счет</option>
                        <option>Предоплата (Нал. Перечисление, на карту)</option>
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
                    <input class="form-check-input" name="gps" type="radio" id="gps_0" value="Нету">
                    <label class="form-check-label" for="gps_0">Нету</label><br>
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

        <button type="button" class="btn btn-success add-new-order">Добавить</button>
    </form>

</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>
<script src="<c:url value="/resources/js/customer/script.js" />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>




<script>
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

</script>
</body>
</html>
