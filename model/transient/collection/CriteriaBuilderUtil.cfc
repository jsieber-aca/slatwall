component  hint="Utility function for using the criteriaBuilder" persistent="false" accessors="true"     
{
	function init(){
		return this;
	}
	
	any function cast(any value, any type){
		return javaCast(arguments.type, arguments.value); 
	}
}