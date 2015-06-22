

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top ">
<div class="container-fluid">

	<div class="navbar-header page-scroll">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>

		<a class="navbar-brand page-scroll" href="home">Easy Park</a>
	</div>

	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav navbar-right"></ul>

		<ul class="nav navbar-nav navbar-right">
			
<c:catch var ="catchException">
   <% session.getAttribute("id_user").getClass();%>
</c:catch>

<c:if test = "${catchException != null}">
   	<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#" ><span class="glyphicon glyphicon-user"></span>   Inscription</a>
					<ul class="dropdown-menu">
            			<li><a href="inscription?structur=0">En tant que particulier</a></li>
            			<li><a href="inscription?structur=1">En tant que entreprise</a></li>
          			</ul>
				</li>
		<li><a href="connexion"><span class="glyphicon glyphicon-log-in"></span>    Se connecter</a></li>

      <br />
</c:if>
<c:if test  = "${catchException == null}">
<li><a href="mon_profil">    <%= session.getAttribute("email")%></a></li>
 <li><a href="disconnect">Se déconnecter</a></li>
      <br />
</c:if>
		</ul>

	</div>
</div>
</nav>