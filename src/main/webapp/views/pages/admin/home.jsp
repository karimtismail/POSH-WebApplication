<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content=" "/>
    <!-- Title -->
    <title>Shop Grid Left Sidebar - Posh Auto Parts eCommerce Bootstrap 4 Html Template</title>

    <%@ include file="allStyles.jsp" %>
</head>
<body class="template-product-grid-leftsidebar" onload="goToHome()">
<%@ include file="header.jsp" %>

<div class="main-wrapper cart-drawer-push">

    <div id="productsListDiv" style="display: none">
        <%@ include file="mainContent.jsp" %>
    </div>

    <div id="usersListDiv" style="display: none">
        <%@ include file="usersList.jsp" %>
    </div>

    <%@include file="footer.jsp" %>

</div>
</body>

<%@include file="allScripts.jsp" %>


</html>