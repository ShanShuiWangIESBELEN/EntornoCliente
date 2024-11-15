<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="org.iesbelen.model.Fabricante" %>
<%@page import="java.util.List" %>
<%@ page import="org.iesbelen.dao.FabricanteDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fabricantes</title>
    <style>
        .clearfix::after {
            content: "";
            display: block;
            clear: both;
        }
    </style>
</head>

<%@ include file="/WEB-INF/jsp/formato/header.jspf" %>


<body>
<body>

<div id="contenedora" style="float:none; margin: 0 auto;width: 900px;">
    <div class="clearfix">
        <div style="float: left; width: 50%">
            <h1>Fabricantes</h1>
        </div>
        <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">
            <div style="position: absolute; left: 39%; top : 39%;">

                <form action="${pageContext.request.contextPath}/tienda/fabricantes/crear">
                    <input type="submit" value="Crear">
                </form>
            </div>

        </div>
    </div>

    <div class="clearfix">

        <form action="${pageContext.request.contextPath}/tienda/fabricantes" method="GET">
			<label for="ordenarPor"></label>
            <select name="campo" id="ordenarPor">
                <option value="nombre">Nombre</option>
                <option value="codigo">Codigo</option>
            </select>

            <label for="ordenacion"></label>
            <select name="como" id="ordenacion">
                <option value="ascendente">Ascendente</option>
                <option value="descendente">Descendente</option>
            </select>

            <button type="submit">Ordenar</button>
        </form>
    </div>

    <div class="clearfix">
        <hr/>
    </div>
    <div class="clearfix">
        <div style="float: left;width: 20%">Código</div>
        <div style="float: left;width: 20%">Nombre</div>
        <div style="float: left;width: 20%">Nº Productos</div>
        <div style="float: none;width: auto;overflow: hidden;">Acción</div>
    </div>
    <div class="clearfix">
        <hr/>
    </div>
    <%
        if (request.getAttribute("listaFabricantes") != null) {
            List<FabricanteDTO> listaFabricante = (List<FabricanteDTO>) request.getAttribute("listaFabricantes");

            for (FabricanteDTO fabricante : listaFabricante) {
    %>

    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left;width: 22%"><%= fabricante.getIdFabricante()%>
        </div>
        <div style="float: left;width: 22%"><%= fabricante.getNombre()%>
        </div>
        <div style="float: left;width: 22%"><%= fabricante.getCountProductos()%>
        </div>
        <div style="float: none;width: auto;overflow: hidden;">
            <form action="${pageContext.request.contextPath}/tienda/fabricantes/<%= fabricante.getIdFabricante()%>"
                  style="display: inline;">
                <input type="submit" value="Ver Detalle"/>
            </form>
            <form action="${pageContext.request.contextPath}/tienda/fabricantes/editar/<%= fabricante.getIdFabricante()%>"
                  style="display: inline;">
                <input type="submit" value="Editar"/>
            </form>
            <form action="${pageContext.request.contextPath}/tienda/fabricantes/borrar/" method="post"
                  style="display: inline;">
                <input type="hidden" name="__method__" value="delete"/>
                <input type="hidden" name="codigo" value="<%= fabricante.getIdFabricante()%>"/>
                <input type="submit" value="Eliminar"/>
            </form>
        </div>
    </div>

    <%
        }
    } else {
    %>
    No hay registros de fabricante
    <% } %>
</div>
</body>
</body>

<%@ include file="/WEB-INF/jsp/formato/footer.jspf" %>

</html>