component extends="app.controllers.Controller" {

	function config() {
		super.config(restrictAccess=true);
		verifies(except="index,show", params="key", paramsTypes="integer", handler="objectNotFound");
		filters(through="getFilterTypes", only="index");
		filters(through="isAjaxRequest", only="show");
		provides("html,json");
		//usesLayout(template=false, only="show");
	}

	/**
	* View all logs
	**/
	function index() {
		param name="params.q" default="";
		param name="params.type" default="";
		param name="params.severity" default="";
		param name="params.page" default=1;
		param name="params.perpage" default=50;
		local.where=[];
		if(len(params.type)){
			arrayAppend(local.where, "type = '#params.type#'");
		}
		if(len(params.severity)){
			arrayAppend(local.where, "severity = '#params.severity#'");
		}
		if(len(params.q)){
			local.qWhere=[];
			var sanitizedQ=stripTags(params.q);

			if(len(params.q) GT 50){
				params.q = "";
			} else {
				arrayAppend(local.qWhere, "message LIKE '%#params.q#%'");
				arrayAppend(local.where, whereify(local.qWhere, "OR"));
			}
		}
		auditlogs=model("auditlog").findAll(where=whereify(local.where), order="createdAt DESC", perpage=params.perpage, page=params.page);
	}

	/**
	* Show Log Detail via AJAX JSON
	**/
	function show() {
		log = model("auditlog").findByKey(params.key);
		renderWith(data=deserializeJSON(log.data));
	}

	/**
	* Get Filter Data
	**/
	private function getFilterTypes(){
		logtypes = model("auditlog").findAll(select="DISTINCT type AS logtype");
		severitytypes = model("auditlog").findAll(select="DISTINCT severity AS severitytype");
	}
	/**
	* Redirect away if verifies fails, or if an object can't be found
	**/
	private function objectNotFound() {
		redirectTo(action="index", error="That permission wasn't found");
	}

}
