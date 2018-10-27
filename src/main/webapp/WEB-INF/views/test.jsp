<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
        $(document).ready(function () {
            var array = [
                "김밥",
                "김치",
                "김치찌개",
                "김치김밥",
                "김밥천국",
                "참치김밥",
                "김밥나라"
            ];
            console.log("array = " + array);
 
            /**
             * source - 검색될 배열
             */
            $("#search").autocomplete({source: array});
        });
    </script>
</head>

<div class="ui-widget">
    <label>Search: </label>
    <input id="search">
</div>

</body>
</html>