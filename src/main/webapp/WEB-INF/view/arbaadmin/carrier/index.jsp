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

    <h2>Перевозчик</h2>

    <div class="row col-md-12">
        <!-- INCLUDE LEFT SIDEBAR -->
        <%@ include file="./parts/left-sidebar.jsp" %>
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
                    <input readonly name="view_company_name" type="text" class="form-control" id="view_company_name"
                           placeholder="Название компании">
                </div>

                <div class="form-group">
                    <label for="view_company_city">Город</label>
                    <input readonly name="view_company_city" type="text" class="form-control" id="view_company_city"
                           placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_company_address">Адрес</label>
                    <input readonly name="view_company_address" type="text" class="form-control"
                           id="view_company_address" placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_contact_person">Контактное лицо</label>
                    <input readonly name="view_contact_person" type="text" class="form-control" id="view_contact_person"
                           placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_phone">Телефон</label>
                    <input readonly name="view_phone" type="text" class="form-control" id="view_phone"
                           placeholder="Город">
                </div>

                <div class="form-group">
                    <label for="view_site">Сайт</label>
                    <input readonly name="view_site" type="text" class="form-control" id="view_site" placeholder="Сайт">
                </div>

                <div class="form-group">
                    <label for="view_bin_iin">Бин/иин</label>
                    <input readonly name="view_bin_iin" type="text" class="form-control" id="view_bin_iin"
                           placeholder="Бин/иин">
                </div>

                <button class="btn btn-primary" name="update-company">Update</button>
                <button class="btn btn-danger" data-toggle="modal" data-target="#deleteCompanyToBeSure">Delete</button>
            </div>
        </div>
    </div>
</div>


<!-- Make sure to delete company -->
<div class="modal fade" id="deleteCompanyToBeSure" tabindex="-1" role="dialog" aria-labelledby="ModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <h3 style="text-align: center">Удалить компанию?</h3>

            <div style="text-align: center; display: block; width: 100%;margin-bottom: 50px;">
                <button class="btn btn-success btn-lg view-company-delete-no" data-dismiss="modal" aria-label="Close">
                    Нет
                </button>
                <button class="btn btn-danger btn-lg view-company-delete">Да</button>
            </div>
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


    $('#cv-data-table').DataTable();

    $(function () {
        $(".datepicker").datepicker({
            dateFormat: 'dd.mm.yy',
            changeMonth: true,
            changeYear: true,
            //yearRange: '-100y:c+nn',
            yearRange: '2017:2025',
            // maxDate: '-1d'
            // maxDate: '@maxDate',
            // minDate: '@minDate'
        });
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
