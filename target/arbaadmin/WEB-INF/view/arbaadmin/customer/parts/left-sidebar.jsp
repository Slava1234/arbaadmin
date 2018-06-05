<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<nav class="nav-sidebar left-company-list col-md-3">
    <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/customer/add-company"
       style="margin-top: 5px;margin-bottom: 10px;">Добавить компанию</a>

    <table class="table table-striped">
        <thead>
        <tr>
            <th class="text-size-14 font-size-13" scope="col"></th>
            <th class="text-size-14 font-size-13" scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${companies}" var="company">
            <tr>
                <th class="text-size-14 font-size-13 order-id" name="order-id" scope="col">
                    <img company_id="${company.id}" data-toggle="modal" data-target="#companyInfo"
                         style="width: 30px;cursor: pointer;" class="view-company-btn"
                         src="<c:url value="/resources/img/show-property.png" />"/>
                </th>
                <th class="text-size-14 font-size-13" scope="col">
                    <a href="${pageContext.request.contextPath}/customer/company/${company.id}">
                            ${company.company_name}
                        <span class="badge">
                                ${company.orders.size()}
                        </span>
                    </a>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</nav>