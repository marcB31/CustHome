<div id="header">
	<p>
	<a class="header-main" href="${resource(dir:'') }">Location de véhicule</a>
	</p>
	<p class="header-sub">Rent a car</p>
	<div class="identite">
		<g:if test="${ session.customer != null }">
		Bonjour ${ session.customer.login }
				<a class="logout" href="${resource(dir:'/customer/logout') }">Logout</a>
		</g:if>
	</div>
</div>