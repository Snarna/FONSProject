<cfcomponent output="false">
  <cffunction name="loadmodalpreview" access="remote" returnformat="json" returnType="any">
    <cfargument name="surveyId" type="string" required="true">
    <cfset var hi = #surveyId#>
    <cfreturn hi>
  </cffunction>
</cfcomponent>
