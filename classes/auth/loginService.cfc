<cfcomponent>
	<!--- Login --->
	<cffunction name="doLogin" access="remote" returntype="any" returnformat="json">
		<cfargument name="proEmail" type="string" required="true"/>
		<cfargument name="proPassword" type="string" required="true"/>

		<!--- Get data from db --->
		<cfquery name="rsLoginUser" datasource="emrdb">
			SELECT providersData.profname, providersData.prolname, providersData.providerid, providersData.proemail, providersData.propassword
			FROM providersData WHERE providersData.proemail = '#arguments.proEmail#'
			AND providersData.propassword = '#arguments.proPassword#'
		</cfquery>
		<cfset var isLoggedIn = false>
		<!--- should only get one user --->
		<cfif rsLoginUser.recordCount EQ 1>
			<!--- log user in --->
			<cflogin>
				<cfloginuser name='#rsLoginUser.profname#' password='#rsLoginUser.propassword#' roles="user">
			</cflogin>
			<!--- save in the session (important) --->
			<cfset session.providerEmail = rsLoginUser.proemail/>
			<cfset session.userFname = rsLoginUser.profname/>
			<cfset session.userLname = rsLoginUser.prolname/>
			<!--- change logged in variable to true --->
			<cfset isLoggedIn=true/>
		</cfif>

		<!--- retruned aforementioned variable --->
		<cfreturn isLoggedIn>
	</cffunction>
</cfcomponent>
