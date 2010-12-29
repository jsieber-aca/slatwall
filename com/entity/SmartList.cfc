component displayname="Smart List" accessors="true" persistent="false" {
	
	property name="entityName" type="string" hint="This is the base entity that the list is based on.";
	property name="entityMetaData" type="struct" hint="This is the meta data of the base entity.";

	property name="filters" type="struct" hint="This struct holds any filters that are set on the entities properties";
	property name="ranges" type="struct" hint="This struct holds any ranges set on any of the entities properties";
	property name="orders" type="array" hint="This struct holds the display order specification based on property";
	
	property name="keywordProperties" type="struct" hint="This struct holds the properties that searches reference and their relative weight";
	property name="keywords" type="array" hint="This array holds all of the keywords that were searched for";
	
	property name="entityStart" type="numeric" hint="This represents the first record to display and it is used in paging.";
	property name="entityShow" type="numeric" hint="This is the total number of entities to display";
	
	property name="entityEnd" type="numeric" hint="This represents the last record to display and it is used in paging.";
	property name="currentPage" type="numeric" hint="This is the current page that the smart list is displaying worth of entities";
	property name="totalPages" type="numeric" hint="This is the total number of pages worth of entities";
		
	property name="queryRecords" type="query" hint="This is the raw query records.  Either this is used or the entityRecords is uesed";
	property name="entityRecords" type="array" hint="This is the raw array of records.  Either this is used or the queryRecords is used";
	
	property name="entityArray" type="array" hint="This is the completed array of entities after filter, range, order, keywords and paging.";	

	public any function init(struct rc, required string entityName) {
		// Set defaults for the main properties
		setFilters(structNew());
		setRanges(structNew());
		setOrders(arrayNew(1));
		setKeywordProperties(structNew());
		setKeywords(arrayNew(1));
		setEntityStart(1);
		setEntityShow(10);
		
		setQueryRecords(queryNew('empty'));
		setEntityRecords(arrayNew(1));
		
		// Set entity name based on whatever
		setEntityName(arguments.entityName);
		
		if(isDefined("arguments.rc")) {
			applyRC(rc=arguments.RC);
		}
		
		return this;
	}
	
	public numeric function getEntityEnd() {
		variables.entityEnd = getEntityStart() + getEntityShow() - 1;
		if(variables.entityEnd > arrayLen(variables.records)) {
			variables.entityEnd = arrayLen(variables.records);
		}
		return variables.entityEnd;
	}
	
	public numeric function currentPage() {
	
	}
	
	public numeric function totalPages() {
	
	}
	
	public void function addFilter(required string property, required string value) {
		var filterProperty = getValidHQLProperty(rawProperty=arguments.property);
		if(filterProperty != "") {
			for(var i=1; i <= listLen(arguments.value, "^"); i++) {
				var filterValue = getValidHQLPropertyValue(rawProperty=arguments.property, value=listGetAt(arguments.value, i, "^"));
				if(filterValue != "") {
					if(structKeyExists(variables.filters, filterProperty)) {
						variables.filters[filterProperty] = "#variables.filters[filterProperty]#^#filterValue#";
					} else {
						structInsert(variables.filters, filterProperty, filterValue);
					}
				}
			}
		}
	}
	
	public void function addRange(required string property, required string value) {
		var rangeProperty = getValidHQLProperty(rawProperty=arguments.property);
		if(rangeProperty != "") {
			if(Find("^", arguments.value)) {
				var lowerRange = getValidHQLPropertyValue(rawProperty=arguments.property, value=Left(arguments.value, Find("^", arguments.value)-1));
				var upperRange = getValidHQLPropertyValue(rawProperty=arguments.property, value=Right(arguments.value, Len(arguments.value) - Find("^", arguments.value)));
				if(isNumeric(lowerRange) && isNumeric(upperRange) && lowerRange <= upperRange) {
					if(structKeyExists(variables.filters, rangeProperty)) {
						variables.ranges[rangeProperty] = "#lowerRange#^#upperRange#";
					} else {
						structInsert(variables.ranges, rangeProperty, "#lowerRange#^#upperRange#");
					}
				}
			}
		}
	}
	
	public void function addOrder(required string orderStatement, numeric position) {
		var orderStruct = structNew();
		var orderProperty = getValidHQLProperty(rawProperty=Left(arguments.orderStatement, Find("|", arguments.orderStatement)-1));
		writeDump(orderProperty);
		if(orderProperty != "") {
			var orderDirection = Right(arguments.orderStatement, Len(arguments.orderStatement) - Find("|", arguments.orderStatement));
			if(orderDirection == "A" || orderDirection == "ASC") {
				orderDirection = "ASC";
			} else if(orderDirection == "D" || orderDirection == "DESC") {
				orderDirection = "DESC";
			} else {
				orderDirection = "";
			}
			if(orderDirection != "") {
				ordertStruct.property = orderProperty;
				ordertStruct.direction = orderDirection;
				if(isDefined("arguments.position") && arguments.position < arrayLen(variables.orders)) {
					arrayInsertAt(variables.orders, ordertStruct, arguments.propertyOrder);
				} else {
					arrayAppend(variables.orders, Duplicate(ordertStruct));
				}
			}
		}
	}
	
	public void function addKeywordProperty(required string property, required string value) {
		structInsert(variables.keywordProperties, arguments.property, arguments.value);
	}
	
	public void function applyRC(required struct rc) {
		for(i in arguments.rc) {
			if(find("F_",i)) {
				addFilter(property=Replace(i,"F_", ""), value=arguments.rc[i]);
			} else if(find("R_",i)) {
				addRange(property=Replace(i,"R_", ""), value=arguments.rc[i]);
			} else if(find("E_Show",i)) {
				setEntityShow(arguments.rc[i]);
			} else if(find("E_Start",i)) {
				setEntityStart(arguments.rc[i]);
			} else if(findNoCase("OrderBy",i)) {
				for(var ii=1; ii <= listLen(arguments.rc[i], "^"); ii++ ) {
					addOrder(orderStatement=listGetAt(arguments.rc[i], ii, "^"));
				}
			}
			
		}
		if(isDefined("rc.Keyword")){
			var KeywordList = Replace(arguments.rc.Keyword," ","^","all");
			KeywordList = Replace(KeywordList,"%20","^","all");
			KeywordList = Replace(KeywordList,"+","^","all");
			for(var i=1; i <= listLen(KeywordList, "^"); i++) {
				arrayAppend(variables.Keywords, listGetAt(KeywordList, i, "^"));
			}
		}
	}
	
	
	public struct function getEntityMetaData() {
		if(!isDefined("variables.entityMetaData")) {
			variables.entityMetaData = getMetadata(entityNew(getEntityName()));
		}
		return variables.entityMetaData;
	}
	
	private string function getValidHQLProperty(required string rawProperty) {
		var entityProperties = getEntityMetaData().properties;
		var returnProperty = "";

		for(var i=1; i <= arrayLen(entityProperties); i++){
			if(entityProperties[i].name == arguments.rawProperty) {
				returnProperty = "a#getEntityName()#.#entityProperties[i].name#";
				break;
			}
		}
		
		return returnProperty;
	}
	
	private string function getValidHQLPropertyValue(required string rawProperty, required any value) {
		var entityProperties = getEntityMetaData().properties;
		var returnValue = "";
		for(var i=1; i <= arrayLen(entityProperties); i++){
			if(entityProperties[i].name == arguments.rawProperty) {
				if(entityProperties[i].type == "string") {
					returnValue = "'#arguments.value#'";
				} else if (entityProperties[i].type == "numeric" && isNumeric(arguments.value)) {
					returnValue = arguments.value;
				} else if (entityProperties[i].type == "boolean" && (arguments.value == 1 || arguments.value == true || arguments.value == "yes")) {
					returnValue = 1;
				} else if (entityProperties[i].type == "boolean" && (arguments.value == 0 || arguments.value == false || arguments.value == "no")) {
					returnValue = 0;
				}
				break;
			}
		}
		return returnValue;
	}
	
	public string function getHQLWhereOrder(boolean suppressWhere) {
		var returnWhereOrder = "";
		
		// Check to see if any Filters, Ranges or Keyword requirements exist.  If not, don't create a where
		if(structCount(variables.Filters) || structCount(variables.Ranges) || arrayLen(variables.Keywords)) {
			
			var CurrentFilter = 0;
			var CurrentFilterValue = 0;
			var CurrentRange = 0;
			
			if(isDefined("arguments.suppressWhere") && arguments.suppressWhere) {
				returnWhereOrder = "AND";
			} else if (structCount(variables.filters) > 0 || structCount(variables.ranges) > 0) {
				returnWhereOrder = "WHERE";
			}
			
			// Add any filters to the returnWhereOrder
			for(filter in variables.filters) {
				currentFilter = currentFilter + 1;
				currentFilterValue = 0;
				
				for(var i=1; i <= listLen(variables.filters[filter], "^"); i++) {
				
					var filterValue = listGetAt(variables.filters[filter], i, "^");
					currentFilterValue = currentFilterValue + 1;
				
					if(currentFilter > 1 && currentFilterValue == 1) {
						returnWhereOrder &= " AND (";
					} else if (currentFilterValue == 1) {
						returnWhereOrder &= " (";
					} else if (currentFilterValue > 1) {
						returnWhereOrder &= " OR";
					}
				
					returnWhereOrder &= " #filter# = #filterValue#";
					
					if (currentFilterValue == listLen(variables.filters[filter], "^")) {
						returnWhereOrder &= " )";
					}
				}
			}
			
			// Add any ranges to returnWhereOrder
			for(range in variables.ranges) {
				if(Find("^", variables.ranges[range])) {
					var lowerRange = Left(variables.ranges[range], Find("^", variables.ranges[range])-1);
					var upperRange = Right(variables.ranges[range], Len(variables.ranges[range]) - Find("^", variables.ranges[range]));
					currentRange = currentRange + 1;
					if(currentRange > 1 || currentFilter > 0) {
						returnWhereOrder &= " AND";
					}
					returnWhereOrder &= " (#range# >= #lowerRange# and #range# <= #upperRange#)";
				}
			}
			
			// Add Keywords to returnWhereOrder
			
		}
		
		// Add Order to returnWhereOrder
		if(arrayLen(variables.orders)) {
			returnWhereOrder &= " ORDER BY ";
			for(var i=1; i <= arrayLen(variables.orders); i++) {
				returnWhereOrder &= " #variables.orders[i].property# #variables.orders[i].direction#";
				if(i < arrayLen(variables.orders)) {
					returnWhereOrder &= ",";
				}
			}
		}
		
		return returnWhereOrder;
	}

	public void function setRecords(required any records) {
		variables.records = arrayNew(1);
		
		if(isArray(arguments.records)) {
			variables.records = arguments.records;
		} else if (isQuery(arguments.records)) {
			for(var i=1; i <= arguments.records.recordcount; i++) {
				var entity = entityNew(getEntityName());
				entity.set(arguments.records[i]);
				arrayAppend(variables.records, entity);
			}
		}
		
		// Apply Search Score to Entites
		if(arrayLen(variables.keywords)) {
			applySearchScore();
		}
		
		applyOrder();
	}
	
	public void function applySearchScore(){
		for(var i=1; i <= arrayLen(variables.records); i++) {
			var score = 0;
			for(property in keywordProperties) {
				if(!find("_", property)) {
				for(var ki=1; ki <= arrayLen(variables.keywords); ki++) {
					var findValue = FindNoCase(variables.keywords[ki], evaluate("variables.records[i].get#property#()"), 0);
					while(findValue > 0) {
						var score = score + (len(variables.keywords[ki]) * variables.keywordProperties[property]);
						findValue = FindNoCase(variables.keywords[ki],  evaluate("variables.records[i].get#property#()"), findValue+1);
					}
				}
				}
				
			}
			variables.records[i].setSearchScore(score);
		}
	}
	
	public void function applyOrder() {
		// Loop over the records array
		for(var i=1; i <= arrayLen(variables.records); i++) {
		}
		
		// Add Code to organize by Order & SearchScore.
	}
	
	public array function getEntityArray(boolean refresh) {
		if(!isDefined("variables.entityArray") || arrayLen(variables.entityArray) == 0 || (isDefined("arguments.refresh") && arguments.refresh == true)) {
			variables.entityArray = arrayNew(1);
			for(var i=getEntityStart(); i<=getEntityEnd(); i++) {
				arrayAppend(variables.entityArray, variables.records[i]);
			}
		}
		return variables.entityArray;
	}
	
}