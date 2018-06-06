
<cfparam name="logtypes">
<cfparam name="severitytypes">
<cfoutput>
#startFormTag(route="logs", method="get", class="form-inline mb-2")#
	<div class="row">
	    <div class="col">
	 		#selectTag(name="severity", options=severitytypes, includeBlank="All Levels", selected=params.type, label="Severity", prependToLabel="<div class=""form-group mb-2"">", labelClass="sr-only")#
		</div>
	    <div class="col">
	 		#selectTag(name="type", options=logtypes, includeBlank="All Types", selected=params.type, label="Type", prependToLabel="<div class=""form-group mb-2"">", labelClass="sr-only")#
		</div>

		<div class="col">
			#textFieldTag(name="q", value=params.q, label="Keyword Search", labelClass="sr-only", placeholder="Keyword")#
		</div>

	    <div class="col">
			#submitTag(value="Filter", class="btn btn-info")#
		</div>
	</div>
#endFormTag()#
</cfoutput>
