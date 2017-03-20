<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   <%--CARRUSEL--%>

    <div class="container--head">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <div class="carousel-tooltip">
          <div class="caraousel-tooltip-item active" data-index="0">
          </div>
          <div class="caraousel-tooltip-item" data-index="1">
          </div>
          <div class="caraousel-tooltip-item" data-index="2">
          </div>
          <div class="caraousel-tooltip-item" data-index="3">
          </div>
          <div class="caraousel-tooltip-item" data-index="4">
          </div>
          <div class="caraousel-tooltip-item" data-index="5">
          </div>
        </div>

        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          <li data-target="#carousel-example-generic" data-slide-to="3"></li>
          <li data-target="#carousel-example-generic" data-slide-to="4"></li>
          <li data-target="#carousel-example-generic" data-slide-to="5"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="Inicio/Carrusel/01.jpg" alt="..." style="width:100%"/>
              <div class="carousel-caption">
                <h3>Viaje confortablemente</h3>
              </div>
              </div>
            <div class="item">
              <img src="Inicio/Carrusel/02.jpg" alt="..." style="width:100%"/>
                <div class="carousel-caption">
                  <h3>Asientos cómodos y reclinables</h3>
                </div>
                </div>
              <div class="item">
                <img src="Inicio/Carrusel/03.jpg" alt="..." style="width:100%"/>
                  <div class="carousel-caption">
                    <h3>Máxima seguridad por monitoreo satelital</h3>
                  </div>
                  </div>
                <div class="item">
                  <img src="Inicio/Carrusel/04.jpg" alt="..." style="width:100%"/>
                    <div class="carousel-caption">
                      <h3>Alarma anti-asalto</h3>
                    </div>
                    </div>
                  <div class="item">
                    <img src="Inicio/Carrusel/05.jpg" alt="..." style="width:100%"/>
                      <div class="carousel-caption">
                        <h3>Conexión a internet</h3>
                      </div>
                      </div>
                  <div class="item">
                    <img src="Inicio/Carrusel/06.jpg" alt="..." style="width:100%"/>
                      <div class="carousel-caption">
                        <h3>Televisión LED, reproductor DVD</h3>
                      </div>
                      </div>
                  </div>

                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                  </a>
                </div>
              </div>

    <%--FIN CARRUSEL--%>

</asp:Content>

