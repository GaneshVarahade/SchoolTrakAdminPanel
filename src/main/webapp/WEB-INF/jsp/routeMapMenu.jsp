<!DOCTYPE html>
<html>
<head>
    <title></title>

    <!-- Ignite UI Required Combined CSS Files -->
    <link href="http://cdn-na.infragistics.com/igniteui/2015.2/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2015.2/latest/css/structure/infragistics.css" rel="stylesheet" />

    <script src="http://modernizr.com/downloads/modernizr-latest.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>

    <!-- Ignite UI Required Combined JavaScript Files -->
    <script src="http://cdn-na.infragistics.com/igniteui/2015.2/latest/js/infragistics.core.js"></script>
    <script src="http://cdn-na.infragistics.com/igniteui/2015.2/latest/js/infragistics.lob.js"></script>

</head>
<body>
    <h3>Flat Data Source</h3>
    <table id="treegrid1"></table>
    <br />
 

    <script>

        $(function () {
          
         

            $("#treegrid1").igTreeGrid({
                width: "100%",
                dataType : "json",
                dataSource: "${pageContext.request.contextPath}/route/routeMapMenuAjax", //bound to flat data source,
                autoGenerateColumns: false,
                primaryKey: "RouteName",
                initialExpandDepth: 1,
                columns: [
                    { headerText: "RouteName ", key: "RouteName", width: "200px", dataType: "String" },
                   
                ],
                childDataKey: "product",
            });


            
            });

    </script>
</body>
</html>