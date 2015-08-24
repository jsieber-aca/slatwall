/** wraps the transformers hibernate class with helper methods to make it easier to deal will collections*/
component  output="true" accessors="true" displayname="CriteriaBuilderTransformers" hint="This is a wrapper for the hibernate criteria builder" persistent="false"  
{
	property name="errors" type="array";
	property name="transformers" type="any";
	
	public CriteriaBuilderTransformers function init(){
		//Gets a list of all restrictions methods from hibernate
		try{
		  transformers = createObject("java", "org.hibernate.transform.Transformers");
		}catch(any e){
			errors[1] = e;
		}
		return this;
	}
	public any function aliasToBean(any class){
		return transformers.aliasToBean(arguments.class);
	}
    
}

