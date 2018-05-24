<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>Резюме</title>

    <style>
        body {
            margin: 15px;
        }

        div.search span,
        div.search input[name="keyword"] {
            display: block;
        }

        div.search input[name="keyword"] {
            margin-top: 4px;
        }

        div.panel {
            margin-bottom: 15px;
        }

        div.panel .panel-body p:last-child {
            margin-bottom: 0;
        }

        mark {
            padding: 0;
            background-color: #f1f61a;
        }
    </style>

</head>
<body>


<h2><a href="https://markjs.io/" target="_blank">mark.js</a> example with jQuery</h2>

<div class="panel panel-default">
    <div class="panel-heading">Search</div>
    <div class="panel-body">
        <div class="search row">
            <div class="col-xs-6">
                <span>Type in a keyword:</span>
                <input type="text" name="keyword" class="form-control input-sm" placeholder="Lorem ipsum...">
            </div>
            <div class="col-xs-6">
                <span>Search options:</span>
                <input type="checkbox" name="opt[]" value="separateWordSearch" checked> separate word search
                <br>
                <input type="checkbox" name="opt[]" value="diacritics" checked> diacritics
                <br>
                <input type="checkbox" name="opt[]" value="debug"> debug
                <br>
                <span>There are a lot more <a target="_blank" href="https://markjs.io/configurator.html">options</a>!</span>
            </div>
        </div>
    </div>
</div>


<div class="panel panel-default">
    <div class="panel-body context">
        <p>
            Lorem ipsum dolor sit āmet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, nò sea takimata
            sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea
            rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
            At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie çonsequat, vel illum dolore
            eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit prāesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet,
        </p>
    </div>
</div>

<button class="btn btn-default btn-xs mybtn">search</button>





<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/plupload.full.min.js" />"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.es6.min.js"></script>

<script>

    $(function() {

        var mark = function() {

            // Read the keyword
            var keyword = $("input[name='keyword']").val();

            // Determine selected options
            var options = {};
            $("input[name='opt[]']").each(function() {
                options[$(this).val()] = $(this).is(":checked");
            });

            // Remove previous marked elements and mark
            // the new keyword inside the context
            $(".context").unmark({
                done: function() {
                    $(".context").mark(keyword);
                }
            });
        };

        $('.mybtn').click(function() {
            mark();
        });


       // $("input[name='keyword']").on("input", mark);
      //  $("input[type='checkbox']").on("change", mark);

    });

</script>


</body>
</html>


























