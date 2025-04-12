<cfoutput>
#pageHeader(title="Edit Setting", btn=linkTo(route="settings", text="<i class='fa fa-chevron-left'></i> Cancel", class="btn btn-info btn-xs", encode="attributes"))#

	#startFormTag(route="settings-update", key=setting.key(), method="put")#
		#includePartial("form")#
		#submitTag()#
	#endFormTag()#
</cfoutput>
