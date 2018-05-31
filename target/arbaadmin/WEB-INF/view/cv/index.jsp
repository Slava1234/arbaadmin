<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Резюме</title>

    <style>
        mark {
            padding: 0;
            background-color: #f1f61a;
        }
        .cssload-box-loading {
            width: 88px;
            height: 88px;
            margin: 200px auto;
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }
        .cssload-box-loading:before {
            content: '';
            width: 88px;
            height: 9px;
            background: rgb(0,0,0);
            opacity: 0.1;
            position: absolute;
            top: 103px;
            left: 0;
            border-radius: 50%;
            animation: shadow 0.5s linear infinite;
            -o-animation: shadow 0.5s linear infinite;
            -ms-animation: shadow 0.5s linear infinite;
            -webkit-animation: shadow 0.5s linear infinite;
            -moz-animation: shadow 0.5s linear infinite;
        }
        .cssload-box-loading:after {
            content: '';
            width: 88px;
            height: 88px;
            background: rgb(77,40,224);
            position: absolute;
            top: 0;
            left: 0;
            border-radius: 5px;
            animation: cssload-animate 0.5s linear infinite;
            -o-animation: cssload-animate 0.5s linear infinite;
            -ms-animation: cssload-animate 0.5s linear infinite;
            -webkit-animation: cssload-animate 0.5s linear infinite;
            -moz-animation: cssload-animate 0.5s linear infinite;
        }



        @keyframes cssload-animate {
            17% {
                border-bottom-right-radius: 5px;
            }
            25% {
                transform: translateY(16px) rotate(22.5deg);
            }
            50% {
                transform: translateY(32px) scale(1, 0.9) rotate(45deg);
                border-bottom-right-radius: 70px;
            }
            75% {
                transform: translateY(16px) rotate(67.5deg);
            }
            100% {
                transform: translateY(0) rotate(90deg);
            }
        }

        @-o-keyframes cssload-animate {
            17% {
                border-bottom-right-radius: 5px;
            }
            25% {
                -o-transform: translateY(16px) rotate(22.5deg);
            }
            50% {
                -o-transform: translateY(32px) scale(1, 0.9) rotate(45deg);
                border-bottom-right-radius: 70px;
            }
            75% {
                -o-transform: translateY(16px) rotate(67.5deg);
            }
            100% {
                -o-transform: translateY(0) rotate(90deg);
            }
        }

        @-ms-keyframes cssload-animate {
            17% {
                border-bottom-right-radius: 5px;
            }
            25% {
                -ms-transform: translateY(16px) rotate(22.5deg);
            }
            50% {
                -ms-transform: translateY(32px) scale(1, 0.9) rotate(45deg);
                border-bottom-right-radius: 70px;
            }
            75% {
                -ms-transform: translateY(16px) rotate(67.5deg);
            }
            100% {
                -ms-transform: translateY(0) rotate(90deg);
            }
        }

        @-webkit-keyframes cssload-animate {
            17% {
                border-bottom-right-radius: 5px;
            }
            25% {
                -webkit-transform: translateY(16px) rotate(22.5deg);
            }
            50% {
                -webkit-transform: translateY(32px) scale(1, 0.9) rotate(45deg);
                border-bottom-right-radius: 70px;
            }
            75% {
                -webkit-transform: translateY(16px) rotate(67.5deg);
            }
            100% {
                -webkit-transform: translateY(0) rotate(90deg);
            }
        }

        @-moz-keyframes cssload-animate {
            17% {
                border-bottom-right-radius: 5px;
            }
            25% {
                -moz-transform: translateY(16px) rotate(22.5deg);
            }
            50% {
                -moz-transform: translateY(32px) scale(1, 0.9) rotate(45deg);
                border-bottom-right-radius: 70px;
            }
            75% {
                -moz-transform: translateY(16px) rotate(67.5deg);
            }
            100% {
                -moz-transform: translateY(0) rotate(90deg);
            }
        }

        @keyframes shadow {
            0%,
            100% {
                transform: scale(1, 1);
            }
            50% {
                transform: scale(1.2, 1);
            }
        }

        @-o-keyframes shadow {
            0%,
            100% {
                -o-transform: scale(1, 1);
            }
            50% {
                -o-transform: scale(1.2, 1);
            }
        }

        @-ms-keyframes shadow {
            0%,
            100% {
                -ms-transform: scale(1, 1);
            }
            50% {
                -ms-transform: scale(1.2, 1);
            }
        }

        @-webkit-keyframes shadow {
            0%,
            100% {
                -webkit-transform: scale(1, 1);
            }
            50% {
                -webkit-transform: scale(1.2, 1);
            }
        }

        @-moz-keyframes shadow {
            0%,
            100% {
                -moz-transform: scale(1, 1);
            }
            50% {
                -moz-transform: scale(1.2, 1);
            }
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

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a style="margin-top: 5px;" class="btn btn-success" href="${pageContext.request.contextPath}/cv/add">Добавить</a>
                <a style="margin-top: 5px;" href="${pageContext.request.contextPath}/bookmarks"
                   class="btn btn-primary bookmark-show-btn">
                    <img style="width: 20px;"
                         src="<c:url value="/resources/img/star_added.png" />"
                         alt="bookmark"/>
                    Избранные
                </a>


            </div>


        </div><!-- /.container-fluid -->
    </nav>

    <table class="table table-striped" id="cv-data-table">
        <thead>
        <tr>
            <th class="text-size-14 font-size-13" scope="col">#</th>
            <th class="text-size-14 font-size-13" scope="col">ФИО</th>
            <th class="text-size-14 font-size-13" scope="col">Дата рождения</th>
            <th class="text-size-14 font-size-13" scope="col">Телефон</th>
            <th class="text-size-14 font-size-13" scope="col">Почта</th>
            <th class="text-size-14 font-size-13" scope="col">Желаемая зарплата</th>
            <th class="text-size-14 font-size-13" scope="col">Опыт работы</th>
            <th class="text-size-14 font-size-13" scope="col">Комментарий</th>
            <th class="text-size-14 font-size-13" scope="col">Действие</th>

            <th hidden class="text-size-14 font-size-13" scope="col">experiance_places</th>
            <th hidden class="text-size-14 font-size-13" scope="col">skills</th>
            <th hidden class="text-size-14 font-size-13" scope="col">about</th>
            <th hidden class="text-size-14 font-size-13" scope="col">birth</th>
            <th hidden class="text-size-14 font-size-13" scope="col">file</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach items="${cvs}" var="cv">
            <tr>
                <th class="cv_id text-size-14 font-size-13" scope="row">${cv.id}</th>
                <td data-toggle="modal" data-target="#dataInfo" class="cv-fio text-size-14 font-size-13 fio"><a
                        style="cursor: pointer">${cv.fio}</a></td>
                <td class="cv-birthdate text-size-14 font-size-13">${cv.birthdate}</td>
                <td class="cv-phone text-size-14 font-size-13">${cv.phone}</td>
                <td class="cv-email text-size-14 font-size-13">${cv.email}</td>
                <td class="cv-sellary text-size-14 font-size-13">${cv.sellary}</td>
                <td class="cv-experiance_years text-size-14 font-size-13">${cv.experiance_years}</td>


                <td class="text-size-14 font-size-13">


                    <div class="btn-group dropleft">

                        <a href="" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false">Комментировать</a>
                        <div class="dropdown-menu"
                             style="width: 200px; text-align: center;padding-top: 0px;height: 165px;">
                            <div class="form-group">
                                <textarea class="" style="margin-bottom: 7px;width: 100%;" rows="5"
                                          placeholder="Комментарий"
                                          style="width: 100%">${cv.comment}</textarea>
                                <button class="btn btn-success btn-xs save-comment">Сохранить</button>
                            </div>

                        </div>
                    </div>
                    <br>
                    <p><span class="cv-row-comment">${cv.comment}</span><br><span class="cv-row-comment-date"
                                                                                  style="font-size: 11px;">${cv.last_comment_update}</span>
                    </p>


                </td>


                <td style="text-align: center;">
                    <img class="edit-cv-btn" data-toggle="modal" data-target="#dataInfoEdit"
                         style="width: 30px;cursor: pointer;" src="<c:url value="/resources/img/edit.png" />"
                         alt="edit"/>


                    <c:choose>
                        <c:when test="${cv.bookmark=='1'}">
                            <img class="bookmark-cv" state="1"
                                 style="width: 30px;cursor: pointer;"
                                 src="<c:url value="/resources/img/star_added.png" />"
                                 alt="bookmark"/>
                        </c:when>
                        <c:otherwise>
                            <img class="bookmark-cv" state="0"
                                 style="width: 30px;cursor: pointer;"
                                 src="<c:url value="/resources/img/add_new_star.png" />"
                                 alt="bookmark"/>
                        </c:otherwise>
                    </c:choose>

                    <span style="display: block; margin-top: 4px;">
                        <a href="${pageContext.request.contextPath}/upload-new-cv-file?id=${cv.id}">
                         <img class="upload-cv-btn"
                              style="width: 30px;cursor: pointer;" src="<c:url value="/resources/img/upload.png" />"
                              alt="upload"/>
                        </a>



                        <c:choose>
                            <c:when test="${cv.filename!=null}">
                            <a href="${cv.filename}" download>

                         <img class="download-cv-btn"
                              style="width: 30px;cursor: pointer;" src="<c:url value="/resources/img/download.png" />"
                              alt="download"/>
                            </a>
                            </c:when>
                            <c:otherwise>
                            <a  style="cursor: no-drop;opacity: 0.2;"  >

                         <img class="download-cv-btn"
                              style="width: 30px" src="<c:url value="/resources/img/download.png" />"
                              alt="download"/>
                            </a>
                            </c:otherwise>
                        </c:choose>

                    </span>

                </td>

                <td hidden class="cv-experiance_places text-size-14 font-size-13">${cv.experiance_places}</td>
                <td hidden class="cv-skills text-size-14 font-size-13">${cv.skills}</td>
                <td hidden class="cv-about text-size-14 font-size-13">${cv.about}</td>
                <td hidden class="cv-birth text-size-14 font-size-13">${cv.birth}</td>
                <td hidden class="cv-file text-size-14 font-size-13">${cv.filename}</td>

            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>


<!-- View cv -->
<div class="modal fade" id="dataInfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="padding: 0 30px 0 30px;">
            <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel">Modeal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">ФИО</th>
                        <th class="font-size-15" scope="col">EMAIL</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <p style="white-space: pre-line;" class="cv-view-fio font-size-13"></p>
                        </td>
                        <td>
                            <p style="white-space: pre-line;" class="cv-view-email font-size-13"></p>
                        </td>

                    </tr>
                    </tbody>
                </table>

                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">ТЕЛЕФОН</th>
                        <th class="font-size-15" scope="col">Зарплата</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <p style="white-space: pre-line;" class="cv-view-phone font-size-13"></p>
                        </td>
                        <td>
                            <p style="white-space: pre-line;" class="cv-view-sellary font-size-13"></p>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table class="table">
                    <thead>
                    <tr>
                        <th class="font-size-15" scope="col">Дата рождения</th>
                        <th class="font-size-15" scope="col">Опыт работы</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <p style="white-space: pre-line;" class="cv-view-birthday font-size-13"></p>
                        </td>
                        <td>
                            <p style="white-space: pre-line;" class="cv-view-experiance-years font-size-13"></p>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <hr>
                <h4 class="font-size-15" >Места работы</h4>
                <p style="white-space: pre-line;width: 100%;" class="cv-view-experiance-place font-size-13"></p>

                <hr>
                <h4 class="font-size-15">Навыки</h4>
                <p style="width: 100%;white-space: pre-line" class="cv-view-skills font-size-13"></p>

                <hr>
                <h4 class="font-size-15">Общие данные</h4>
                <p style="width: 100%;white-space: pre-line" class="cv-view-about font-size-13"></p>

                <hr>
                <h4 class="font-size-15">Комментарий</h4>
                <p class="cv-view-comment font-size-13" style="width: 100%;white-space: pre-line"></p>
                <hr>




            </div>
        </div>
    </div>
</div>


<!-- Edit cv -->
<div class="modal fade" id="dataInfoEdit" tabindex="-1" role="dialog" aria-labelledby="ModalLabelEdit"
     aria-hidden="true">
    <form id="edit_cv_form" enctype="multipart/form-data">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="padding: 0 30px 0 30px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabelEdit">Modeal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="font-size-15" scope="col">ФИО</th>
                            <th class="font-size-15" scope="col">EMAIL</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="cv-edit-fio font-size-13">
                                <div class="form-group">
                                    <input name="editable_fio" type="text" class="form-control">
                                </div>
                            </td>
                            <td class="cv-edit-email font-size-13">
                                <div class="form-group">
                                    <input name="editable_email" type="text" class="form-control">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="table">
                        <thead>
                        <tr>
                            <th class="font-size-15" scope="col">ТЕЛЕФОН</th>
                            <th class="font-size-15" scope="col">Зарплата</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="cv-edit-phone font-size-13">
                                <div class="form-group">
                                    <input name="editable_phone" type="text" class="form-control">
                                </div>
                            </td>
                            <td class="cv-edit-sellary font-size-13">
                                <div class="form-group">
                                    <input name="editable_sellary" type="text" class="form-control">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <table class="table">
                        <thead>
                        <tr>
                            <th class="font-size-15" scope="col">Дата рождения</th>
                            <th class="font-size-15" scope="col">Опыт работы</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="cv-edit-birthday font-size-13">
                                <div class="form-group">
                                    <input name="editable_birthdate" type="text" class="form-control">
                                </div>
                            </td>
                            <td class="cv-edit-experiance-years font-size-13">
                                <div class="form-group">
                                    <input name="editable_experiance_years" type="text" class="form-control">
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <!---->
                    <h4 class="font-size-15 font-size-13">Новая дата рождения</h4>
                    <div class="form-group">
                        <input name="editable_birth" type="text" class="form-control datepicker">
                    </div>

                    <hr>
                    <h4 class="font-size-15">Места работы</h4>
                    <div class="form-group">
                    <textarea name="editable_experiance_places"
                              class="cv-edit-experiance-place font-size-13 form-control" style="width: 100%"
                              rows="12"></textarea>
                    </div>

                    <hr>
                    <h4 class="font-size-15">Навыки</h4>
                    <div class="form-group">
                <textarea name="editable_skills" class="cv-edit-skills font-size-13 form-control" style="width: 100%"
                          rows="12"></textarea>
                    </div>

                    <hr>
                    <h4 class="font-size-15">Общие данные</h4>
                    <div class="form-group">
                        <textarea name="editable_about" class="cv-edit-about font-size-13 form-control"
                                  style="width: 100%" rows="8"></textarea>
                    </div>

                    <hr>
                    <h4 class="font-size-15">Комментарий</h4>
                    <div class="form-group cv-edit-comment font-size-13">
                        <input name="editable_comment" type="text" class="form-control">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                    <button type="button" class="btn btn-primary cv-edit-save">Сохранить</button>
                </div>
            </div>
        </div>
    </form>
</div>


<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.es6.min.js"></script>
<script src="<c:url value="/resources/js/script.js" />"></script>


<script>
    $(document).ready(function () {
        $('#cv-data-table').DataTable();

        $(".datepicker").datepicker({
            dateFormat: 'dd.mm.yy',
            changeMonth: true,
            changeYear: true,
            yearRange: '-100y:c+nn',
            maxDate: '-1d'
        });


        // preloader
       $('.preloader').fadeOut(500);


    });


</script>


</body>
</html>
